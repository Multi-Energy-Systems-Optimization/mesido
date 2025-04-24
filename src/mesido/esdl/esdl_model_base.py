import logging
from typing import Dict

import esdl
from esdl import InPort, OutPort

from mesido.esdl.asset_to_component_base import _AssetToComponentBase
from mesido.pycml import Model as _Model

logger = logging.getLogger("mesido")


RETRY_LOOP_LIMIT = 100


class _ESDLModelBase(_Model):
    """
    This is the ESDL base class that is used to convert from the esdl parsed assets to the pycml
    model description. In the base class we specify how the network is connected, meaning which
    asset is connected to which asset as this is the same for different model types (both
    Heat and QTH). Per model type we have a specialization for the converting of the assets as
    different models might need different information from the esdl file.
    """

    primary_port_name_convention = "prim"
    secondary_port_name_convention = "sec"

    def _esdl_convert(
        self, converter: _AssetToComponentBase, assets: Dict, name_to_id_map: Dict, prefix: str
    ) -> None:
        """
        In this function we convert the esdl parsed assets and instantiate the pycml objects for
        those assets. We use the converter to create those pycml objects and the same time we look
        at the connections specified in the esdl and create the relevant maps between ports to then
        also connect the pycml ports of the assets.

        Parameters:
            converter : class with the different converter functions for all asset types.
            assets : a dict with all the parsed esdl assets and their attributes
            prefix : prefix for the name of the model type Heat or QTH at the moment

        """
        # Sometimes we need information of one component in order to convert
        # another. For example, the nominal discharge of a pipe is used to set
        # the nominal discharge of its connected components.
        skip_assets = list()

        transport_asset_types = ["Pipe", "ElectricityCable"]
        assets_transport = {}
        assets_other = {}

        for name, properties in assets.items():
            if properties.asset_type in transport_asset_types:
                assets_transport[name] = properties
            else:
                assets_other[name] = properties

        # We create an assets sorted to first loop over specific assets (the transport assets),
        # before parsing the other assets. This is because the properties of the transport assets
        # are used to set nominals for other assets that are then parsed later.
        assets_sorted = {}
        assets_sorted.update(assets_transport)
        assets_sorted.update(assets_other)
        # TODO: replace when python 3.8 is no longer supported
        # assets_sorted = assets_transport | assets_other

        for asset in list(assets.values()):
            converter.port_asset_type_connections(asset)

        for asset in list(assets_sorted.values()):
            pycml_type, modifiers = converter.convert(asset)
            self.add_variable(pycml_type, asset.name, **modifiers)

        in_suf = "HeatIn"
        out_suf = "HeatOut"
        node_suf = "HeatConn"
        elec_in_suf = "ElectricityIn"
        elec_out_suf = "ElectricityOut"
        elec_node_suf = "ElectricityConn"
        gas_in_suf = "GasIn"
        gas_out_suf = "GasOut"
        gas_node_suf = "GasConn"

        # TODO: check but I think the skip_assets is no longer needed
        skip_asset_ids = {a.id for a in skip_assets}

        node_assets = [
            a
            for a in assets.values()
            if (
                (a.asset_type == "Joint")
                and a.id not in skip_asset_ids
                and (
                    (isinstance(a.in_ports[0].carrier, esdl.HeatCommodity))
                    or isinstance(a.out_ports[0].carrier, esdl.HeatCommodity)
                )
            )
        ]
        gas_node_assets = [
            a
            for a in assets.values()
            if (
                (a.asset_type == "Joint")
                and a.id not in skip_asset_ids
                and (
                    (isinstance(a.in_ports[0].carrier, esdl.GasCommodity))
                    or isinstance(a.out_ports[0].carrier, esdl.GasCommodity)
                )
            )
        ]
        bus_assets = [
            a for a in assets.values() if ((a.asset_type == "Bus") and a.id not in skip_asset_ids)
        ]
        non_node_assets = [
            a
            for a in assets.values()
            if (a.asset_type != "Joint" and a.asset_type != "Bus") and a.id not in skip_asset_ids
        ]

        # First we map all port ids to their respective PyCML ports. We only
        # do this for non-nodes, as for nodes we don't quite know what port
        # index a connection has to use yet.
        port_map = {}

        for asset in non_node_assets:
            component = getattr(self, asset.name)
            # We assume that every component has 2 ports. Essentially meaning that we are dealing
            # with a single commodity for a component. Exceptions, assets that deal with multiple
            # have to be specifically specified what port configuration is expected in the model.
            if (
                asset.asset_type == "GenericConversion"
                or asset.asset_type == "HeatExchange"
                or asset.asset_type == "HeatPump"
            ):
                if prefix != "MILP":
                    raise Exception(
                        "Hydraulically decoulpled systems are not yet supported for nonlinear (QTH)"
                        "optimization"
                    )
                # check for expected number of ports
                if len(asset.in_ports) == 2 and len(asset.out_ports) == 2:
                    for p in [*asset.in_ports, *asset.out_ports]:
                        if isinstance(p.carrier, esdl.HeatCommodity):
                            if isinstance(p, InPort):
                                if self.secondary_port_name_convention in p.name.lower():
                                    port_map[p.id] = getattr(component.Secondary, in_suf)
                                else:
                                    port_map[p.id] = getattr(component.Primary, in_suf)
                            else:  # OutPort
                                if self.primary_port_name_convention in p.name.lower():
                                    port_map[p.id] = getattr(component.Primary, out_suf)
                                else:
                                    port_map[p.id] = getattr(component.Secondary, out_suf)
                        else:
                            raise Exception(
                                f"{asset.name} has does not have 2 Heat in_ports and 2 Heat "
                                f"out_ports "
                            )
                elif (
                    len(asset.in_ports) == 3
                    and len(asset.out_ports) == 2
                    and asset.asset_type == "HeatPump"
                ):
                    p_heat = 0
                    p_elec = 0
                    for p in [*asset.in_ports, *asset.out_ports]:
                        if isinstance(p.carrier, esdl.HeatCommodity) and p_heat <= 3:
                            if isinstance(p, InPort):
                                if self.secondary_port_name_convention in p.name.lower():
                                    port_map[p.id] = getattr(component.Secondary, in_suf)
                                else:
                                    port_map[p.id] = getattr(component.Primary, in_suf)
                            else:  # OutPort
                                if self.primary_port_name_convention in p.name.lower():
                                    port_map[p.id] = getattr(component.Primary, out_suf)
                                else:
                                    port_map[p.id] = getattr(component.Secondary, out_suf)
                            p_heat += 1
                        elif isinstance(p.carrier, esdl.ElectricityCommodity) and p_elec == 0:
                            port_map[p.id] = getattr(component, elec_in_suf)
                            p_elec += 1
                        else:
                            raise Exception(
                                f"{asset.name} has total of 5 ports, but no proper split between "
                                f"milp(4) and electricity (1) ports"
                            )
                elif (
                    asset.asset_type == "HeatPump"
                    and len(asset.out_ports) == 1
                    and len(asset.in_ports) in [1, 2]
                ):
                    for p in [*asset.in_ports, *asset.out_ports]:

                        if isinstance(p, InPort) and isinstance(
                            p.carrier, esdl.ElectricityCommodity
                        ):
                            port_map[p.id] = getattr(component, elec_in_suf)
                        elif isinstance(p, InPort) and isinstance(p.carrier, esdl.HeatCommodity):
                            port_map[p.id] = getattr(component, in_suf)
                        elif isinstance(p, OutPort):  # OutPort
                            port_map[p.id] = getattr(component, out_suf)
                        else:
                            raise Exception(
                                f"{asset.name} has does not have (1 electricity in_port) 1 heat "
                                f"in port and 1 Heat out_ports "
                            )
                else:
                    raise Exception(
                        f"{asset.name} has incorrect number of in/out ports. HeatPumps are allows "
                        f"to have 1 in and 1 out port for air-water HP, 2 in ports and 2 out ports "
                        f"when modelling a water-water HP, or 3 in ports and 2 out ports when the "
                        f"electricity connection of the water-water HP is modelled."
                    )
            elif (
                asset.asset_type == "GasHeater"
                and len(asset.out_ports) == 1
                and len(asset.in_ports) == 2
            ):
                for p in [*asset.in_ports, *asset.out_ports]:

                    if isinstance(p, InPort) and isinstance(p.carrier, esdl.GasCommodity):
                        port_map[p.id] = getattr(component, gas_in_suf)
                    elif isinstance(p, InPort) and isinstance(p.carrier, esdl.HeatCommodity):
                        port_map[p.id] = getattr(component, in_suf)
                    elif isinstance(p, OutPort):  # OutPort
                        port_map[p.id] = getattr(component, out_suf)
                    else:
                        raise Exception(
                            f"{asset.name} has does not have 1 Heat in_port 1 gas in port and 1"
                            f"Heat out_ports "
                        )
            elif (
                asset.asset_type == "ElectricBoiler"
                and len(asset.out_ports) == 1
                and len(asset.in_ports) == 2
            ):
                for p in [*asset.in_ports, *asset.out_ports]:

                    if isinstance(p, InPort) and isinstance(p.carrier, esdl.ElectricityCommodity):
                        port_map[p.id] = getattr(component, elec_in_suf)
                    elif isinstance(p, InPort) and isinstance(p.carrier, esdl.HeatCommodity):
                        port_map[p.id] = getattr(component, in_suf)
                    elif isinstance(p, OutPort):  # OutPort
                        port_map[p.id] = getattr(component, out_suf)
                    else:
                        raise Exception(
                            f"{asset.name} has does not have 1 electricity in_port 1 gas in port "
                            f"and 1 Heat out_ports "
                        )
            elif asset.asset_type == "Electrolyzer":
                if len(asset.out_ports) == 1 and len(asset.in_ports) == 1:
                    if isinstance(asset.out_ports[0].carrier, esdl.GasCommodity):
                        port_map[asset.out_ports[0].id] = getattr(component, gas_out_suf)
                    else:
                        raise Exception(f"{asset.name} must have a gas commodity on the outport")
                    if isinstance(asset.in_ports[0].carrier, esdl.ElectricityCommodity):
                        port_map[asset.in_ports[0].id] = getattr(component, elec_in_suf)
                    else:
                        raise Exception(
                            f"{asset.name} must have a electricity commodity on the inport "
                        )
                else:
                    raise Exception(
                        f"{asset.name} must have one inport for electricity and one outport for gas"
                    )
            elif (
                asset.in_ports is None
                and isinstance(asset.out_ports[0].carrier, esdl.ElectricityCommodity)
                and len(asset.out_ports) == 1
            ):
                port_map[asset.out_ports[0].id] = getattr(component, elec_out_suf)
            elif (
                asset.in_ports is None
                and isinstance(asset.out_ports[0].carrier, esdl.GasCommodity)
                and len(asset.out_ports) == 1
            ):
                port_map[asset.out_ports[0].id] = getattr(component, gas_out_suf)
            elif (
                len(asset.in_ports) == 1
                and isinstance(asset.in_ports[0].carrier, esdl.ElectricityCommodity)
                and asset.out_ports is None
            ):
                port_map[asset.in_ports[0].id] = getattr(component, elec_in_suf)
            elif (
                len(asset.in_ports) == 1
                and isinstance(asset.in_ports[0].carrier, esdl.GasCommodity)
                and asset.out_ports is None
            ):
                port_map[asset.in_ports[0].id] = getattr(component, gas_in_suf)
            elif (
                len(asset.in_ports) == 1
                and isinstance(asset.in_ports[0].carrier, esdl.HeatCommodity)
                and len(asset.out_ports) == 1
            ):
                port_map[asset.in_ports[0].id] = getattr(component, in_suf)
                port_map[asset.out_ports[0].id] = getattr(component, out_suf)
            elif (
                len(asset.in_ports) == 1
                and isinstance(asset.in_ports[0].carrier, esdl.ElectricityCommodity)
                and len(asset.out_ports) == 1
            ):
                port_map[asset.in_ports[0].id] = getattr(component, elec_in_suf)
                port_map[asset.out_ports[0].id] = getattr(component, elec_out_suf)
            elif (
                len(asset.in_ports) == 1
                and isinstance(asset.in_ports[0].carrier, esdl.GasCommodity)
                and len(asset.out_ports) == 1
            ):
                port_map[asset.in_ports[0].id] = getattr(component, gas_in_suf)
                port_map[asset.out_ports[0].id] = getattr(component, gas_out_suf)
            else:
                raise Exception(f"Unsupported ports for asset type {asset.name}.")

        # Nodes are special in that their in/out ports can have multiple
        # connections. This means we have some bookkeeping to do per node. We
        # therefore do the nodes first, and do all remaining connections
        # after.
        connections = set()

        for asset in [*node_assets, *bus_assets, *gas_node_assets]:
            component = getattr(self, asset.name)

            i = 1
            if len(asset.in_ports) != 1 or len(asset.out_ports) != 1:
                Exception(
                    f"{asset.name} has !=1 in or out ports, please only use one, "
                    f"multiple connections to a single joint port are allowed"
                )
            for port in (asset.in_ports[0], asset.out_ports[0]):
                for connected_to in port.connectedTo.items:
                    conn = (port.id, connected_to.id)
                    # Here we skip the adding of the connection if we already had the reverse
                    # connection. Note that we don't do that for logical links between nodes, as we
                    # need both connections in order to make the topology object in
                    # component_type_mixin.py.
                    if connected_to.id in list(port_map.keys()) and (
                        conn in connections or tuple(reversed(conn)) in connections
                    ):
                        continue
                    if isinstance(port.carrier, esdl.HeatCommodity):
                        # First we check if the connected_to.id is in the port_map and if the
                        # connected aasset is of type Pipe. In this case we want to fully connect
                        # the model with head losses and hydraulic power.
                        if (
                            connected_to.id in list(port_map.keys())
                            and assets[
                                name_to_id_map[port_map[connected_to.id].name.split(".")[0]]
                            ].asset_type
                            == "Pipe"
                        ):
                            self.connect(getattr(component, node_suf)[i], port_map[connected_to.id])
                        elif connected_to.id not in list(port_map.keys()):
                            # If The asset is not in the
                            # port map means that there is a direct node to node connection with a
                            # logical link. Here we need to do some tricks to recover the correct
                            # port index of the node.
                            for node in node_assets:
                                if connected_to.id in [node.in_ports[0].id, node.out_ports[0].id]:
                                    connected_node_asset = node
                                    count = 1
                                    for ct in [
                                        *list(node.in_ports[0].connectedTo),
                                        *list(node.out_ports[0].connectedTo),
                                    ]:
                                        if ct.id == port.id:
                                            idx = count
                                        else:
                                            count += 1
                            self.connect_logical_links(
                                getattr(component, node_suf)[i],
                                getattr(getattr(self, connected_node_asset.name), node_suf)[idx],
                            )
                        else:
                            # If the Connected asset is not of type pipe, there might be
                            # logical link like source to node.
                            self.connect_logical_links(
                                getattr(component, node_suf)[i], port_map[connected_to.id]
                            )
                        connections.add(conn)
                        i += 1
                    elif isinstance(port.carrier, esdl.ElectricityCommodity):
                        # Same logic as for heat see comments there
                        if (
                            connected_to.id in list(port_map.keys())
                            and assets[
                                name_to_id_map[port_map[connected_to.id].name.split(".")[0]]
                            ].asset_type
                            == "ElectricityCable"
                        ):
                            self.connect(
                                getattr(component, elec_node_suf)[i], port_map[connected_to.id]
                            )
                        elif connected_to.id not in list(port_map.keys()):
                            for node in bus_assets:
                                if connected_to.id in [node.in_ports[0].id, node.out_ports[0].id]:
                                    connected_node_asset = node
                                    count = 1
                                    for ct in [
                                        *list(node.in_ports[0].connectedTo),
                                        *list(node.out_ports[0].connectedTo),
                                    ]:
                                        if ct.id == port.id:
                                            idx = count
                                        else:
                                            count += 1
                            self.connect_logical_links(
                                getattr(component, elec_node_suf)[i],
                                getattr(getattr(self, connected_node_asset.name), elec_node_suf)[
                                    idx
                                ],
                            )
                        else:
                            self.connect_logical_links(
                                getattr(component, elec_node_suf)[i],
                                port_map[connected_to.id],
                            )
                        connections.add(conn)
                        i += 1
                    elif isinstance(port.carrier, esdl.GasCommodity):
                        # Same logic as for heat see comments there
                        if (
                            connected_to.id in list(port_map.keys())
                            and assets[
                                name_to_id_map[port_map[connected_to.id].name.split(".")[0]]
                            ].asset_type
                            == "Pipe"
                        ):
                            self.connect(
                                getattr(component, gas_node_suf)[i], port_map[connected_to.id]
                            )
                        elif connected_to.id not in list(port_map.keys()):
                            for node in gas_node_assets:
                                if connected_to.id in [node.in_ports[0].id, node.out_ports[0].id]:
                                    connected_node_asset = node
                                    count = 1
                                    for ct in [
                                        *list(node.in_ports[0].connectedTo),
                                        *list(node.out_ports[0].connectedTo),
                                    ]:
                                        if ct.id == port.id:
                                            idx = count
                                        else:
                                            count += 1
                            self.connect_logical_links(
                                getattr(component, gas_node_suf)[i],
                                getattr(getattr(self, connected_node_asset.name), gas_node_suf)[
                                    idx
                                ],
                            )
                        else:
                            self.connect_logical_links(
                                getattr(component, gas_node_suf)[i], port_map[connected_to.id]
                            )
                        connections.add(conn)
                        i += 1
                    else:
                        logger.error(
                            f"asset {asset.name} has an unsupported carrier type for a node"
                        )

        skip_port_ids = set()
        for a in skip_assets:
            if a.in_ports is not None:
                for port in a.in_ports:
                    skip_port_ids.add(port.id)
            if a.out_ports is not None:
                for port in a.out_ports:
                    skip_port_ids.add(port.id)

        # All non-Joints/nodes
        for asset in non_node_assets:
            ports = []
            if asset.in_ports is not None:
                ports.extend(asset.in_ports)
            if asset.out_ports is not None:
                ports.extend(asset.out_ports)
            assert len(ports) > 0
            for port in ports:
                connected_ports = [p for p in port.connectedTo.items if p.id not in skip_port_ids]
                if len(connected_ports) != 1:
                    logger.warning(
                        f"{asset.asset_type} '{asset.name}' has multiple connections"
                        f" to a single port. "
                    )

                assert len(connected_ports) == 1

                for connected_to in connected_ports:
                    conn = (port.id, connected_to.id)
                    if conn in connections or tuple(reversed(conn)) in connections:
                        continue
                    if (
                        asset.asset_type == "Pipe"
                        or asset.asset_type == "ElectricityCable"
                        or assets[
                            name_to_id_map[port_map[connected_to.id].name.split(".")[0]]
                        ].asset_type
                        == "Pipe"
                        or assets[
                            name_to_id_map[port_map[connected_to.id].name.split(".")[0]]
                        ].asset_type
                        == "ElectricityCable"
                    ):
                        self.connect(port_map[port.id], port_map[connected_to.id])
                    else:
                        self.connect_logical_links(port_map[port.id], port_map[connected_to.id])
                    connections.add(conn)
