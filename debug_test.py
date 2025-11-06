from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent / "src"))
sys.path.insert(0, str(Path(__file__).parent))

import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.workflows.utils.error_types import NO_POTENTIAL_ERRORS_CHECK

base_folder = Path(run_ates.__file__).resolve().parent.parent

solution_staged = run_end_scenario_sizing(
    EndScenarioSizingStaged,
    base_folder=base_folder,
    esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
    esdl_parser=ESDLFileParser,
    profile_reader=ProfileReaderFromFile,
    input_timeseries_file="Warmte_test.csv",
    error_type_check=NO_POTENTIAL_ERRORS_CHECK,
)

results = solution_staged.extract_results()

print(f"\n=== OBJECTIVE VALUE ===")
print(f"Objective value: {solution_staged.objective_value}")

print(f"\n=== BUFFER AGGREGATION COUNT ===")
for b in solution_staged.energy_system_components.get("heat_buffer", []):
    print(f"{b}_aggregation_count: {results[f'{b}_aggregation_count']}")
    
print(f"\n=== ATES AGGREGATION COUNT ===")
for a in solution_staged.energy_system_components.get("ates", []):
    print(f"{a}_aggregation_count: {results[f'{a}_aggregation_count']}")
