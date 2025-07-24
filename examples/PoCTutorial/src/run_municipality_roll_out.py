from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import run_end_scenario_sizing
from mesido.workflows.rollout_workflow import RollOutProblem # not yet added to init of workflows
# as this is still work in progress, and shouldn't be used yet.

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    solution = run_end_scenario_sizing(
        RollOutProblem,
        base_folder=base_folder,
        esdl_file_name="PoC_tutorial_incl_ATES.esdl", #"GROW_withATES_Prod_install.esdl",
        esdl_parser=ESDLFileParser,
    )
    results = solution.extract_results()

    solution.times()
    for ates in solution.energy_system_components.get("ates", []):
        print(results[f"{ates}.Stored_heat"])
    for source in [*solution.energy_system_components.get("heat_source", []),
                   *solution.energy_system_components.get("heat_demand", []),
                   *solution.hot_pipes,]:
        print(f"{source} is placed over time: {[results[f'{source}__is_placed_{year}'] for year in range(solution._years)]}")
        try:
            print(
                f"{source} is placed over time: {[results[f'{source}__asset_is_realized_{year}']for year in range(solution._years)]}")
        except:
            pass
        print(f"{source} has a cumulative investment over time of: {[results[f'{source}__cumulative_investments_made_in_eur_year_{year}']for year in range(solution._years)]}")
    print(f"Yearly capex spent: "
          f"{[results[f'yearly_capex_{year}'] for year in range(solution._years)]}")

    print('Done')