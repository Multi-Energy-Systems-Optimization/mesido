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

    import matplotlib.pyplot as plt

    solution.times()
    for ates in solution.energy_system_components.get("ates", []):
        print(results[f"{ates}.Stored_heat"])    
    
    figure, ax = plt.subplots()
    times = solution.times()
    for ates in solution.energy_system_components.get("ates", []):
        # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
        plt.plot(times/3600/24, results[f"{ates}.Stored_heat"]/1E9, label=str(ates))

    plt.xlabel("Time [days]")
    plt.ylabel("Stored Heat [GJ]")
    plt.title("Heat Storage vs Time")
    plt.legend()
    plt.xticks(range(0, int(times[-1]/3600/24) + 1,20), minor=True)  
    coarse_ticks = [0,  365,  730, 1095]
    plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
    plt.grid()
    plt.tight_layout()  
    plt.show()
    savefig = base_folder / "heat_storage_vs_time.png"
    plt.savefig(savefig)
    plt.close()


    figure, ax = plt.subplots()
    times = solution.times()
    for heatsource in solution.energy_system_components.get("heat_source", []):
        # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
        plt.plot(times/3600/24, results[f"{heatsource}.Heat_source"]/1E6, label=str(heatsource))

    plt.xlabel("Time [days]")
    plt.ylabel("Heat produced [MW]")
    plt.title("Heat [produced] vs Time")
    plt.legend()
    plt.xticks(range(0, int(times[-1]/3600/24) + 1,20), minor=True)  
    coarse_ticks = [0,  365,  730, 1095]
    plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
    plt.grid()
    plt.tight_layout()  
    plt.show()
    savefig = base_folder / "heat_produced_vs_time.png"
    plt.savefig(savefig)
    plt.close()

    figure, ax = plt.subplots()
    for ates in solution.energy_system_components.get("ates", []):
        # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
        plt.plot(times/3600/24, results[f"{ates}.Heat_ates"]/1E6, label=str(ates) + " Heat_ates")
        plt.plot(times/3600/24, results[f"{ates}.Heat_loss"]/1E6, label=str(ates)+ " Heat_loss")
        plt.plot(times/3600/24, results[f"{ates}.Storage_yearly_change"]/1E6, label=str(ates) + " Storage_yearly_change")


    plt.xlabel("Time [days]")
    plt.ylabel("Heat [MW]")
    plt.title("Heat  vs Time")
    plt.legend()
    plt.xticks(range(0, int(times[-1]/3600/24) + 1,20), minor=True)  
    coarse_ticks = [0,  365,  730, 1095]
    plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks]) 
    plt.grid()
    plt.tight_layout()
    plt.show()
    savefig = base_folder / "heat_ates_vs_time.png"
    plt.savefig(savefig)
    plt.close()
    
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