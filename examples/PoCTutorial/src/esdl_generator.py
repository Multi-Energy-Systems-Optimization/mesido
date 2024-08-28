import esdl
from esdl.esdl_handler import EnergySystemHandler
import os
from uuid import uuid4

# Relevant functions: energy system handler.

def create_in_out_ports(asset):
    in_port = esdl.InPort(id = str(uuid4()), name = "In_port")
    out_port = esdl.OutPort(id = str(uuid4()), name = "Out_port")
    asset.port.append(in_port)
    asset.port.append(out_port)

def get_in_out_ports(asset):
    for port in asset.port:
        if isinstance(port, esdl.InPort):
            in_Port = port
        else:
            out_Port = port
    return in_Port, out_Port

def add_geometry_point(asset, lat_lon_list):
    point = esdl.Point(lat = lat_lon_list[0], lon = lat_lon_list[1])
    asset.geometry = point

def define_area(area, points):
    area.geometry = esdl.Polygon()
    area_shape = esdl.SubPolygon()
    for point in points:
        point_add = esdl.Point(lat = point[0], lon = point[1])
        area_shape.point.append(point_add)
    area.geometry.exterior = area_shape

def define_pipe(pipe, from_asset, to_asset, elbow_point = None):
    _, connect_from = get_in_out_ports(from_asset)
    connect_to, _ = get_in_out_ports(to_asset)
    pipe_ports = get_in_out_ports(pipe)
    for port in pipe_ports:
        if isinstance(port, esdl.InPort):
            port.connectedTo.append(connect_from)
            pipe_start = esdl.Point(lat = from_asset.geometry.lat, lon = from_asset.geometry.lon)
        else:
            port.connectedTo.append(connect_to)
            pipe_end = esdl.Point(lat = to_asset.geometry.lat, lon = to_asset.geometry.lon)
    pipe.geometry = esdl.Line()
    pipe.geometry.point.append(pipe_start)
    if elbow_point:
        pipe_elbow = esdl.Point(lat = elbow_point[0], lon = elbow_point[1])
        pipe.geometry.point.append(pipe_elbow)
    pipe.geometry.point.append(pipe_end)
    

if __name__ == "__main__":

    esdl_file_name = 'test.esdl'
    save_folder = 'examples/PoCTutorial/Jaime_onboarding/model'
    
    # Elements coordinates
    demand_1_coord = [52.00095, 4.37325]
    demand_2_coord = [51.99661, 4.37307]
    demand_3_coord = [51.99075, 4.37891]
    prod_1_coord = [52.00483, 4.37272]
    prod_2_coord = [51.99543, 4.36457]
    joint_1_coord = [52.00045, 4.36724]
    joint_2_coord = [51.99596, 4.36951]
    pipe_1_elbow = [52.00359, 4.36629]
    pipe_3_elbow = [51.99009, 4.37153]
    area_1_coord = [[52.00207, 4.36814], [51.99792, 4.36994], [51.9989, 4.3787], [52.00365, 4.37728]]
    area_2_coord = [[51.99714, 4.37028], [51.99189, 4.37239], [51.99239, 4.3805], [51.99799, 4.37904]]
    area_3_coord = [[51.99178, 4.37561], [51.98903, 4.37638], [51.98903, 4.38316], [51.99186, 4.38196]]

    esh = EnergySystemHandler()
    energy_system = esh.create_empty_energy_system(name = 'Onboarding_esdl_Jaime')
    main_area = energy_system.instance[0].area  # Logical high level area.

    # Area 1 (demand 1)
    area_1 = esdl.Area(name = 'Area_demand_1')
    define_area(area_1, area_1_coord)
    main_area.area.append(area_1)

    heat_demand_1 = esdl.HeatingDemand(name = 'Heat_demand1')
    area_1.asset.append(heat_demand_1)
    demand_1_point = esdl.Point(lat = demand_1_coord[0], lon = demand_1_coord[1])
    heat_demand_1.geometry = demand_1_point
    create_in_out_ports(heat_demand_1)
    

    # Area 2 (demand 2)
    area_2 = esdl.Area(name = 'Area_demand_2')
    define_area(area_2, area_2_coord)
    main_area.area.append(area_2)
    heat_demand_2 = esdl.HeatingDemand(name = 'Heat_demand2')
    area_2.asset.append(heat_demand_2)
    demand_2_point = esdl.Point(lat = demand_2_coord[0], lon = demand_2_coord[1])
    heat_demand_2.geometry = demand_2_point
    create_in_out_ports(heat_demand_2)

    # Area 3 (demand 3)
    area_3 = esdl.Area(name = 'Area_demand_3')
    define_area(area_3, area_3_coord)
    main_area.area.append(area_3)
    heat_demand_3 = esdl.HeatingDemand(name = 'Heat_demand3')
    area_3.asset.append(heat_demand_3)
    demand_3_point = esdl.Point(lat = demand_3_coord[0], lon = demand_3_coord[1])
    heat_demand_3.geometry = demand_3_point
    create_in_out_ports(heat_demand_3)

    # Area 4 (sources)
    heat_source_1 = esdl.ResidualHeatSource(name = 'Heat_source1', state = 'OPTIONAL')
    heat_source_2 = esdl.ResidualHeatSource(name = 'Heat_source2', state = 'OPTIONAL')
    main_area.asset.append(heat_source_1)
    main_area.asset.append(heat_source_2)
    prod_1_point = esdl.Point(lat = prod_1_coord[0], lon = prod_1_coord[1])
    prod_2_point = esdl.Point(lat = prod_2_coord[0], lon = prod_2_coord[1])
    heat_source_1.geometry = prod_1_point
    heat_source_2.geometry = prod_2_point
    create_in_out_ports(heat_source_1)
    create_in_out_ports(heat_source_2)

    # Create joints
    joint_1 = esdl.Joint(id = str(uuid4()), name = 'Joint_1') # Can attach multiple pipes to a single inport.
    create_in_out_ports(joint_1)
    add_geometry_point(joint_1, joint_1_coord)
    main_area.asset.append(joint_1)
    
    joint_2 = esdl.Joint(id = str(uuid4()), name = 'Joint_2') # Can attach multiple pipes to a single inport.
    create_in_out_ports(joint_2)
    add_geometry_point(joint_2, joint_2_coord)
    main_area.asset.append(joint_2)

    # Pipes
    pipe_d = esdl.PipeDiameterEnum.from_string("DN400")
    
    pipe_1 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_1", state = 'OPTIONAL')
    create_in_out_ports(pipe_1)
    pipe_from = heat_source_1
    pipe_to = joint_1
    define_pipe(pipe_1, pipe_from, pipe_to, pipe_1_elbow)
    main_area.asset.append(pipe_1)    
    
    pipe_2 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_2")
    create_in_out_ports(pipe_2)
    pipe_from = joint_1
    pipe_to = joint_2
    define_pipe(pipe_2, pipe_from, pipe_to)
    main_area.asset.append(pipe_2)  
    
    pipe_3 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_3")
    create_in_out_ports(pipe_3)
    pipe_from = joint_2
    pipe_to = heat_demand_3
    define_pipe(pipe_3, pipe_from, pipe_to, pipe_3_elbow)
    main_area.asset.append(pipe_3) 

    pipe_4 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_4")
    create_in_out_ports(pipe_4)
    pipe_from = joint_1
    pipe_to = heat_demand_1
    define_pipe(pipe_4, pipe_from, pipe_to)
    main_area.asset.append(pipe_4)     
    
    pipe_5 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_5")
    create_in_out_ports(pipe_5)
    pipe_from = joint_2
    pipe_to = heat_demand_2
    define_pipe(pipe_5, pipe_from, pipe_to)
    main_area.asset.append(pipe_5)  
    
    pipe_6 = esdl.Pipe(id = str(uuid4()), diameter = pipe_d, name = "Pipe_6", state = 'OPTIONAL')
    create_in_out_ports(pipe_6)
    pipe_from = joint_2
    pipe_to = heat_source_2
    define_pipe(pipe_6, pipe_from, pipe_to)
    main_area.asset.append(pipe_6)  

    save_dir = save_folder
    os.chdir(save_dir)
    esh.save(filename = esdl_file_name)
