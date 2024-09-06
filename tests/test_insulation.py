from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestInsulation(TestCase):
    """
    This testcase class should contain the following tests:
    1. Test to select the lowest heating demands (best insulation level), check that the
     resulting demands are the same as the original demand (input file) * insulation factor for the
     best insulation level and that the source is sufficient for the demands
    1b. Similar to test 1, test to select the lowest heating demand for HeatingDemand_e6b3 (has 3
     possible insulation levels), and only specify 1 insulation level (which must be active) for
     HeatingDemand_f15e
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

    # test1
    def test_insulation_heatdemand(self):
        """
        Check that the best insulation class is selected when we optimize for minimal
        heat production.

        Checks:
        - That the correct insulation class is selected
        - Check that the other insulation classes are not selected
        - Check that there is sufficient heat.
        - Check that the profile that is matched is as expected

        Missing:
        - Energy conservation and heat to discharge (replace current check of sufficient heat)

        """
        import models.insulation.src.run_insulation as run_insulation
        from models.insulation.src.run_insulation import HeatProblem

        base_folder = Path(run_insulation.__file__).resolve().parent.parent
        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="Insulation.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = heat_problem.extract_results()

        test = TestCase()
        test.assertTrue(heat_problem.solver_stats["success"], msg="Optimisation did not succeed")

        # Check that only the demand for insulation A has been selected for every time step
        np.testing.assert_allclose(
            1.0,
            results["HeatingDemand_f15e__demand_insulation_class_A"],
            err_msg="The lowest demand (insulation level A) has not been selected for every time"
            " step",
        )
        np.testing.assert_allclose(
            1.0,
            results["HeatingDemand_e6b3__demand_insulation_class_A"],
            err_msg="The lowest demand (insulation level A) has not been selected for every time"
            " step",
        )
        other_demand_insulation_class = (
            results["HeatingDemand_f15e__demand_insulation_class_B"]
            + results["HeatingDemand_e6b3__demand_insulation_class_B"]
            + results["HeatingDemand_f15e__demand_insulation_class_C"]
            + results["HeatingDemand_e6b3__demand_insulation_class_C"]
        )
        np.testing.assert_allclose(
            0.0,
            other_demand_insulation_class,
            err_msg="Insulation B or C should not be selected for any demand",
        )
        # Check that the heat sources (not connected to HP) + HP secondary > demand
        tot_src = (
            results["ResidualHeatSource_6783.Heat_source"]
            + results["ResidualHeatSource_4539.Heat_source"]
            + results["HeatPump_cd41.Secondary_heat"]
            - results["HeatStorage_bce7.Heat_buffer"]
        ) / 1.0e6
        tot_dmnd = (
            results["HeatingDemand_f15e.Heat_demand"] + results["HeatingDemand_e6b3.Heat_demand"]
        ) / 1.0e6
        np.testing.assert_array_less(
            (tot_dmnd - tot_src), 0.0, err_msg="The heat source is not sufficient"
        )
        # Check that the demand load achieved == (base demand load * insulation level scaling
        # factor. Insulation level "A" should be active, which is index=0 in the insulation_levels
        # attributes index
        np.testing.assert_allclose(
            heat_problem.base_demand_load("HeatingDemand_f15e")[0:5]
            * heat_problem.insulation_levels()["scaling_factor"][0],
            results["HeatingDemand_f15e.Heat_demand"],
            err_msg="The scaled demand value is incorrect: HeatingDemand_f15e.Heat_demand",
        )
        np.testing.assert_allclose(
            heat_problem.base_demand_load("HeatingDemand_e6b3")[0:5]
            * heat_problem.insulation_levels()["scaling_factor"][0],
            results["HeatingDemand_e6b3.Heat_demand"],
            err_msg="The scaled demand value is incorrect: HeatingDemand_e6b3.Heat_demand",
        )

    # test1_B
    def test_insulation_heatdemand_b(self):
        """
        Similar to test one, only now one of the demands only has one insulation class available.

        Checks:
        - That the correct insulation class is selected
        - Check that the other insulation classes are not selected

        """
        import models.insulation.src.run_insulation as run_insulation
        from models.insulation.src.run_insulation import HeatProblemB

        base_folder = Path(run_insulation.__file__).resolve().parent.parent
        heat_problem = run_esdl_mesido_optimization(
            HeatProblemB,
            base_folder=base_folder,
            esdl_file_name="Insulation.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = heat_problem.extract_results()

        test = TestCase()
        test.assertTrue(heat_problem.solver_stats["success"], msg="Optimisation did not succeed")

        # Check that only the demand for insulation A has been selected for every time step
        np.testing.assert_allclose(
            1.0,
            results["HeatingDemand_e6b3__demand_insulation_class_A"],
            err_msg="The lowest demand (insulation level A) has not been selected for every time"
            " step",
        )
        other_demand_insulation_class = (
            abs(results["HeatingDemand_e6b3__demand_insulation_class_B"])
            + results["HeatingDemand_e6b3__demand_insulation_class_C"]
        )

        np.testing.assert_allclose(
            0.0,
            other_demand_insulation_class,
            err_msg="Insulation B or C should not be selected for any demand",
            atol=1e-8,
        )
        # Check that insulation level C is active for HeatingDemand_f15e
        np.testing.assert_allclose(
            1.0,
            results["HeatingDemand_f15e__demand_insulation_class_C"],
            err_msg="The lowest demand (insulation level C) has not been selected for every time"
            " step",
        )

    # TODO: add test case code below:
    # test2 &2b
    # def test_insulation_prod_capacity_temperature(self):
    #     import models.insulation.src.run_insulation as run_insulation
    #     from models.insulation.src.run_insulation import HeatProblemSources

    #     base_folder = Path(run_insulation.__file__).resolve().parent.parent
    #     heat_problem = run_optimization_problem(HeatProblemSources, base_folder=base_folder)

    #     results = heat_problem.extract_results()

    #     # TODO: add the checks


# TODO add test for electricity
# class TestElectricity(TestCase):
#     """
#     This testcase class should contain the following tests:
#     1. Variable electricity price during day: when electricity price low, HP should operate to its
#     maximum and fill buffer, during high electricity price HP running lower capacity (only test
#     with hourly timestep and timehorizon of few days.
#     2.
#     """


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestInsulation()
    a.test_insulation_heatdemand()
    a.test_insulation_heatdemand_b()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
