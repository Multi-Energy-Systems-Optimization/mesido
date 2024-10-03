import os
from uuid import uuid4

import esdl
from esdl.esdl_handler import EnergySystemHandler

from pyecore.ecore import EDate


def create_in_out_ports(asset, in_carrier, out_carrier, demand_profile=None):
    # Adds in an out ports to an assets and assigns them the corresponding carriers.
    in_port = esdl.InPort(id=str(uuid4()), name="In_port", carrier=in_carrier)
    out_port = esdl.OutPort(id=str(uuid4()), name="Out_port", carrier=out_carrier)
    if demand_profile is not None:
        in_port.profile.append(demand_profile)
    asset.port.append(in_port)
    asset.port.append(out_port)


def get_in_out_ports(asset):
    # Gets the ports of an asset and sorts them as in and out.
    for port in asset.port:
        if isinstance(port, esdl.InPort):
            in_port = port
        else:
            out_port = port
    return in_port, out_port


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


def create_cost_value_profile(cost_value, unit, per_unit=None, per_multiplier=None):
    # Creates a cost profile with a single constant value that can be used to be assigned
    #  to any asset.
    qua_per = esdl.QuantityAndUnitType(id=str(uuid4()))
    qua_per.unit = esdl.UnitEnum.from_string(unit)
    if per_unit is not None:
        qua_per.perUnit = esdl.UnitEnum.from_string(per_unit)
        if per_multiplier is not None:
            qua_per.perMultiplier = esdl.MultiplierEnum.from_string(per_multiplier)
    qua_per.physicalQuantity = esdl.PhysicalQuantityEnum.from_string("COST")
    esdl_cost_profile = esdl.SingleValue(
        id=str(uuid4()), value=cost_value, profileQuantityAndUnit=qua_per
    )

    return esdl_cost_profile


def import_demand_profile(demand_profile_parameters, profile_quantity):
    # Imports the demand profile from InfluxDB and creates the demand object.
    # demand_profile_parameters is a dictionary (see below) and the profile quantity
    # must be an esdl.QuantityAndUnitType object.

    demand_profile = esdl.InfluxDBProfile(
        id=str(uuid4()),
        multiplier=demand_profile_parameters["multiplier"],
        database=demand_profile_parameters["database"],
        measurement=demand_profile_parameters["measurement"],
        host=demand_profile_parameters["host"],
        field=demand_profile_parameters["field"],
        port=demand_profile_parameters["port"],
        startDate=demand_profile_parameters["startDate"],
        endDate=demand_profile_parameters["endDate"],
    )

    demand_profile.profileQuantityAndUnit = esdl.QuantityAndUnitReference(
        reference=profile_quantity
    )

    return demand_profile


def create_joint(joint_name, carrier, location, area):
    # Creates a joint, assigns it its carrier and ports and appends it to
    # the selected area

    joint = esdl.Joint(id=str(uuid4()), name=joint_name)
    create_in_out_ports(joint, carrier, carrier)
    add_geometry_point(joint, location)
    area.asset.append(joint)

    return joint


def create_pipe(
    name_pipe, from_asset, to_asset, carrier, area, elbow_point=None, state_pipe="ENABLED"
):
    # Creates a pipe, connects it to its corresponding assets, assigns it its
    # carrier, geometry and state ("ENABLED" or "OPTIONAL") and appends it to
    # its corresponding area.

    pipe = esdl.Pipe(id=str(uuid4()), diameter=pipe_d, name=name_pipe, state=state_pipe)
    create_in_out_ports(pipe, carrier, carrier)

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

    area.asset.append(pipe)

    return pipe


if __name__ == "__main__":

    # -------------------------------------------------- #
    #                       INPUT                        #
    # -------------------------------------------------- #

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
    demand_1_profile_params = {
        "multiplier": 0.75,
        "database": "energy_profiles",
        "measurement": "WarmingUp default profiles",
        "host": "profiles.warmingup.info",
        "field": "demand4_MW",
        "port": 443,
        "startDate": EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        "endDate": EDate.from_string("2019-12-31T22:00:00.000000+0000"),
    }

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
    demand_2_profile_params = {
        "multiplier": 0.5,
        "database": "energy_profiles",
        "measurement": "WarmingUp default profiles",
        "host": "profiles.warmingup.info",
        "field": "demand4_MW",
        "port": 443,
        "startDate": EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        "endDate": EDate.from_string("2019-12-31T22:00:00.000000+0000"),
    }

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
    demand_3_profile_params = {
        "multiplier": 0.3,
        "database": "energy_profiles",
        "measurement": "WarmingUp default profiles",
        "host": "profiles.warmingup.info",
        "field": "demand4_MW",
        "port": 443,
        "startDate": EDate.from_string("2018-12-31T23:00:00.000000+0000"),
        "endDate": EDate.from_string("2019-12-31T22:00:00.000000+0000"),
    }

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
    pipe_diam = "DN400"  # Assumes all pipes have the same diameter.
    pipe_1_elbow_coord = [52.00353, 4.36593]
    pipe_3_elbow_coord = [51.9898, 4.37191]
    pipe_1ret_elbow_coord = [52.00363, 4.36492]
    pipe_3ret_elbow_coord = [51.98922, 4.3717]

    # -------------------------------------------------- #
    #                   PROCESSING                       #
    # -------------------------------------------------- #

    esh = EnergySystemHandler()
    energy_system = esh.create_empty_energy_system(name="Generated PoC tutorial")
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
    id_primary_carr = heat_commodity_primary.id
    id_ret_carr = heat_commodity_ret.id
    esi = esh.energy_system.energySystemInformation
    if not esi:
        esi = esdl.EnergySystemInformation(id=str(uuid4()))
        esh.energy_system.energySystemInformation = esi
        esh.add_object(esi)

    quantities = esdl.QuantityAndUnits(id=str(uuid4()))
    power_quantity = esdl.QuantityAndUnitType(
        id=str(uuid4()),
        description="Power in MW",
        physicalQuantity="POWER",
        multiplier="MEGA",
        unit="WATT",
    )
    quantities.quantityAndUnit.append(power_quantity)

    esi.quantityAndUnits = quantities
    esi.carriers = heat_carrs

    # Area 1 (demand 1)
    area_1 = esdl.Area(id=str(uuid4()), name="Area_demand_1")
    define_area(area_1, area_1_coord)
    main_area.area.append(area_1)

    heat_demand_1 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand1")
    area_1.asset.append(heat_demand_1)
    add_geometry_point(heat_demand_1, demand_1_coord)
    heat_demand_1.power = demand_1_power

    heat_demand_1.costInformation = esdl.CostInformation(id=str(uuid4()))
    cost_info = heat_demand_1.costInformation
    cost_info.investmentCosts = create_cost_value_profile(
        demand_1_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    cost_info.installationCosts = create_cost_value_profile(demand_1_inst_cost, "EURO")

    in_carrier = heat_commodity_primary
    out_carrier = heat_commodity_ret

    heat_demand_profile = import_demand_profile(demand_1_profile_params, power_quantity)
    create_in_out_ports(heat_demand_1, in_carrier, out_carrier, demand_profile=heat_demand_profile)

    # Area 2 (demand 2)
    area_2 = esdl.Area(id=str(uuid4()), name="Area_demand_2")
    define_area(area_2, area_2_coord)
    main_area.area.append(area_2)

    heat_demand_2 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand2")
    area_2.asset.append(heat_demand_2)
    add_geometry_point(heat_demand_2, demand_2_coord)
    heat_demand_2.power = demand_2_power

    heat_demand_2.costInformation = esdl.CostInformation(id=str(uuid4()))
    cost_info = heat_demand_2.costInformation
    cost_info.investmentCosts = create_cost_value_profile(
        demand_2_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    cost_info.installationCosts = create_cost_value_profile(demand_2_inst_cost, "EURO")

    in_carrier = heat_commodity_primary
    out_carrier = heat_commodity_ret

    heat_demand_profile = import_demand_profile(demand_2_profile_params, power_quantity)
    create_in_out_ports(heat_demand_2, in_carrier, out_carrier, demand_profile=heat_demand_profile)

    # Area 3 (demand 3)
    area_3 = esdl.Area(id=str(uuid4()), name="Area_demand_3")
    define_area(area_3, area_3_coord)
    main_area.area.append(area_3)

    heat_demand_3 = esdl.HeatingDemand(id=str(uuid4()), name="Heat_demand3")
    area_3.asset.append(heat_demand_3)
    add_geometry_point(heat_demand_3, demand_3_coord)
    heat_demand_3.power = demand_3_power

    heat_demand_3.costInformation = esdl.CostInformation(id=str(uuid4()))
    cost_info = heat_demand_3.costInformation
    cost_info.investmentCosts = create_cost_value_profile(
        demand_3_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    cost_info.installationCosts = create_cost_value_profile(demand_3_inst_cost, "EURO")

    in_carrier = heat_commodity_primary
    out_carrier = heat_commodity_ret

    heat_demand_profile = import_demand_profile(demand_3_profile_params, power_quantity)
    create_in_out_ports(heat_demand_3, in_carrier, out_carrier, demand_profile=heat_demand_profile)

    # Main area (sources)
    heat_source_1 = esdl.ResidualHeatSource(id=str(uuid4()), name="Heat_source1", state="OPTIONAL")
    heat_source_2 = esdl.ResidualHeatSource(id=str(uuid4()), name="Heat_source2", state="OPTIONAL")
    main_area.asset.append(heat_source_1)
    main_area.asset.append(heat_source_2)
    add_geometry_point(heat_source_1, prod_1_coord)
    add_geometry_point(heat_source_2, prod_2_coord)

    heat_source_1.power = source_1_power
    heat_source_2.power = source_2_power

    heat_source_1.costInformation = esdl.CostInformation(id=str(uuid4()))
    cost_info = heat_source_1.costInformation
    cost_info.investmentCosts = create_cost_value_profile(
        source_1_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    cost_info.installationCosts = create_cost_value_profile(source_1_inst_cost, "EURO")
    cost_info.variableOperationalCosts = create_cost_value_profile(
        source_1_varop_cost, "EURO", per_unit="WATTHOUR", per_multiplier="MEGA"
    )
    cost_info.fixedOperationalCosts = create_cost_value_profile(
        source_1_fixop_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )

    heat_source_2.costInformation = esdl.CostInformation(id=str(uuid4()))
    cost_info = heat_source_2.costInformation
    cost_info.investmentCosts = create_cost_value_profile(
        source_2_inv_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )
    cost_info.installationCosts = create_cost_value_profile(source_2_inst_cost, "EURO")
    cost_info.variableOperationalCosts = create_cost_value_profile(
        source_2_varop_cost, "EURO", per_unit="WATTHOUR", per_multiplier="MEGA"
    )
    cost_info.fixedOperationalCosts = create_cost_value_profile(
        source_2_fixop_cost, "EURO", per_unit="WATT", per_multiplier="MEGA"
    )

    in_carrier = heat_commodity_ret
    out_carrier = heat_commodity_primary
    create_in_out_ports(heat_source_1, in_carrier, out_carrier)
    in_carrier = heat_commodity_ret
    out_carrier = heat_commodity_primary
    create_in_out_ports(heat_source_2, in_carrier, out_carrier)

    # Main netowrk joints joints
    primary_carr = heat_commodity_primary

    joint_1 = create_joint("Joint_1", primary_carr, joint_1_coord, main_area)
    joint_2 = create_joint("Joint_2", primary_carr, joint_2_coord, main_area)

    # Primary network pipes
    pipe_d = esdl.PipeDiameterEnum.from_string(pipe_diam)  # Pipe diameters

    pipe_1 = create_pipe(
        "Pipe_1",
        heat_source_1,
        joint_1,
        primary_carr,
        main_area,
        elbow_point=pipe_1_elbow_coord,
        state_pipe="OPTIONAL",
    )

    pipe_2 = create_pipe(
        "Pipe_2",
        joint_1,
        joint_2,
        primary_carr,
        main_area,
    )

    pipe_3 = create_pipe(
        "Pipe_3", joint_2, heat_demand_3, primary_carr, main_area, elbow_point=pipe_3_elbow_coord
    )

    pipe_4 = create_pipe("Pipe_4", joint_1, heat_demand_1, primary_carr, main_area)

    pipe_5 = create_pipe("Pipe_5", joint_2, heat_demand_2, primary_carr, main_area)

    pipe_6 = create_pipe(
        "Pipe_6", heat_source_2, joint_2, primary_carr, main_area, state_pipe="OPTIONAL"
    )

    # Return network joints
    ret_carr = heat_commodity_ret

    joint_1ret = create_joint("Joint_1ret", ret_carr, joint_1ret_coord, main_area)
    joint_2ret = create_joint("Joint_2ret", ret_carr, joint_2ret_coord, main_area)

    # Return network pipes.

    pipe_1ret = create_pipe(
        "Pipe_1ret",
        joint_1ret,
        heat_source_1,
        ret_carr,
        main_area,
        elbow_point=pipe_1ret_elbow_coord,
        state_pipe="OPTIONAL",
    )

    pipe_2ret = create_pipe("Pipe_2ret", joint_2ret, joint_1ret, ret_carr, main_area)

    pipe_3ret = create_pipe(
        "Pipe_3ret",
        heat_demand_3,
        joint_2ret,
        ret_carr,
        main_area,
        elbow_point=pipe_3ret_elbow_coord,
    )

    pipe_4ret = create_pipe("Pipe_4ret", heat_demand_1, joint_1ret, ret_carr, main_area)

    pipe_5ret = create_pipe("Pipe_5ret", heat_demand_2, joint_2ret, ret_carr, main_area)

    pipe_6ret = create_pipe(
        "Pipe_6ret", joint_2ret, heat_source_2, ret_carr, main_area, state_pipe="OPTIONAL"
    )

    # File export and saving
    save_dir = save_folder
    os.chdir(save_dir)
    esh.save(filename=esdl_file_name)
