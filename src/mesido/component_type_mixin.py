import logging
from typing import Dict, Set

from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.heat_network_common import NodeConnectionDirection
from mesido.topology import Topology

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
        try:
            pipes = components["heat_pipe"]
            cables = components.get("electricity_cable", [])
            gas_pipes = components.get("gas_pipe", [])
        except KeyError:
            try:
                cables = components["electricity_cable"]
                gas_pipes = components.get("gas_pipe", [])
                pipes = []
            except KeyError:
                try:
                    cables = []
                    gas_pipes = components["gas_pipe"]
                    pipes = []
                except KeyError:
                    logger.error(
                        "A valid network should have at least one pipe/cable, "
                        "assets cannot be connected directly"
                    )

        # Figure out which pipes are connected to which nodes, which pipes
        # are connected in series, and which pipes are connected to which buffers.

        pipes_set = set(pipes)
        cables_set = set(cables)
        gas_pipes_set = set(gas_pipes)
        parameters = [self.parameters(e) for e in range(self.ensemble_size)]
        node_connections = {}
        bus_connections = {}
        gas_node_connections = {}

        # Figure out if we are dealing with a Heat model, or a QTH model
        try:
            if len(pipes):
                _ = self.variable(f"{pipes[0]}.HeatIn.Heat")
                heat_network_model_type = "Heat"
            else:
                heat_network_model_type = "Heat"
        except KeyError:
            heat_network_model_type = "QTH"

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
                    prop = "T" if heat_network_model_type == "QTH" else "Heat"
                    in_suffix = ".QTHIn.T" if heat_network_model_type == "QTH" else ".HeatIn.Heat"
                    out_suffix = (
                        ".QTHOut.T" if heat_network_model_type == "QTH" else ".HeatOut.Heat"
                    )
                elif n in busses:
                    cur_port = f"{n}.ElectricityConn[{i + 1}]"
                    prop = "Power"
                    in_suffix = ".ElectricityIn.Power"
                    out_suffix = ".ElectricityOut.Power"
                elif n in gas_nodes:
                    # TODO: Ideally a temporary variable would be created to make the connections
                    #  map that is not passed to the problem
                    cur_port = f"{n}.GasConn[{i + 1}]"
                    prop = "Q_shadow"
                    in_suffix = ".GasIn.Q_shadow"
                    out_suffix = ".GasOut.Q_shadow"
                aliases = [
                    x
                    for x in self.alias_relation.aliases(f"{cur_port}.{prop}")
                    if not x.startswith(n) and x.endswith(f".{prop}")
                ]

                if len(aliases) > 1:
                    raise Exception(f"More than one connection to {cur_port}")
                elif len(aliases) == 0:
                    raise Exception(f"Found no connection to {cur_port}")

                if aliases[0].endswith(out_suffix):
                    pipe_w_orientation = (
                        aliases[0][: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                else:
                    assert aliases[0].endswith(in_suffix)
                    pipe_w_orientation = (
                        aliases[0][: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )

                assert (
                    pipe_w_orientation[0] in pipes_set
                    or pipe_w_orientation[0] in cables_set
                    or pipe_w_orientation[0] in gas_pipes_set
                )

                connected_pipes[i] = pipe_w_orientation

        # Note that a pipe series can include both hot and cold pipes for
        # QTH models. It is only about figuring out which pipes are
        # related direction-wise.
        # For Heat models, only hot pipes are allowed to be part of pipe
        # series, as the cold part is zero milp by construction.
        if heat_network_model_type == "QTH":
            alias_relation = self.alias_relation
        elif heat_network_model_type == "Heat":
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
                prop = "T" if heat_network_model_type == "QTH" else "Heat"
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
                    pipe_w_orientation = (
                        alias[: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                else:
                    assert alias.endswith(in_suffix)
                    pipe_w_orientation = (
                        alias[: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )

                assert pipe_w_orientation[0] in pipes_set

                if k == "In":
                    assert self.is_hot_pipe(pipe_w_orientation[0])
                else:
                    assert self.is_cold_pipe(pipe_w_orientation[0])

                buffer_connections[b].append(pipe_w_orientation)

            buffer_connections[b] = tuple(buffer_connections[b])

        ates_connections = {}

        for a in atess:
            ates_connections[a] = []

            for k in ["In", "Out"]:
                a_conn = f"{a}.{heat_network_model_type}{k}"
                prop = "T" if heat_network_model_type == "QTH" else "Heat"
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
                    pipe_w_orientation = (
                        aliases[0][: -len(out_suffix)],
                        NodeConnectionDirection.IN,
                    )
                else:
                    assert aliases[0].endswith(in_suffix)
                    pipe_w_orientation = (
                        aliases[0][: -len(in_suffix)],
                        NodeConnectionDirection.OUT,
                    )

                assert pipe_w_orientation[0] in pipes_set

                if k == "Out":
                    assert self.is_cold_pipe(pipe_w_orientation[0])
                else:
                    assert self.is_hot_pipe(pipe_w_orientation[0])

                ates_connections[a].append(pipe_w_orientation)

            ates_connections[a] = tuple(ates_connections[a])

        self.__topology = Topology(
            node_connections,
            gas_node_connections,
            pipe_series,
            buffer_connections,
            ates_connections,
            bus_connections,
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
            component_types = sorted({v for k, v in string_parameters.items()})

            components = {}
            for c in component_types:
                components[c] = sorted(
                    {k.split(".")[0] for k, v in string_parameters.items() if v == c}
                )

            self.__hn_component_types = components

        return self.__hn_component_types

    @property
    def energy_system_topology(self) -> Topology:
        """
        This method returns the topology object of the milp network. Which contains specific assets
        with directions on the ports that are needed in the constraints.
        """
        return self.__topology
