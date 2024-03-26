# Maps the component type to the default variable name which can be set as range goal.
# Used for default manual input configuration using get_goals_and_options_class
map_comp_type_to_rangegoal_variable = {
    "heat_demand": ".Heat_demand",
    "heat_source": ".Heat_source",
    "heat_pump": ".Secondary_heat",
}


# These variables are the default 'control' variables of a component. Used for setpoint constraints.
map_comp_type_to_control_variable = {
    "heat_demand": ".Heat_demand",
    "heat_source": ".Heat_source",
    "geothermal": ".Heat_source",
    "heat_pump": [
        ".Power_elec",
        ".Primary_heat",
    ],  # Used in HP setpoint constraints. Two are needed to constrain the HP in a steady state
    # operation
}

# These are the mapping of component type to which variables are returned in the result by default.
# Currently used in the zeroMQ app.
# see issues https://ci.tno.nl/gitlab/multi-commodity/rtc-tools-heat-network/-/issues/54
heat_two_port_vars = {
    "HeatIn.Heat",
    "HeatOut.Heat",
    "HeatIn.Q",
    "HeatOut.Q",
    "HeatIn.H",
    "HeatOut.H",
}
heat_four_port_vars = {
    "Primary.HeatIn.Heat",
    "Primary.HeatIn.Q",
    "Primary.HeatIn.H",
    "Primary.HeatOut.Heat",
    "Primary.HeatOut.Q",
    "Primary.HeatOut.H",
    "Secondary.HeatIn.Heat",
    "Secondary.HeatIn.Q",
    "Secondary.HeatIn.H",
    "Secondary.HeatOut.Heat",
    "Secondary.HeatOut.Q",
    "Secondary.HeatOut.H",
}

map_comp_type_to_milp_result_variables = {
    # Conversion
    "heatpump": {"Power_elec", "Primary_heat", "Secondary_heat", "dH", "params.COP"}.union(
        heat_four_port_vars
    ),
    # Heat: (),
    "ates": set(),
    "heat_buffer": {"Stored_heat", "Heat_buffer", "Heat_loss"}.union(heat_two_port_vars),
    "check_valve": {"dH"}.union(heat_two_port_vars),
    "control_valve": {"dH"}.union(heat_two_port_vars),
    "heat_demand": {"Heat_demand"}.union(heat_two_port_vars),
    "geothermal": {"Heat_source", "dH"}.union(heat_two_port_vars),
    "node": {"H"},
    "heat_pipe": {"dH", "params.Heat_loss", "params.temperature"}.union(heat_two_port_vars),
    "pump": {"dH"}.union(heat_two_port_vars),
    "heat_source": {"Heat_source", "dH"}.union(heat_two_port_vars),
}
