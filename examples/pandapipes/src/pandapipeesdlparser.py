# THIS CODE DOES NOT MEET THE CODE FORMATTING STANDARD
# Reason: this is only used to parse the esdl for the pandapipes validation test case

"""
PandapipeEsdlParser
====================================
The module for reading ESDL file to pandapipe format
"""

from esdl.esdl_handler import EnergySystemHandler
import esdl
import pandapipes as pp
import math
import uuid


class PandapipeEsdlParserClass(object):
    """ Class of Pandapipe ESDL Parser """
    def __init__(self):
        """
        Function initialize class attribute

        Attributes
        ------------
        esdlFileName
            A string describes the name of esdl file
        esh
            An object EnergySystemHandler
        esdl_asset
            A mapping to the ESDL asset
        """

        self.esdlFileName = None
        self.esh = EnergySystemHandler()
        self.esdl_asset = {'heat':{}}
        self.initAsset()

    def initAsset(self):
        """
        Function clean esdl_asset attribute
        """

        self.esdl_asset['heat'] = {'consumer': [], 'producer': [], 'buffer': [], 'ates': [], 'heatpump': [], 'pump': [],
                              'heatexchanger': [], 'pipe': [], 'joint': []}

    def get_assets_by_commodity_type(self, commodity_type: str):
        """
        Function read asset from ESDL based on commodity

        Parameters
        -----------
            commodity_type
                HeatCommodity, GasCommodity or ElectricityCommodity

        """

        assets = []
        for item in self.esh.energy_system.eAllContents():
            if isinstance(item, esdl.EnergyAsset):
                for port in item.port:
                    if port.carrier.__class__.__name__ == commodity_type:
                        assets.append({"type": item.__class__.__name__, "name": item.name, "id": item.id})
                        break
        return assets

    def loadESDLFile(self, esdlFile):
        """
        Function read esdl file and mapping the asset

        Parameters
        -----------
            esdlFile
                file name of ESDL file
        """
        self.esdlFileName = esdlFile
        self.esh.load_file(self.esdlFileName)

        assets = self.get_assets_by_commodity_type('HeatCommodity')
        for asset in assets:
            asset_obj = self.esh.get_by_id(asset["id"])
            self.add_asset_heat(asset_obj)

    def add_asset_heat(self, asset):
        """ Function mapping ESDL asset to esdl_asset attribute"""
        if isinstance(asset, esdl.Consumer):
            self.esdl_asset['heat']['consumer'].append(asset)

        if isinstance(asset, esdl.Producer) or isinstance(asset, esdl.GasHeater):
            self.esdl_asset['heat']['producer'].append(asset)

        if isinstance(asset, esdl.HeatStorage):
            self.esdl_asset['heat']['buffer'].append(asset)

        if isinstance(asset, esdl.Pipe):
            self.esdl_asset['heat']['pipe'].append(asset)

        if isinstance(asset, esdl.HeatExchange):
            self.esdl_asset['heat']['heatexchanger'].append(asset)

        if isinstance(asset, esdl.Joint):
            self.esdl_asset['heat']['joint'].append(asset)

    def add_additional_joint(self):
        """ Function add extra joint when pipe is connected directly to producer/consumer"""

        for asset in self.esdl_asset['heat']['consumer'] + self.esdl_asset['heat']['producer']:
            for port in asset.port:
                if isinstance(port,esdl.InPort):
                    if not isinstance(port.connectedTo[0].eContainer(), esdl.Joint):
                        #add extra joint
                        coord=esdl.Point(lon=asset.geometry.lon+1e-4,lat=asset.geometry.lat+1e-4)
                        newjoint = esdl.Joint(id=str(uuid.uuid4()),name='inport joint ' + asset.name,geometry=coord)
                        newjoint_inport = esdl.InPort(id=str(uuid.uuid4()), name='inport')
                        newjoint_inport.carrier = port.carrier
                        newjoint_outport = esdl.OutPort(id=str(uuid.uuid4()), name='outport')
                        newjoint_outport.carrier = port.carrier
                        newjoint.port.append(newjoint_inport)
                        newjoint.port.append(newjoint_outport)
                        self.esdl_asset['heat']['joint'].append(newjoint)

                        #change connection to newjoint
                        in_asset = port.connectedTo[0].eContainer()
                        in_asset.port[1].connectedTo[0] = newjoint_inport
                        port.connectedTo.append(newjoint_outport)

                if isinstance(port, esdl.OutPort):
                    if not isinstance(port.connectedTo[0].eContainer(), esdl.Joint):
                        # add extra joint
                        coord = esdl.Point(lon=asset.geometry.lon -1e-4, lat=asset.geometry.lat -1e-4)
                        newjoint = esdl.Joint(id=str(uuid.uuid4()), name='outport joint ' + asset.name,geometry=coord)
                        newjoint_inport = esdl.InPort(id=str(uuid.uuid4()), name='inport')
                        newjoint_inport.carrier = port.carrier
                        newjoint_outport = esdl.OutPort(id=str(uuid.uuid4()), name='outport')
                        newjoint_outport.carrier = port.carrier
                        newjoint.port.append(newjoint_inport)
                        newjoint.port.append(newjoint_outport)
                        self.esdl_asset['heat']['joint'].append(newjoint)

                        # change connection to newjoint
                        out_asset = port.connectedTo[0].eContainer()
                        out_asset.port[0].connectedTo[0] = newjoint_outport
                        port.connectedTo.append(newjoint_inport)



    def createpandapipenet(self):
        """
        Function create pandapipe network from esdl_asset

        return argument

        Parameters
        -----------
            net
                pandapipe network
            net_asset
                system component
            Tsup
                Supply temperature
            Tret
                Return temperature
        """

        # specify water properties
        print("\nNote that the water properties have been hardcoded\n")

        import pandapipes.properties.fluids as fl
        water_const = fl.Fluid("water_const", "liquid")

        density_mesido = 988
        density_const = fl.FluidPropertyConstant(density_mesido)
        kinematic_viscosity_mesido = 3.6437149167588743e-07  # @ T=80 degrees
        viscosity_const = fl.FluidPropertyConstant(kinematic_viscosity_mesido * density_mesido) 
        heat_capacity_const = fl.FluidPropertyConstant(4200)

        water_const.add_property(property_name="density", prop=density_const)
        water_const.add_property(property_name="viscosity", prop=viscosity_const)
        water_const.add_property(property_name="heat_capacity", prop=heat_capacity_const)

        net = pp.create_empty_network(fluid="water")

        fl._add_fluid_to_net(net, water_const)  # checl fluid used -->> net.fluid


        net_asset = {'DemandCluster': [], 'ProductionCluster': [], 'Buffer': [], 'ATES': [], 'Heatpump': [], 'Pump': [],
                              'HeatExchanger': [], 'Pipe': []}


        nodeids = []
        for asset in self.esdl_asset['heat']['joint']:
            for port in asset.port:
                if port.carrier.__class__.__name__ == 'HeatCommodity':
                    if not port.carrier.supplyTemperature == 0:
                        Tfluid = port.carrier.supplyTemperature
                    if not port.carrier.returnTemperature == 0:
                        Tfluid = port.carrier.returnTemperature

            coord = (asset.geometry.lon, asset.geometry.lat)

            pp.create_junction(net,
                               pn_bar=100,
                               tfluid_k=273.15 + Tfluid,
                               name=asset.name,
                               geodata=coord)

            nodeids.append(asset.id)


        dx = 1000 #m
        for asset in self.esdl_asset['heat']['pipe']:
            for port in asset.port:
                if isinstance(port, esdl.InPort):
                    node_input_id = port.connectedTo[0].eContainer().id
                if isinstance(port, esdl.OutPort):
                    node_output_id = port.connectedTo[0].eContainer().id

            coord = []
            for point in asset.geometry.point:
                coord.append((point.lon, point.lat))

            # temp_inner_diam_m = (
            #     asset.innerDiameter if asset.diameter.name=='DN200'
            #     else float(asset.diameter.name[2:])*1e-3
            # )
            pp.create_pipe_from_parameters(net,
                                           from_junction=nodeids.index(node_input_id),
                                           to_junction=nodeids.index(node_output_id),
                                           length_km=asset.length * 1e-3,
                                           sections=math.ceil(asset.length / dx),
                                           alpha_w_per_m2k=0.5,
                                           k_mm=0.2,
                                           text_k=273.15 + 10.0,
                                           diameter_m=asset.innerDiameter,
                                           name=asset.name,
                                           geodata=coord)

        producer = 0
        for asset in self.esdl_asset['heat']['producer']:
            producer = producer + 1
            for port in asset.port:
                if isinstance(port, esdl.InPort):
                    node_input_id = port.connectedTo[0].eContainer().id
                if isinstance(port, esdl.OutPort):
                    node_output_id = port.connectedTo[0].eContainer().id

            for port in asset.port:
                if port.carrier.__class__.__name__ == 'HeatCommodity':
                    if not port.carrier.supplyTemperature == 0:
                        Tsup = port.carrier.supplyTemperature
                    if not port.carrier.returnTemperature == 0:
                        Tret = port.carrier.returnTemperature

            coord = (asset.geometry.lon, asset.geometry.lat)

            node_valve = pp.create_junction(net,
                                            pn_bar=100,
                                            tfluid_k=273.15 + Tsup,
                                            name='valve joint ' + asset.name,
                                            geodata=coord)

            pp.create_flow_control(net,
                                   from_junction=node_valve,
                                   to_junction=nodeids.index(node_output_id),
                                   controlled_mdot_kg_per_s=0,
                                   diameter_m=0.5,
                                   control_active=True,
                                   name='valve ' + asset.name)

            pp.create_circ_pump_const_mass_flow(net,
                                                    return_junction=nodeids.index(node_input_id),
                                                    flow_junction=node_valve,
                                                    p_flow_bar=100,
                                                    mdot_flow_kg_per_s=0.0,
                                                    t_flow_k=273.15 + Tsup,
                                                    name=asset.name,
                                                    type='auto')


        for asset in self.esdl_asset['heat']['consumer']:
            for port in asset.port:
                if isinstance(port, esdl.InPort):
                    node_input_id = port.connectedTo[0].eContainer().id
                if isinstance(port, esdl.OutPort):
                    node_output_id = port.connectedTo[0].eContainer().id

            for port in asset.port:
                if port.carrier.__class__.__name__ == 'HeatCommodity':
                    if not port.carrier.supplyTemperature == 0:
                        Tsup = port.carrier.supplyTemperature
                    if not port.carrier.returnTemperature == 0:
                        Tret = port.carrier.returnTemperature

            coord = (asset.geometry.lon, asset.geometry.lat)

            node_valve = pp.create_junction(net,
                                            pn_bar=100,
                                            tfluid_k=273.15 + Tsup,
                                            name='valve joint ' + asset.name,
                                            geodata=coord)


            pp.create_flow_control(net,
                                   from_junction=nodeids.index(node_input_id),
                                   to_junction=node_valve,
                                   controlled_mdot_kg_per_s=0,
                                   diameter_m=0.5,
                                   control_active=True,
                                   name='valve ' + asset.name)

            pp.create_heat_exchanger(net,
                                     from_junction=node_valve,
                                     to_junction=nodeids.index(node_output_id),
                                     diameter_m=0.5,
                                     qext_w=0.0,
                                     name=asset.name)


        return net, net_asset, Tsup, Tret


    def correcting_pressure_return(self, net):


        # find minimum pressure at inlet consumer
        min_inlet_pressure = net.res_flow_control.p_from_bar.min()
        idxmin = net.res_flow_control.p_from_bar.idxmin()

        dP_cons = net.res_flow_control.p_from_bar.values - net.res_flow_control.p_to_bar.values

        dP_offset = 0.5 - dP_cons[idxmin]

        # shift junction pressure (return side only)
        idx_node_return = net.junction.index[net.junction.tfluid_k==net.junction.tfluid_k.min()]
        net.res_junction.p_bar[idx_node_return] = net.res_junction.p_bar[idx_node_return] - dP_offset


        # update pressure at pipe
        net.res_pipe.p_from_bar = net.res_junction.p_bar[net.pipe.from_junction].values
        net.res_pipe.p_to_bar = net.res_junction.p_bar[net.pipe.to_junction].values

        # update pressure at producer
        net.res_circ_pump_mass.deltap_bar = net.res_junction.p_bar[net.circ_pump_mass.flow_junction].values - net.res_junction.p_bar[net.circ_pump_mass.return_junction].values



        return net