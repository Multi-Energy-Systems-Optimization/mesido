

***************************************************************************************************

General notes: 
    - qth: non linear implementation: skip over these for now in terms of
    understanding/explaining/documenting
    - test case description: standard format, using Checks: list functionality 
    - separate tests a bit more
    - modelica - how many are there? delete or replace? Which funcionality is being tested,-->> summary of what assert statements are being used in these cases? - 1st priority testing work KvR 
    - test code coverage - with and without modelica test cases - KvR
    - Test idea of setting up matrix with rows-test files, columns-constraints - Jim 
    - Absolute heat work: new test cases to be added, and some existing test cases to be updated - wait for this to be completed before updating to much comments
    - Decoupled from absoulte heat can update comments now: gas test, elec test, hydraulic power, max size and optional assest, testpycml, setpointconstraints, descriptions of heat problems in all, 
    - Picture of the network? Where will we show this? I think it is usefull to see the network. -->> Add png in esdl folder - KvR

***************************************************************************************************

Existing test cases:
- What do we want to explain in description? General scenario? Or more detail like 1 year profile
used etc?
- Where is the warming up 3/4 test cases that have been mentioned by Ryvo and Sam - KvR check with Ryvo where there cases are?

***************************************************************************************************

- test_asset_is_realized.py:
    - Model: test_case_small_network_with_ates
    - existing comment
r"""
This is a test to check the behaviour of the cumulative investments made and the
asset is realized variable. We want the asset only to become available once sufficient
investments are made.

In this specific test we optimize to match the heat demand. However, the sources are not
available from the start as the cumulative invesments made at timestep 0 is 0. Furthermore,
there is a cap on the investments that can be done per timestep. We expect the optimizer
to find a solution that releases the sources as soon as possible in order to match demand
and the demand not to be matched until that point in time.
"""

- test_ates.py:
    - Model: test_case_small_network_with_ates
    - new comment
r"""
Check that the ATES heat loss heat achieved by the network optmization is the same as analytically
expected (loss coef * stored heat [J]). Check if the ATES yearly cyclic constraint for the stored
heat [J] is achieved and that the amount of energy discharged form the ATES is less then the amount
of energy stored over the time horizon. --> this is roughly the length of comment we want      
"""



- test_buffer.py:
    - Model: simple_buffer, but the network is created in model.py, esdl to be created
    - new comment
r"""
....
    
"""

- test_electric_bus.py:
    - Model: check with Femke/Jim


- test_electric_source_sink.py:
    - Model: check with Femke/Jim

- test_end_scenario_sizing.py:
    - Model: test_case_small_network_ates_buffer_optional_assets
    - new comment
r"""
This is an optimization done over a full year with timesteps of 5 days and hour timesteps for the
peak day. This includes sizing of an asset (2 heat producers, ATES and/or buffer) if it is optimal
to be used to meet the required heating demand.
Checks:
 - Is heat demand matched.
 - Is the ATES cyclic constraint working 
 - Is the buffer tank only active in the peak day
""" 


- test_esdl_pycml.py:
    - Model: basic_source_and_demand --> modelica ? to be deleted? Redone ?
    - Pump, heat producer, supply and return pipe and 1 heating demand
    - Compare: pyton vs esdl ["demand.Heat_demand"]
    - Compare: test_basic_source_and_demand_qth -->python vs esdl "...._objective_values" not 100%
    sure what it is
r"""
....
    
"""

- test_examples.py:
    - Check if an example run failed or not ?
    - basic_buffer: ?
    - bidirectional_flow: ?
    - double_ring_example: model Westland ? 
    - pipe_diameter_sizing: 
        - A ring network with 2 geothermal energy sources and amd 3 heating demands 
        - ?pipes are not marked as optional in the esdl?
r"""
....
    
"""

- test_gas_multi_demand_source_node.py:
    - Model: source_sink: multi_demand_source_node
    - Check 
        - gas connection and joint head is the same
        - Conservation: sum(gas flow at demands) = sum(gas flow at source)        
r"""Test to verify that head is equal for all ports at a node. And throughout the network
        the flow (mass) balance is maintained"""

- test_gas_source_sink.py:
    - Model: source_sink: unit_cases_gas
    - Check:
        - Mass conservation: results["GasProducer_0876.GasOut.Q"], results["GasDemand_a2d8.GasIn.Q"]
        - Test if at the outlet of the pipe is less the at the intlet of the pipe 
r"""Unit tests for the MILP test case of a source, a pipe, a sink"""

- test_head_loss_mixin.py:
    - Model: basic_source_and_demand
    - Check:
        - TestHeadLossCalculation: test_scalar_return_type: Run optim for each head loss option
        (HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY, HeadLossOption.CQ2_INEQUALITY, HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY) and
        check the numerical head loss calculation.
        This is done by specififying the the flow rate for a pipe (pipe_hot) in 3 different ways
        (1 flow rate value, array with 1 flow rate and array with 3 flow rates) and checking that
        the head loss function returns 1 float value or an array of float values (array length the
        same as the input flow rate array length) 
        - TestHeadLossOptions: test_no_head_loss_mixing_options: Set options["head_loss_option"] = 
        HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY, then set pipe head loss option->HeadLossOption.NO_HEADLOSS
        - TestHeadLossOptions: test_no_head_loss: HeatProblemPyCML and QTHProblemPyCML # Test if a
        model with NO_HEADLOSS set runs without issues
r"""
....
    
"""

- test_heat_loss_u_values.py:
    - Model: "._heat_loss_u_values_pipe"
    - Check: 
        - Test heat loss U values for a pipe (heat_loss_u_values_pipe). This is done by
        specifying the inner diameter, insulation thickness and conductivities of the insulation.
        - Check that a single float value vs 1 array value for 1 insulation layer match
        - Check that the heat loss function returns U values in the correct order based on input
        - Check that thicker innner layer insulation has a smaller U-value   
        - Check that thicker outer layer insulation has a smaller U-value  
        - Check an insulation layer with a lower conductivity has a smaller U-value
        - Check that the U-value is the same for one thick insulation layer compared to 2 insulation
        layers (with the same total thickness as the 1 thick layer)   

r"""

"""

- test_heat.py:
    - TestHeat
        - Model: basic_source_and_demand
        - Check:
            - test_heat_loss
                - Model: double_pipe_heat - modelica ? Keep?
                - test_heat_loss: check that heat producer > heat demand when heat losses in the
                pipes are present 
            - test_zero_heat_loss
                - Model: basic_source_and_demand - ? modelica ? Keep?
                - test_zero_heat_loss: check optimisation runs when heat losses has been set to 0. No
                testing/checking of values are done.  
    - TestMinMaxPressureOptions
        - Model: basic_source_and_demand: heat_comparison - ? modelica ? Keep?
        - Check:
            - test_min_max_pressure_options:
                1. Force the pressure loss in the pipe to be higher than 8 bar, this is achieved by
                specifying a small pipe diameter. Then we check the pressure losses to see that the
                achieved pressure loss is more than 8bar
                2. In addition specifying a small pipe diameter, the minimum pressure is set to 4bar,
                and it is checked achieved minumum pressure is > 4*0.99bar and that the maximum
                pressure is > 8bar, since the total pressure loss is > 8bar. It is also checked that
                the objective value is the same as the objective value (index 4?) in 1.
                3. In addition specifying a small pipe diameter, the maximum pressure is set to 8bar,
                and it is checked achieved minumum pressure is > 4bar and that the maximum pressure
                is > 8*1.01bar, since the total pressure loss is > 8bar. It is also checked that the
                objective value is the same as the objective value (index 4?) in 1.
                4. In addition specifying a small pipe diameter, the minumum and maximum pressure
                is set to 4 and 8bar, and it is checked achieved minumum pressure is > 4*0.99bar and that
                the maximum pressure is > 8*1.01bar, since the total pressure loss is > 8bar. It is
                also checked that the objective values are > objective values*1.5 in 1.
    - TestDisconnectablePipe
        - Model: basic_source_and_demand: heat_comparison - ? modelica ? Keep?
        - Run a default simulation and then enforce 1 pipe to be disconnected by
            adding a constraint to force the volumetric flow rate to m3/s for the second time step. 
        - Check that:
            - the minimum velocity in the default case is > 0m/s
            - the flow rate in disconnected pipe is less then the same pipe in the default case?
            - the flow rate in disconnected pipe is 0 m3/since
            - there is still heat loss in the disconnected pipe due to 
            options["heat_loss_disconnected_pipe"] not being set to False
            - there is no heat loss in the disconnected pipe due to 
            options["heat_loss_disconnected_pipe"] being set to False
        - test_disconnected_pipe_darcy_weisbach
            """
            Just a sanity check that the head loss constraints for disconnectable
            pipes works with LINEARIZED_ONE_LINE_EQUALITY as well as LINEARIZED_N_LINES_WEAK_INEQUALITY.
            """
            - Check that: volumetric flow rate in a pipe for the disconnectable scenario with
            HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY and HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY are the same 

r"""
....
    
"""

- test_hydraulic_power.py:
    - Model: pipe_test
    Match heat demand while minimizing the sources with 3 different head loss linearization settings:
        Scenario 1. LINEARIZED_N_LINES_WEAK_INEQUALITY (1 line segment)
        Scenario 2. LINEARIZED_ONE_LINE_EQUALITY
        Scenario 3. LINEARIZED_N_LINES_WEAK_INEQUALITY (default line segments = 5)
    - Check:
        - For all scenarios (unless stated otherwise): 
            - check that the hydraulic power variable  (based on linearized setting) > numerically calculated (post processed)
            hydraulic power based on flow results (voluemtric flow rate * pressure loss). Reason being
            # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
            # The linear approximation of the 3rd order function should
            # overestimate the hydraulic power when compared to the product of Q and the linear
            # approximation of 2nd order function (delta pressure).
            - Scenario 1&3: check that the hydraulic power variable = known/verified value for the specific case
            - Scenario 1: check that the hydraulic power for the supply and return pipe is the same
            - Scenario 1&2: check that the hydraulic power for these two scenarios are the same
            - Scenario 2: check that the post processed hydraulic power based on flow results
            (voluemtric flow rate * pressure loss) of scenario 1 & 2 are the same.
            - Scenario 3: check that the hydraulic power variable of scenatio 1 > scenario 3, which
            would be expected because scenario 3 has more linear line segments, theerefore the
            approximation would be closer to the theoretical non-linear curve when compared to 1 linear
            line approximation of the theoretical non-linear curve. 
         

- test_insulation.py:
    - Model: insulation
r"""
    This testcase class should contain the following tests:
    1. Test to select the lowest heating demands (best insulation level), check that the
     resulting demands are the same as the original demand (input file) * insulation factor for the
     best insulation level and that the source is sufficient for the demands
    1b. Similar to test 1, test to select the lowest heating demand for HeatingDemand_e6b3 (has 3
     possible insulation levels), and only specify 1 insulation level (which must be active) for
     HeatingDemand_f15e

     Marked as still to be included:
    2. Test where only demand can be fulfilled by production if at least one Heatingdemand
     is insulated to reduce heating demand to below production capacity, but for other reasons
     should not insulate (reality this would be a case where the costs of insulation are
     relatively high thus insulation that is not cost efficient --> thus keeping high deltaT)(e.g.
     test with minimise pipe diameter, or minimize flow at sources)
    2b. Test as 2, but instead of not having enough production capacity in total, not having
     enough production capacity at standard network temperatures, such that network temperature of
     one hydraulically decoupled network should be reduced by insulation houses and thus reducing
     Tmin at those demands, such that lower network temperature can be chosen (again with minimize
     flow at sources) (e.g. still not cost efficient to insulate otherwise)
    3. Test to select LT sources (which have lower cost, but only possible if Tmin of demands is
     low enough)
    4. Test in which not all LT sources are selected as Tmin of demands is not low enough
     --> maybe 3 and 4 can be combined --> so forinstance only LT source behind HEX is selected due
     to insulation of that Heating demand, but other HD can not be insulated far enough for LT
     source on the primary network.(e.g. goal, minimise heat loss, does not solve the provided
     cases)
    5. Test where TCO minimised, combination of investment cost of insulation vs lower Temperature
     network, thus lower heat loss (and allowing cheaper LT producers).
    #TODO: add test cases 2, 2b, 3, 4 and 5 as detailed above
    #TODO: maybe we can make COP heatpump dependent on the chosen network temperatures
    """
    - Check:
     - Test 1:
        - Minimize the heat source while mathcing the heating demand, while allowing the heating
        demand to make use of all 3 insulations levels that are available. 
        - Check: 
            - That the best insulation level (reduces the heating demand the most) is selected for
            both heating demands.
            - That non of the other insulation levels have been marked as acitve/in use. No duplicate
            insulation levels over the time horizon for a heating demand.
            - That the produced heat (2 heat producers + heat pump) > heating demand.
            - That the resulting heating demand profile (reduced demand due to insulation
            being applied) is the same as the original heating demand * scaling_factor.
    - Test 1B: 
        - Make only 1 insulation level (the worst level which does not reduce the heating demand at
        all) avialable for selection for 1 of the heating demand, while still making 3 insualtion
        levels availabe for the other heaing demand.
        - Check:
            - That only the worst level is active/in use for the 1 specific heating demand.
            - That the best insulation level is active/in use for the other heating demand.
            - That there are no duplicate insulation levels over the time horizon for a heating
            demand.  
        
- test_max_size_and_optional_assets.py:
    - Model: test_case_small_network_with_ates_with_buffer and test_case_small_network_ates_buffer_optional_assets 
    - test_case_small_network_with_ates_with_buffer:    
        # Producer 1 should not produce due to higher cost
        # Producer 2 should produce  
            - Check: 
                # Test if source 1 is off and 2 is producing
                # Test if source 1 is not placed and 2 is placed
                # Test that max size is correct for producer 1 and 2, note that we use an equality check as
                due to the cost minimization they should be equal.
                # Test that investment cost is correctly linked to max size for the active produder number 2
                # Test that cost only exist for producer 2 and not for producer 1. Note the tolerances
                to avoid test failing when heat losses slightly change
                # Since the buffer and ates are not optional they must consume some heat to compensate
                losses. Therefore we can check the max_size constraint >= heat for each. For this check
                the aggregation count for both (should be 1).
    - test_case_small_network_ates_buffer_optional_assets: ? I think this is duplicate testing, this is done in other test cas as well?
        # This is the same problem, but now with the buffer and ates also optional.
        # Therefore we expect that the ates and buffer are no longer placed to avoid their heat
        # losses. This allows us to check if their placement constraints are proper.
        - Check: that the heat and aggregation count for ATES and the buffer tank is 0.

- test_multicommodity.py:
    - Model: unit_cases_electricity.heat_pump_elec
    """Test to verify that the optimisation problem can handle multicommodity problems, relating
    electricity and heat"""  
    - Check:
        - test_heat_pump_elec_min_heat:
            """Test to verify the optimisation of minimisation of the heat_source used, and thus
            exploiting the heatpump as much as possible, and minimum use of heat source at secondary
            side, this heat source should have zero heat production."""
            - 
        - test_heat_pump_elec_min_heat_curr_limit:
            """Test to verify the optimisation of minimisation of the heat_source used, however due to
            limitations in the electricity transport through the cables, the power and thus the heat
            produced at the heatpump is limited, resulting in heat production by the secondary
            heatsource, e.g. the heat produced by this asset is not 0."""
            -
        - test_heat_pump_elec_min_elec:
            """Test to verify the optimisation of minimisation of the electricity power used, and thus
            exploiting the heatpump only for heat that can not directly be covered by other sources as
            possible."""

- test_multiple_carriers.py:
    - Model: multiple_carriers
    # We check for a system consisting out of 2 hydraulically decoupled networks that the energy
    # balance equations are done with the correct carrier.

- test_multiple_in_and_out_port_components.py:
    - Model: heat_exchange, heatpump
    - heat_exchange:
        - Check:
            - # We check the energy converted betweeen the commodities 0.9 efficiency specified in esdl
            (primary heat * 0.9 == secondary heat)
            - # We check the energy being properly linked to the flows, this should already be satisfied
            # by the multiple commodity test but we do it anyway. --> Numerical check of the primary heat
            value based on the volumetric flow rate at the inlet of the heat exchanger primary side.
            - # Note that we are not testing the last element as we exploit the last timestep for
            # checking the disabled boolean and the assert statement doesn't work for a difference of
            # zero -->> Numerical check of the secondary side heat value. 
            - Aslo check that the last time step value in the primary heat is 0 ? Why is this? And that
            the the heat exchanger is enabled for all the time steps except the last time step ?Why?  
    - heatpump
        - Check:
            # TODO: we should also check if heatdemand target is matched
            # TODO: check if the primary source utilisisation is maximised and secondary minimised
            - TestHP:
                - Check the energy converted from electric to secondary heat
                (electric power * 4.0 == secondary heat), due a constant COP of 4 that was specified.
                - Check that the electic power + primary heat -- secondary heat ?Why, I do not
                understand defenition of the heat pump variables?
r"""
....
    
"""

- test_network_simulator.py:
     - Model: test_case_small_network_with_ates
    r"""
    In this test case 2 heat producers and an ATES is used to supply 3 heating demands. A merit
    order (preference of 1st use) is given to the producers: Producer_1 = 2 and Producer_2 = 1.

    Testing:
    - General checks namely demand matching, energy conservation and asset heat variable vs
      calculated heat (based on flow rate)
    - Check that producer 1 (merit oder = 2) is only used for the supply of heat lossed in the
      connected and is does not contribute to the heating demands 1, 2 and 3
    - Check that the ATES is not delivering any heat to the network during the 1st time step
    """

- test_pipe_diameter_sizing.py:
    - Model: pipe_diameter_sizing
    - Checks:
        - Check that half the network is removed, i.e. 4 pipes. Note that it is equally possible for
        the left or right side of the network to be removed.
        - Check that the correct/specific 4 pipes on the left or 4 on the right have been removed.
        - Check that the removed pipes do not have predicted hydraulic power values.
        - Check that the linearized hydraulic power results > numerically calculated hydraulic power
        (volumetric flow rate * pressure loss). Reason being:
        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The linear approximation of the 3rd order function should overestimate the hydraulic
        # power when compared to the product of Q and the linear approximation of 2nd order
        # function (delta pressure).
r"""
....
    
"""

- test_producer_profiles.py:
    - Model: unit_cases.case_3a
    - Check:
        - Check that heat produced is smaller than the profile for a geothermal source
        - Check that the heat demand is realized (heat_demand == target_heat_demand)
r"""To verify that the producer can have a given scaled profile, where the producer will always
produce equal or less than said profile. The constraint for the producer profile is checked by
ensuring that the producer is temporarily less available (reducing the profile value at a few time
steps)."""

- test_pycml_modelica.py:
    - Model: basic_source_and_demand.src.heat_comparison ? modelica?
    - Checks:
        - test_basic_source_and_demand_heat:
            - compare HeatPython & HeatModelica, check that objtive vales are the same
        - test_basic_source_and_demand_qth: 
            - Check that the objective values are the same ?to be decided?
r"""
....
    
"""

- test_pycml.py:
    - Model: rtctools_heat_network.pycml import Model, Variable
    - Check:
        - several? to stay or not ?

- test_qth_loop.py: left for now 
    - Model:
r"""
....
    
"""
- test_qth.py: left for now
    - Model:
r"""
....
    
"""

- test_setpoint_constraints.py:
    - test_setpoint_constraints
        -  Model: models.unit_cases.case_3a:
        - Checks:
            - Check that the results for the geothermal energy source has 1 and 0 setpoint changes.
            The network that is being optmized requires setpoint changes at the geothermal source for
            an optimal solution. Therefore it is checked if the network can be solved with no setpoint
            changes allowed and fi the 1 setpoint chnage is used by the optmizer when it is allowed.
        r""""
        Run the network under 2 different scenarios. Scenario 1 where the geothermal source is
        allowed to have 1 setpoint change in 45 hours and scenario 2 wit hno set point changes
        allowed 
        """"
    - Model:
        - test_run_small_ates_timed_setpoints_2_changes:
        r"""
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        2 changes/year.
        """
        
        - test_run_small_ates_timed_setpoints_0_changes:
        r"""
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        2 changes/year.
        """
        - test_run_small_ates_timed_setpoints_multiple_constraints:
        r"""
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        2 changes/year.
        """

- test_varying_temperature.py:
    - Model: models.unit_cases.case_1a
        r""""This optimization problem is to see whether the correct minimum delta temperaute is
        chose by the optimization, a minimum of 21 deg is needed. However, the from the allowable
        supply and return temperatures specified (70/60, 70/65, 75/60, 75/65) only the 75/60
        degees celcius option is feasible. Note for this run the maximum velocity was specified
        low to a low value to force the optimization to require a dT of mroe than 20 degrees
        celcuis. 
        - Checks: that the correct tmeperature has been selected for each carrier by the optimizer
    - Model: models.unit_cases.case_3a
        - Scenario 1:
            r""""
            Optimization with two choices in supply temp 80 and 120 deg celcius. The lowest temperature
            should be selected because of lower heat losses and the heat production minimization goal
            that is used in the optimization.
            """"
            - Checks:
                - Check whehter the heat demand is matched.
                - Check that the lowest temperature (80.0) is the temperature that has been chosen for
                the carrier by the optimization
                - Verify that also the integer is correctly set for the available temperatures in
                terms of being used (1) or not (0).
        - Scenario 2:
            r""""
            Optimization with two choices in return temp 30 and 40 degrees celcius. The lowest temperature
            should be selected because the supply temperature is fixed, lowering the return temperature
            will ensure a larger temperature difference between the supply and retrun line which would
            result in the lowest flow rates. This is applicable becasue we apply source volumetric flow
            rate minimization goal
            """"
            - Checks:
                - Check whether the heat demand is matched
                - Check that the lowest temperature (30.0) is the temperature that has been chosen for
                the carrier by the optimization   
                - Verify that also the integer is correctly set for the available temperatures in
                terms of being used (1) or not (0).
    - Model: heat_exchange
        - Scenario 1:
            r"""
            Optimization with three choices of primary supply temperature of which the lowest is
            infeasible. Therefore optimization should select second lowest option of 80 degrees celcius.
            The lowest feasible temperature should be selected due to heatlosses and the minimization
            goal of the sources that are employed in this optmization.     
            """
            - Checks:
                - Check that the lowest feasible temperature (80.0) is the temperature that has been
                chosen by the optimization and not the 69 degrees celcius which is below the secondary
                side supply temperature.
                - Verify that also the integer is correctly set for the available temperatures in
                terms of being used (1) or not (0).
        - Scenario 2:
            r""""
            Optimization with only one option in temperature which is infeasible for the hex therefore
            optimization should disable the heat exchanger which connect the 2 hydraulic decoupled
            networks
            """"
            - Checks:
                - Check that the problem has an infeasible temperature in the supply line for the
                heat exchanger
                - Verify that the hex is disabled.
        - Scenario 3:
            r""""
            Optimization with two choices in secondary supply temp 70 and 90 degrees celcuis. The
            lowest temperature should be selected because of larger dT causing lowest flow rates
            which is applicable because a source dH minimization goal is applied in this scenario.
            """"
            - Checks:
                - Check that the lowest available temperature (70.0) is the temperature that is
                selected for the carrier.
                - Verify that also the integer is correctly set for the available temperatures in
                terms of being used (1) or not (0).

- test_warmingup_unit_cases.py: 
? all these models have been marked as -->> # Just a "problem is not infeasible"? What is up with this?
? Can we maybe run the Grow_Simulator on these?
    - Model: unit_cases.case_1a
        r""""
        """"
        - Checks: none
    - Model: unit_cases.case_2a
        r""""
        """"
        - Checks: none
    - Model: unit_cases.case_3a
        r""""
        """"
        - Checks: none


***************************************************************************************************

- models --->> put in seperate readme and place in models:
    - test_case_small_network_with_ates:
        r"""
        This a relative small tree? network consisting of 2 renewable heat producers, 1 ATES and
        3 heating demands. 
        """ --->>> this comment to be added at the top of file, will help to do a quick scan of models
        -->> heat problem class give explanation of the setup, this will only be in the code
        - Do we want to say anything about input data (profile, etc) for assets?
    - test_case_small_network_ates_buffer_optional_assets:
        r"""
        This a relative small tree? network consisting of 2 renewable heat producers, 1 ATES, 1 
        buffer tank storage and 3 heating demands. The following assets are specified as being
        optional: both heat producers, ATES and the buffer tank storage.   
        """
    - unit_cases_gas: multi_demand_source_node:  
        r"""
        2 gas producers and 2 gas demands all connected to 1 joint via pipes
        """
    - source_sink: unit_cases_gas:
        r"""
        1 gas producers connected to 1 gas demand via 1 pipe
        """
    - basic_source_and_demand:
        r"""
        1 heat producer connected to 1 heating demand via 1 supply and return pipe
        """
        
    - double_pipe_heat: modelica? Network created in Python file
        r"""
        ...
        """
    - pipe_test:
        r"""
        Network consisting out of 1 heat producer and 1 consumer with 1 supply and return pipe
        """
    - insulation:
        r"""
        Network consisting out of 2 residual heat producer on a primary grid, which are connected to
        a secondary grid via a heat exchanger (GenericConversion). The secondary grid consists out of
        1 generic heat producer, connecetd to a heat pump, 1 buffer tank and 1 consumer. There are
        3 available insulations levels (each linked to a scaling factor, min temp and insulation cost).  
        """
    - test_case_small_network_with_ates_with_buffer:
        r"""
        The same as test_case_small_network_ates_buffer_optional_assets, with the only excpetion
        that the buffer is not marked as being optional. 
        """
    - unit_cases_unit_cases_electricity.heat_pump_elec:
        r"""
        The network consists out elecricity source connected to a heat pump (seems to be a water to water?).
        There are 2 DH networks, 1 consisting out of a heating demand being supplied by the residual
        energy producer. This network also acts as the secondary input and output for the heat pump.
        The 2nd DH network gets heat from the heat pump (primary side) and a residual heat source
        which then supplies to 1 heating demand.   
        """
    - multiple_carriers:
        r"""
        The system consist out of 2 competely decoupled DH network, with each network having its
        own unique heat carrier. Each network consist out of a 1 heating demand being connected to
        1 heat producer via supply and return pipes. The supply and retrun line consist out of 2
        pipes being connected via a joint.  
        """
    - heat_exchange:
        r"""
        The system consists out of 2 hydraulic decoupled DH networks that are connected via a heat
        exchanger. Each network consists out of 1 residual heat source and 1 heating demand. 
        """
    - heatpump:
        r"""
        The system consists out of 2 hydraulic decoupled DH networks that are connected via a heat pump
        exchanger. Each network consists out of 1 residual heat source and 1 heating demand. 
        """
    - pipe_diameter_sizing (this is part of the examples):
        r"""
        A ring network consting out of 2 residual heat sources and 3 consumers. Several pipe classes
        are made available including an invalid class (None) with all its attributes being set to 0.
        """
    - unit_cases.case_3a:
        r""""
        The network consists out of a geothermal energy source which is connected to a buffer tank
        and 3 heating demands.
        """"
    - unit_cases.case_1a:
        r""""
        The network consists out 1 residual heat source that is connected to 3 heating demands at 1
        junction point.
        """"
   
***************************************************************************************************


- Scaling checks

    Scaling checks have been included in the following test functions:
        test_absolute_heat
        test_asset_is_realized
        test_ates
        test_airco
        test_cold_demand
        test_wko
        test_end_scenario_sizing
        test_gas_boiler
        test_heat_network_head_loss_LINEARIZED_N_LINES_WEAK_INEQUALITY
        test_heat_network_head_loss_LINEARIZED_N_LINES_EQUALITY
        test_heat_loss
        test_insulation_heatdemand
        test_multi_commodity_simulator_priorities_el
        test_network_simulator
        test_pipe_class_var
        test_1a
        test_2a
