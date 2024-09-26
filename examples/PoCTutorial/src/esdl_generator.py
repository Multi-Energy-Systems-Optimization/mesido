import esdl
from esdl.esdl_handler import EnergySystemHandler
import os
from uuid import uuid4
from pyecore.ecore import EDate
from pyecore.ecore import EReference


def create_in_out_ports(asset, in_carrier, out_carrier, demand_profile = None):
    # Adds in an out ports to an assets and assigns them the corresponding carriers.
    in_port = esdl.InPort(id=str(uuid4()), name="In_port", carrier=in_carrier)
    out_port = esdl.OutPort(id=str(uuid4()), name="Out_port", carrier=out_carrier)
    if demand_profile is not None:
        in_port.profile.append(demand_profile)
    asset.port.append(in_port)
    asset.port.append(out_port)

def create_in_out_ports_influxdb_test(asset, in_carrier, out_carrier):
    # Adds in an out ports to an assets and assigns them the corresponding carriers.
    in_port = esdl.InPort(id=str(uuid4()), name="In_port", carrier=in_carrier)
    out_port = esdl.OutPort(id=str(uuid4()), name="Out_port", carrier=out_carrier)
    asset.port.append(in_port)
    asset.port.append(out_port)
    demand_profile = esdl.InfluxDBProfile(
        id=str(uuid4())
    )  # Add all parameters here, might need the quantity and unit like with the costs.
    # For the date esdl.EDate.from_string(date string).
    in_port.profile.append(demand_profile)

def get_in_out_ports(asset):
    # Gets the ports of an asset and sorts them as in and out.
    for port in asset.port:
        if isinstance(port, esdl.InPort):
            in_Port = port
        else:
            out_Port = port
    return in_Port, out_Port


def add_geometry_point(asset, lat_lon_list):
    # Adds an esdl point to an asset.
    point = esdl.Point(lat=lat_lon_list[0], lon=lat_lon_list[1])
    asset.geometry = point

def define_area(area, points):
    # Creates a polygon given a series of points and assigns it to the given area.
    area.geometry = esdl.Polygon()
    area_shape = esdl.SubPolygon()
    for point in points:
        point_add = esdl.Point(lat=point[0], lon=point[1])
        area_shape.point.append(point_add)
    area.geometry.exterior = area_shape

def define_pipe(pipe, from_asset, to_asset, elbow_point=None):
    # Creates a pipe asset given the assets it connects (to and from) and assigns an elbow, if chosen.
    # Collect relevant ports for this pipe
    _, connect_from = get_in_out_ports(from_asset)
    connect_to, _ = get_in_out_ports(to_asset)
    pipe_ports = get_in_out_ports(pipe)
    # Connect the corresponding ports to each other
    for port in pipe_ports:
        if isinstance(port, esdl.InPort):
            port.connectedTo.append(connect_from)
            pipe_start = esdl.Point(lat=from_asset.geometry.lat, lon=from_asset.geometry.lon)
        else:
            port.connectedTo.append(connect_to)
            pipe_end = esdl.Point(lat=to_asset.geometry.lat, lon=to_asset.geometry.lon)
    # Configure pipe geometry
    pipe.geometry = esdl.Line()
    pipe.geometry.point.append(pipe_start)
    if elbow_point:
        pipe_elbow = esdl.Point(lat=elbow_point[0], lon=elbow_point[1])
        pipe.geometry.point.append(pipe_elbow)
    pipe.geometry.point.append(pipe_end)

def create_cost_value_profile(cost_value, unit, per_unit=None, per_multiplier=None):
    # Creates a cost profile with a single constant value that can be used to be assigned to any asset cost type.
    qua_per = esdl.QuantityAndUnitType(id=str(uuid4()))
    qua_per.unit = unit
    if per_unit is not None:
        qua_per.perUnit = per_unit
        if per_multiplier is not None:
            qua_per.perMultiplier = per_multiplier
    qua_per.physicalQuantity = "COST"
    esdl_cost_profile = esdl.SingleValue(
        id=str(uuid4()), value=cost_value, profileQuantityAndUnit=qua_per
    )

    return esdl_cost_profile


if __name__ == "__main__":

    ######################################################
    ##                      INPUT                       ##
    ######################################################

    esdl_file_name = "tutorial_generated.esdl"  # Name of the output esdl file.
    save_folder = "examples/PoCTutorial/model"  # Folder to output the esdl to.

    # System parameters
    temp_supply = 80.0  # degC
    temp_ret = 30.0  # degC

    # Heat demand 1 parameters
    demand_1_power = 15e6  # W
    demand_1_inv_cost = 1e6  # eur/MW
    demand_1_inst_cost = 1e6  # eur
    area_1_coord = [
        [52.003232185574326, 4.376142024993897],
        [52.002228236493224, 4.372107982635499],
        [52.0031132980428, 4.3712711334228525],
        [52.00197724570447, 4.366979598999024],
        [51.99826505971136, 4.369254112243653],
        [51.99945404958839, 4.373760223388673],
        [51.995635958872874, 4.3776869773864755],
        [51.9963626102222, 4.380712509155274],
    ]
    demand_1_coord = [52.00107, 4.37353]

    # Demand 2 parameters
    demand_2_power = 15e6  # W
    demand_2_inv_cost = 1e6  # eur/MW
    demand_2_inst_cost = 1e6  # eur
    area_2_coord = [
        [51.99817258139733, 4.3692970275878915],
        [51.99932194116153, 4.373695850372315],
        [51.99534529503086, 4.376678466796876],
        [51.99624370444482, 4.38081979751587],
        [51.99490929572965, 4.381613731384278],
        [51.99272923553559, 4.372708797454835],
    ]
    demand_2_coord = [51.99653, 4.3731]

    # Demand 3 parameters
    demand_3_power = 15e6  # W
    demand_3_inv_cost = 1e6  # eur/MW
    demand_3_inst_cost = 1e6  # eur
    area_3_coord = [
        [51.992279997820766, 4.372987747192384],
        [51.994235470276436, 4.382214546203614],
        [51.989333415199866, 4.38581943511963],
        [51.98688879367896, 4.37633514404297],
    ]
    demand_3_coord = [51.99074, 4.3791]

    # Source 1 parameters
    source_1_power = 50e6  # W
    source_1_inv_cost = 1.5e6  # eur/MW
    source_1_inst_cost = 10e6  # eur
    source_1_varop_cost = 100.0  # eur/MWh
    source_1_fixop_cost = 6e5  # eur/MW
    prod_1_coord = [52.00483, 4.37272]

    # Source 2 parameters
    source_2_power = 50e6  # W
    source_2_inv_cost = 2e6  # eur/MW
    source_2_inst_cost = 20e6  # eur
    source_2_varop_cost = 200.0  # eur/MWh
    source_2_fixop_cost = 9e5  # eur/MW
    prod_2_coord = [51.99543, 4.36457]

    # Joints
    joint_1_coord = [52.00098, 4.36702]
    joint_2_coord = [51.99596, 4.36951]
    joint_1ret_coord = [52.00033, 4.36646]
    joint_2ret_coord = [51.99537, 4.36895]

    # Pipes
    pipe_1_elbow_coord = [52.00353, 4.36593]
    pipe_1ret_elbow_coord = [52.00363, 4.36492]
    pipe_3_elbow_coord = [51.9898, 4.37191]
    pipe_3ret_elbow_coord = [51.98922, 4.3717]

    ######################################################
    ##                  PROCESSING                      ##
    ######################################################

    esh = EnergySystemHandler()
    energy_system = esh.create_empty_energy_system(name="Generated PoC tutoral")
    main_area = energy_system.instance[0].area  # Logical high level area.

    # Create heat carriers
    heat_commodity_primary = esdl.HeatCommodity(
        id=str(uuid4()), name="HeatCommodityPrimary", supplyTemperature=temp_supply
    )
    heat_commodity_ret = esdl.HeatCommodity(
        id=str(uuid4()), name="HeatCommodityRet", returnTemperature=temp_ret
    )
    heat_carrs = esdl.Carriers(id=str(uuid4()))
    heat_carrs.carrier.append(heat_commodity_primary)
    heat_carrs.carrier.append(heat_commodity_ret)
    for carrier in heat_carrs.carrier:
        if carrier.name == "HeatCommodityPrimary":
            id_primary_carr = carrier.id
        elif carrier.name == "HeatCommodityRet":
            id_ret_carr = carrier.id
    esi = esh.energy_system.energySystemInformation
    if not esi:
        esi = esdl.EnergySystemInformation(id=str(uuid4()))
        esh.energy_system.energySystemInformation = esi
        esh.add_object(esi)
    
    quantities = esdl.QuantityAndUnits(id = str(uuid4()))
    power_quantity = esdl.QuantityAndUnitType(
        id = str(uuid4()),
        description = "Power in MW",
        physicalQuantity = "POWER",
        multiplier = "MEGA",
        unit = "WATT"
    )
    quantities.quantityAndUnit.append(power_quantity)
    
    esi.quantityAndUnits = quantities
    esi.carriers = heat_carrs

    ##### Area 1 (demand 1)
    area_1 = esdl.Area(id=str(uuid4()), name="Area_demand_1")
    define_area(area_1, area_1_coord)
    main_area.area.append(area_1)

    heat_demand_1 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand1")
    area_1.asset.append(heat_demand_1)
    add_geometry_point(heat_demand_1, demand_1_coord)
    heat_demand_1.power = demand_1_power

    heat_demand_1.costInformation = esdl.CostInformation(id=str(uuid4()))
    costInf = heat_demand_1.costInformation
    costInf.investmentCosts = create_cost_value_profile(
        demand_1_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    costInf.installationCosts = create_cost_value_profile(demand_1_inst_cost, "EURO")

    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    heat_demand_profile = esdl.InfluxDBProfile(
        id=str(uuid4()),
        multiplier = 0.75,
        database = 'energy_profiles',
        measurement = "WarmingUp default profiles",
        host = "profiles.warmingup.info",
        field = "demand4_MW",
        port = 443,
        startDate = EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        endDate = EDate.from_string("2019-12-31T22:00:00.000000+0000")
    ) 
    heat_demand_profile.profileQuantityAndUnit = esdl.QuantityAndUnitReference(
        reference = power_quantity
    )
    create_in_out_ports(heat_demand_1, in_carrier, out_carrier, demand_profile = heat_demand_profile)

    ###### Area 2 (demand 2)
    area_2 = esdl.Area(id=str(uuid4()), name="Area_demand_2")
    define_area(area_2, area_2_coord)
    main_area.area.append(area_2)

    heat_demand_2 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand2")
    area_2.asset.append(heat_demand_2)
    add_geometry_point(heat_demand_2, demand_2_coord)
    heat_demand_2.power = demand_2_power

    heat_demand_2.costInformation = esdl.CostInformation(id=str(uuid4()))
    costInf = heat_demand_2.costInformation
    costInf.investmentCosts = create_cost_value_profile(
        demand_2_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    costInf.installationCosts = create_cost_value_profile(demand_2_inst_cost, "EURO")

    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    heat_demand_profile = esdl.InfluxDBProfile(
        id=str(uuid4()),
        multiplier = 0.5,
        database = 'energy_profiles',
        measurement = "WarmingUp default profiles",
        host = "profiles.warmingup.info",
        field = "demand4_MW",
        port = 443,
        startDate = EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        endDate = EDate.from_string("2019-12-31T22:00:00.000000+0000")
    ) 
    heat_demand_profile.profileQuantityAndUnit = esdl.QuantityAndUnitReference(
        reference = power_quantity
    )
    create_in_out_ports(heat_demand_2, in_carrier, out_carrier, demand_profile = heat_demand_profile)

    ##### Area 3 (demand 3)
    area_3 = esdl.Area(id=str(uuid4()), name="Area_demand_3")
    define_area(area_3, area_3_coord)
    main_area.area.append(area_3)

    heat_demand_3 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand3")
    area_3.asset.append(heat_demand_3)
    add_geometry_point(heat_demand_3, demand_3_coord)
    heat_demand_3.power = demand_3_power

    heat_demand_3.costInformation = esdl.CostInformation(id=str(uuid4()))
    costInf = heat_demand_3.costInformation
    costInf.investmentCosts = create_cost_value_profile(
        demand_3_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    costInf.installationCosts = create_cost_value_profile(demand_3_inst_cost, "EURO")

    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    heat_demand_profile = esdl.InfluxDBProfile(
        id=str(uuid4()),
        multiplier = 0.3,
        database = 'energy_profiles',
        measurement = "WarmingUp default profiles",
        host = "profiles.warmingup.info",
        field = "demand5_MW",
        port = 443,
        startDate = EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        endDate = EDate.from_string("2019-12-31T22:00:00.000000+0000")
    ) 
    heat_demand_profile.profileQuantityAndUnit = esdl.QuantityAndUnitReference(
        reference = power_quantity
    )
    create_in_out_ports(heat_demand_3, in_carrier, out_carrier, demand_profile = heat_demand_profile)

    ##### Main area (sources)
    heat_source_1 = esdl.ResidualHeatSource(id=str(uuid4()), name="Heat_source1", state="OPTIONAL")
    heat_source_2 = esdl.ResidualHeatSource(id=str(uuid4()), name="Heat_source2", state="OPTIONAL")
    main_area.asset.append(heat_source_1)
    main_area.asset.append(heat_source_2)
    add_geometry_point(heat_source_1, prod_1_coord)
    add_geometry_point(heat_source_2, prod_2_coord)

    heat_source_1.power = source_1_power
    heat_source_2.power = source_2_power

    heat_source_1.costInformation = esdl.CostInformation(id=str(uuid4()))
    costInf = heat_source_1.costInformation
    costInf.investmentCosts = create_cost_value_profile(
        source_1_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    costInf.installationCosts = create_cost_value_profile(source_1_inst_cost, "EURO")
    costInf.variableOperationalCosts = create_cost_value_profile(
        source_1_varop_cost, "EURO", per_unit="WATTHOUR", per_multiplier="MEGA"
    )
    costInf.fixedOperationalCosts = create_cost_value_profile(
        source_1_fixop_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )

    heat_source_2.costInformation = esdl.CostInformation(id=str(uuid4()))
    costInf = heat_source_2.costInformation
    costInf.investmentCosts = create_cost_value_profile(
        source_2_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    costInf.installationCosts = create_cost_value_profile(source_2_inst_cost, "EURO")
    costInf.variableOperationalCosts = create_cost_value_profile(
        source_2_varop_cost, "EURO", per_unit="WATTHOUR", per_multiplier="MEGA"
    )
    costInf.fixedOperationalCosts = create_cost_value_profile(
        source_2_fixop_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )

    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(heat_source_1, in_carrier, out_carrier)
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(heat_source_2, in_carrier, out_carrier)

    ##### Main netowrk joints joints
    joint_1 = esdl.Joint(id=str(uuid4()), name="Joint_1")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(joint_1, in_carrier, out_carrier)
    add_geometry_point(joint_1, joint_1_coord)
    main_area.asset.append(joint_1)

    joint_2 = esdl.Joint(id=str(uuid4()), name="Joint_2")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(joint_2, in_carrier, out_carrier)
    add_geometry_point(joint_2, joint_2_coord)
    main_area.asset.append(joint_2)

    ##### Primary network pipes
    pipe_d = esdl.PipeDiameterEnum.from_string("DN400")  # Pipe diameters

    pipe_1 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_1", state="OPTIONAL")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_1, in_carrier, out_carrier)
    pipe_from = heat_source_1
    pipe_to = joint_1
    define_pipe(pipe_1, pipe_from, pipe_to, elbow_point=pipe_1_elbow_coord)
    main_area.asset.append(pipe_1)

    pipe_2 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_2")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_2, in_carrier, out_carrier)
    pipe_from = joint_1
    pipe_to = joint_2
    define_pipe(pipe_2, pipe_from, pipe_to)
    main_area.asset.append(pipe_2)

    pipe_3 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_3")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_3, in_carrier, out_carrier)
    pipe_from = joint_2
    pipe_to = heat_demand_3
    define_pipe(pipe_3, pipe_from, pipe_to, elbow_point=pipe_3_elbow_coord)
    main_area.asset.append(pipe_3)

    pipe_4 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_4")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_4, in_carrier, out_carrier)
    pipe_from = joint_1
    pipe_to = heat_demand_1
    define_pipe(pipe_4, pipe_from, pipe_to)
    main_area.asset.append(pipe_4)

    pipe_5 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_5")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_5, in_carrier, out_carrier)
    pipe_from = joint_2
    pipe_to = heat_demand_2
    define_pipe(pipe_5, pipe_from, pipe_to)
    main_area.asset.append(pipe_5)

    pipe_6 = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name="Pipe_6", state="OPTIONAL")
    in_carrier = esh.get_by_id_slow(id_primary_carr)
    out_carrier = esh.get_by_id_slow(id_primary_carr)
    create_in_out_ports(pipe_6, in_carrier, out_carrier)
    pipe_from = heat_source_2
    pipe_to = joint_2
    define_pipe(pipe_6, pipe_from, pipe_to)
    main_area.asset.append(pipe_6)

    ##### Return network joints
    joint_1ret = esdl.Joint(
        id=str(uuid4()), name="Joint_1ret"
    )  # Can attach multiple pipes to a single inport.
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(joint_1ret, in_carrier, out_carrier)
    add_geometry_point(joint_1ret, joint_1ret_coord)
    main_area.asset.append(joint_1ret)

    joint_2ret = esdl.Joint(
        id=str(uuid4()), name="Joint_2ret"
    )  # Can attach multiple pipes to a single inport.
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(joint_2ret, in_carrier, out_carrier)
    add_geometry_point(joint_2ret, joint_2ret_coord)
    main_area.asset.append(joint_2ret)

    ##### Return network pipes.
    pipe_ret_d = esdl.PipeDiameterEnum.from_string("DN400")  # Pipe diameters

    pipe_1ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_1ret", state="OPTIONAL")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_1ret, in_carrier, out_carrier)
    pipe_from = joint_1ret
    pipe_to = heat_source_1
    define_pipe(pipe_1ret, pipe_from, pipe_to, elbow_point=pipe_1ret_elbow_coord)
    main_area.asset.append(pipe_1ret)

    pipe_2ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_2ret")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_2ret, in_carrier, out_carrier)
    pipe_from = joint_2ret
    pipe_to = joint_1ret
    define_pipe(pipe_2ret, pipe_from, pipe_to)
    main_area.asset.append(pipe_2ret)

    pipe_3ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_3ret")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_3ret, in_carrier, out_carrier)
    pipe_from = heat_demand_3
    pipe_to = joint_2ret
    define_pipe(pipe_3ret, pipe_from, pipe_to, elbow_point=pipe_3ret_elbow_coord)
    main_area.asset.append(pipe_3ret)

    pipe_4ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_4ret")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_4ret, in_carrier, out_carrier)
    pipe_from = heat_demand_1
    pipe_to = joint_1ret
    define_pipe(pipe_4ret, pipe_from, pipe_to)
    main_area.asset.append(pipe_4ret)

    pipe_5ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_5ret")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_5ret, in_carrier, out_carrier)
    pipe_from = heat_demand_2
    pipe_to = joint_2ret
    define_pipe(pipe_5ret, pipe_from, pipe_to)
    main_area.asset.append(pipe_5ret)

    pipe_6ret = esdl.Pipe(id=str(uuid4()), diameter=pipe_ret_d, name="Pipe_6ret", state="OPTIONAL")
    in_carrier = esh.get_by_id_slow(id_ret_carr)
    out_carrier = esh.get_by_id_slow(id_ret_carr)
    create_in_out_ports(pipe_6ret, in_carrier, out_carrier)
    pipe_from = joint_2ret
    pipe_to = heat_source_2
    define_pipe(pipe_6ret, pipe_from, pipe_to)
    main_area.asset.append(pipe_6ret)

    ##### File export and saving
    save_dir = save_folder
    os.chdir(save_dir)
    esh.save(filename=esdl_file_name)
