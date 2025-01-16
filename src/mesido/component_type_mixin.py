import logging
from typing import Dict, Set

from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.heat_network_common import NodeConnectionDirection
from mesido.network_common import NetworkSettings
from mesido.topology import Topology

import numpy as np

from pymoca.backends.casadi.alias_relation import AliasRelation

logger = logging.getLogger("mesido")


class ModelicaComponentTypeMixin(BaseComponentTypeMixin):
    """
    This class is used to make the milp network component information easily accesible in the
    heat_mixin. This is achieved by creating a heat_network_components dict where the assets are
    sorted by asset_type. Furthermore, the topology object is created in which for specific assets
    the connections with directions are saved for later use in the constraints.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(**kwargs)
        self.__hn_component_types = None
        self.__commodity_types = None

    def pre(self):
        """
        In this function the topology object of the milp network is constructed. Meaning that for
        nodes, busses and storage assets their relevant information on the positive flow direction
        and connections on the ports is gathered and stored in the topology object.
        """
        components = self.energy_system_components
        nodes = components.get("node", [])
        busses = components.get("electricity_node", [])
        gas_nodes = components.get("gas_node", [])
        buffers = components.get("heat_buffer", [])
        atess = [*components.get("ates", []), *components.get("low_temperature_ates", [])]
        demands = [
            *components.get("heat_demand", []),
            *components.get("electricity_demand", []),
            *components.get("gas_demand", []),
        ]
        sources = [
            *components.get("heat_source", []),
            *components.get("electricity_source", []),
            *components.get("gas_source", []),
        ]
        pipes = components.get("heat_pipe", [])

        # An energy system should have at least one asset.
        assert len(components) > 1

        # Figure out which pipes are connected to which nodes, which pipes
        # are connected in series, and which pipes are connected to which buffers.

        pipes_set = set(pipes)
        parameters = [self.parameters(e) for e in range(self.ensemble_size)]
        node_connections = {}
        bus_connections = {}
        gas_node_connections = {}

        heat_network_model_type = NetworkSettings.NETWORK_TYPE_HEAT

        # Note that a pipe series can include both hot and cold pipes for
        # QTH models. It is only about figuring out which pipes are
        # related direction-wise.
        # For Heat models, only hot pipes are allowed to be part of pipe
        # series, as the cold part is zero milp by construction.
        if heat_network_model_type == "QTH":
            alias_relation = self.alias_relation
        elif heat_network_model_type == NetworkSettings.NETWORK_TYPE_HEAT:
            # There is no proper AliasRelation yet (because there is milp loss in pipes).
            # So we build one, as that is the easiest way to figure out which pipes are
            # connected to each other in series. We do this by making a temporary/shadow
            # discharge (".Q") variable per pipe, as that way we can share the processing
            # logic for determining pipe series with that of QTH models.
            alias_relation = AliasRelation()

            # Look for aliases only in the hot pipes. All cold pipes are zero by convention anyway.
            hot_pipes = self.hot_pipes.copy()

            pipes_map = {f"{pipe}.HeatIn.Heat": pipe for pipe in hot_pipes}
            pipes_map.update({f"{pipe}.HeatOut.Heat": pipe for pipe in hot_pipes})

            for p in hot_pipes:
                for port in ["In", "Out"]:
                    heat_port = f"{p}.Heat{port}.Heat"
                    connected = self.alias_relation.aliases(heat_port).intersection(
                        pipes_map.keys()
                    )
                    connected.remove(heat_port)

                    if connected:
                        other_pipe_port = next(iter(connected))
                        if other_pipe_port.endswith(f".Heat{port}.Heat"):
                            sign_prefix = "-"
                        else:
                            sign_prefix = ""
                        other_pipe = pipes_map[other_pipe_port]
                        if f"{other_pipe}.Q" not in alias_relation.canonical_variables:
                            alias_relation.add(f"{p}.Q", f"{sign_prefix}{other_pipe}.Q")

        node_to_node_logical_link_map = {}

        for n in [*nodes, *busses, *gas_nodes]:
            n_connections = [ens_params[f"{n}.n"] for ens_params in parameters]

            if len(set(n_connections)) > 1:
                raise Exception(
                    "Nodes and busses cannot have differing number of connections per "
                    "ensemble member"
                )

            n_connections = n_connections[0]

            # Note that we do this based on temperature, because discharge may
            # be an alias of yet some other further away connected pipe.
            if n in nodes:
                node_connections[n] = connected_pipes = {}
            elif n in busses:
                bus_connections[n] = connected_pipes = {}
            elif n in gas_nodes:
                gas_node_connections[n] = connected_pipes = {}

            for i in range(n_connections):
                if n in nodes:
                    cur_port = f"{n}.{heat_network_model_type}Conn[{i + 1}]"
                    prop = (
                        "T"
                        if heat_network_model_type == "QTH"
                        else NetworkSettings.NETWORK_TYPE_HEAT
                    )
                    prop_h = "H"
                    in_suffix = ".QTHIn.T" if heat_network_model_type == "QTH" else ".HeatIn.Heat"
                    out_suffix = (
                        ".QTHOut.T" if heat_network_model_type == "QTH" else ".HeatOut.Heat"
                    )
                    in_suffix_h = ".HeatIn.H"
                    out_suffix_h = ".HeatOut.H"
                    node_suffix = ".HeatConn[1].Heat"
                elif n in busses:
                    cur_port = f"{n}.ElectricityConn[{i + 1}]"
                    prop = "Power"
                    prop_h = "V"
                    in_suffix = ".ElectricityIn.Power"
                    out_suffix = ".ElectricityOut.Power"
                    in_suffix_h = ".ElectricityIn.V"
                    out_suffix_h = ".ElectricityOut.V"
                    node_suffix = ".ElectricityConn[1].Power"
                elif n in gas_nodes:
                    # TODO: Ideally a temporary variable would be created to make the connections
                    #  map that is not passed to the problem
                    cur_port = f"{n}.GasConn[{i + 1}]"
                    prop = "Q"
                    prop_h = "H"
                    in_suffix = ".GasIn.Q"
                    out_suffix = ".GasOut.Q"
                    in_suffix_h = ".GasIn.H"
                    out_suffix_h = ".GasOut.H"
                    node_suffix = ".GasConn[1].Q"
                aliases = [
                    x
                    for x in self.alias_relation.aliases(f"{cur_port}.{prop}")
                    if not x.startswith(n) and x.endswith(f".{prop}")
                ]

                if len(aliases) == 0:
                    raise Exception(f"Found no connection to {cur_port}")

                # Here we make a count of the amount of in and out port aliases.
                in_suffix_count = np.sum([1 if x.endswith(in_suffix) else 0 for x in aliases])
                out_suffix_count = np.sum([1 if x.endswith(out_suffix) else 0 for x in aliases])

                # Here we gather the aliases for a property that is equal for all node ports.
                aliases_h = [
                    x
                    for x in self.alias_relation.aliases(f"{cur_port}.{prop_h}")
                    if not x.startswith(n) and x.endswith(f".{prop_h}")
                ]
                pipe_out_port = False
                # We can have multiple aliases, specifically when a pipe is connected to a port the
                # direction of that pipe matters. To determine if the connected alias is a pipe and
                # which direction it has we look for the overlap between the prop and prop_h in the
                # aliases. This means that if a pipe is both in the aliases and in the aliases_h,
                # then that must be the pipe connected to the port of the node.
                for k in range(len(aliases)):
                    pipe_name = aliases[k].split(".")[0]
                    if pipe_name + out_suffix_h in aliases_h:
                        pipe_out_port = True
                        node_connection_direction = NodeConnectionDirection.IN
                    elif pipe_name + in_suffix_h in aliases_h:
                        pipe_out_port = True
                        node_connection_direction = NodeConnectionDirection.OUT

                if pipe_out_port:
                    # This is only for when a pipe is connected to a gas node to determine direction
                    asset_w_orientation = (
                        pipe_name,
                        node_connection_direction,
                    )
                elif out_suffix_count > in_suffix_count:
                    # This is for the case of Non pipe asset is logically linked to a node
                    asset_w_orientation = (
                        aliases[0][: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                elif out_suffix_count < in_suffix_count:
                    # This is for the case of Non pipe asset is logically linked to a node
                    asset_w_orientation = (
                        aliases[0][: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )
                elif out_suffix_count == in_suffix_count:
                    # This is for the case of logical links between node to node
                    # Note that we cannot determine the direction of node to node logical links, we
                    # therefore, always take the first node with an in port and the second node with
                    # and out port.
                    if n not in list(node_to_node_logical_link_map.values()):
                        node_to_node_logical_link_map[n] = aliases[0][: -len(node_suffix)]
                        asset_w_orientation = (
                            aliases[0][: -len(node_suffix)],
                            NodeConnectionDirection.IN,
                        )
                    else:
                        asset_w_orientation = (
                            aliases[0][: -len(node_suffix)],
                            NodeConnectionDirection.OUT,
                        )
                else:
                    logger.error("connections are not properly matched")

                connected_pipes[i] = asset_w_orientation

        canonical_pipe_qs = {p: alias_relation.canonical_signed(f"{p}.Q") for p in pipes}
        # Move sign from canonical to alias
        canonical_pipe_qs = {(p, d): c for p, (c, d) in canonical_pipe_qs.items()}
        # Reverse the dictionary from `Dict[alias, canonical]` to `Dict[canonical, Set[alias]]`
        pipe_sets = {}
        for a, c in canonical_pipe_qs.items():
            pipe_sets.setdefault(c, []).append(a)

        pipe_series_with_orientation = list(pipe_sets.values())

        # Check that all pipes in the series have the same orientation
        pipe_series = []
        for ps in pipe_series_with_orientation:
            if not len({orientation for _, orientation in ps}) == 1:
                raise Exception(f"Pipes in series {ps} do not all have the same orientation")
            pipe_series.append([name for name, _ in ps])

        buffer_connections = {}

        for b in buffers:
            buffer_connections[b] = []

            for k in ["In", "Out"]:
                b_conn = f"{b}.{heat_network_model_type}{k}"
                prop = (
                    "T" if heat_network_model_type == "QTH" else NetworkSettings.NETWORK_TYPE_HEAT
                )
                aliases = [
                    x
                    for x in self.alias_relation.aliases(f"{b_conn}.{prop}")
                    if not x.startswith(b) and x.endswith(f".{prop}")
                ]

                if len(aliases) > 1:
                    raise Exception(f"More than one connection to {b_conn}")
                elif len(aliases) == 0:
                    raise Exception(f"Found no connection to {b_conn}")

                in_suffix = ".QTHIn.T" if heat_network_model_type == "QTH" else ".HeatIn.Heat"
                out_suffix = ".QTHOut.T" if heat_network_model_type == "QTH" else ".HeatOut.Heat"
                alias = aliases[0]
                if alias.endswith(out_suffix):
                    asset_w_orientation = (
                        alias[: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                else:
                    assert alias.endswith(in_suffix)
                    asset_w_orientation = (
                        alias[: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )

                assert asset_w_orientation[0] in pipes_set

                if k == "In":
                    assert self.is_hot_pipe(asset_w_orientation[0])
                else:
                    assert self.is_cold_pipe(asset_w_orientation[0])

                buffer_connections[b].append(asset_w_orientation)

            buffer_connections[b] = tuple(buffer_connections[b])

        ates_connections = {}

        for a in atess:
            ates_connections[a] = []

            for k in ["In", "Out"]:
                a_conn = f"{a}.{heat_network_model_type}{k}"
                prop = (
                    "T" if heat_network_model_type == "QTH" else NetworkSettings.NETWORK_TYPE_HEAT
                )
                aliases = [
                    x
                    for x in self.alias_relation.aliases(f"{a_conn}.{prop}")
                    if not x.startswith(a) and x.endswith(f".{prop}")
                ]

                if len(aliases) > 1:
                    raise Exception(f"More than one connection to {a_conn}")
                elif len(aliases) == 0:
                    raise Exception(f"Found no connection to {a_conn}")

                in_suffix = ".QTHIn.T" if heat_network_model_type == "QTH" else ".HeatIn.Heat"
                out_suffix = ".QTHOut.T" if heat_network_model_type == "QTH" else ".HeatOut.Heat"

                if aliases[0].endswith(out_suffix):
                    asset_w_orientation = (
                        aliases[0][: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                else:
                    assert aliases[0].endswith(in_suffix)
                    asset_w_orientation = (
                        aliases[0][: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )

                assert asset_w_orientation[0] in pipes_set

                if k == "Out":
                    assert self.is_cold_pipe(asset_w_orientation[0])
                else:
                    assert self.is_hot_pipe(asset_w_orientation[0])

                ates_connections[a].append(asset_w_orientation)

            ates_connections[a] = tuple(ates_connections[a])

        demand_connections = {}

        for a in demands:
            if a in components.get("heat_demand", []):
                network_type = NetworkSettings.NETWORK_TYPE_HEAT
                prop = NetworkSettings.NETWORK_TYPE_HEAT
            elif a in components.get("electricity_demand", []):
                network_type = "Electricity"
                prop = "Power"
            elif a in components.get("gas_demand", []):
                network_type = NetworkSettings.NETWORK_TYPE_GAS
                prop = "H"
            else:
                logger.error(f"{a} cannot be modelled with heat, gas or electricity")
            a_conn = f"{a}.{network_type}In"
            aliases = [
                x
                for x in self.alias_relation.aliases(f"{a_conn}.{prop}")
                if not x.startswith(a) and x.endswith(f".{prop}")
            ]

            if len(aliases) > 1:
                raise Exception(f"More than one connection to {a_conn}")
            elif len(aliases) == 0:
                # the connection was a logical link to a node
                continue

            in_suffix = f".{network_type}In.{prop}"
            out_suffix = f".{network_type}Out.{prop}"

            if aliases[0].endswith(out_suffix):
                asset_w_orientation = (
                    aliases[0][: -len(out_suffix)],
                    NodeConnectionDirection.IN,
                )
            else:
                asset_w_orientation = (
                    aliases[0][: -len(in_suffix)],
                    NodeConnectionDirection.OUT,
                )

            if asset_w_orientation[0] in [
                *components.get("heat_pipe", []),
                *components.get("gas_pipe", []),
                *components.get("electricity_cable", []),
            ]:
                demand_connections[a] = asset_w_orientation

        source_connections = {}

        for a in sources:
            if a in components.get("heat_source", []):
                network_type = NetworkSettings.NETWORK_TYPE_HEAT
                prop = NetworkSettings.NETWORK_TYPE_HEAT
            elif a in components.get("electricity_source", []):
                network_type = "Electricity"
                prop = "Power"
            elif a in components.get("gas_source", []):
                network_type = NetworkSettings.NETWORK_TYPE_GAS
                prop = "H"
            else:
                logger.error(f"{a} cannot be modelled with heat, gas or electricity")
            a_conn = f"{a}.{network_type}Out"
            aliases = [
                x
                for x in self.alias_relation.aliases(f"{a_conn}.{prop}")
                if not x.startswith(a) and x.endswith(f".{prop}")
            ]

            if len(aliases) > 1:
                raise Exception(f"More than one connection to {a_conn}")
            elif len(aliases) == 0:
                # the connection was a logical link to a node
                continue

            in_suffix = f".{network_type}In.{prop}"
            out_suffix = f".{network_type}Out.{prop}"

            if aliases[0].endswith(out_suffix):
                asset_w_orientation = (
                    aliases[0][: -len(out_suffix)],
                    NodeConnectionDirection.IN,
                )
            else:
                asset_w_orientation = (
                    aliases[0][: -len(in_suffix)],
                    NodeConnectionDirection.OUT,
                )

            if asset_w_orientation[0] in [
                *components.get("heat_pipe", []),
                *components.get("gas_pipe", []),
                *components.get("electricity_cable", []),
            ]:
                source_connections[a] = asset_w_orientation

        self.__topology = Topology(
            node_connections,
            gas_node_connections,
            pipe_series,
            buffer_connections,
            ates_connections,
            bus_connections,
            demand_connections,
            source_connections,
        )

        super().pre()

    @property
    def energy_system_components(self) -> Dict[str, Set[str]]:
        """
        This method return a dict with the milp network assets ordered per asset type.
        """
        if self.__hn_component_types is None:
            # Create the dictionary once after that it will be available
            string_parameters = self.string_parameters(0)

            # Find the components in model, detection by string
            # (name.component_type: type)
            component_types = sorted(
                {v for k, v in string_parameters.items() if "network_type" not in k}
            )

            components = {}
            for c in component_types:
                components[c] = sorted(
                    {k.split(".")[0] for k, v in string_parameters.items() if v == c}
                )

            self.__hn_component_types = components

        return self.__hn_component_types

    @property
    def energy_system_components_commodity(self) -> Dict[str, Set[str]]:
        """
        This method returns a dict with the milp network assets and their commodity type.
        """
        if self.__commodity_types is None:
            # Create the dictionary once after that it will be available
            string_parameters = self.string_parameters(0)

            # Find the components in model, detection by string
            # (name.component_type: type)
            commodity_types = {
                k.split(".")[0]: v for k, v in string_parameters.items() if "network_type" in k
            }

            self.__commodity_types = commodity_types

        return self.__commodity_types

    @property
    def energy_system_topology(self) -> Topology:
        """
        This method returns the topology object of the milp network. Which contains specific assets
        with directions on the ports that are needed in the constraints.
        """
        return self.__topology
