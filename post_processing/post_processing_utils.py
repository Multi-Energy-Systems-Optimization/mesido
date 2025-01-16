import json
import os
from typing import Dict, Union

import numpy as np
from rtctools._internal.alias_tools import AliasDict


class AliasDictResults:
    """
    This class allows for the handling of the result data created by MESIDO.
    In MESIDO aliasing of variables is used to reduce computational effort. This results in fewer
    variables being saved with their own names.
    This class takes the loaded jsons of the results and aliases to be converted to an alias dictionary again.
    Using the get_results method the result of each original variable name can be accessed.
    """
    def __init__(self, results, aliases):
        self.results = results
        self._aliases = aliases

    def get_results(self, name):
        if name in self.results.keys():
            return self.results[name]
        else:
            alias = self._aliases[name]
            return alias[1]*self.results[alias[0]]

    def __getitem__(self, name):
        #TODO check if this now works and get_results can be removed
        if name in self.results.keys():
            return self.results[name]
        else:
            alias = self._aliases[name]
            return alias[1] * self.results[alias[0]]

    def get_results_as_array(self, name):
        return np.array(self.results[name])

def extract_data_results_alias(data_path: str) -> [AliasDictResults, Dict]:
    raw_data = extract_data_results(data_path)
    results_alias_dict = create_alias_dict(raw_data)
    return results_alias_dict, raw_data

def create_alias_dict(data: Dict)-> AliasDictResults:
    """
    Creates the alias dict from the dictionary which contains the aliases and results.
    :param data:
    :return:
    """
    return AliasDictResults(data["results"], data["aliases"])

def extract_data_results(data_path: str) -> Dict:
    """
    Extracts the data from the json files created after a run with MESIDO
    :param data_path: String containing the absolute path to the folder with the json files created
     by MESIDO.
    :return: dictionary with the data from the json files
    """
    file_names = ["results", "parameters", "bounds", "aliases", "solver_stats"]
    data = {}
    for f in file_names:
        input_path = os.path.join(data_path, f"{f}.json")
        try:
            with open(input_path) as file:
                data_file = json.load(file)
            data[f] = data_file
        except IOError:
            pass

    return data


def pipe_velocity(asset_name: str, commodity: str, results: Union[AliasDictResults, AliasDict],
parameters: Dict) -> np.array:
    """
    Post-processing to determine the pipe_velocity.
    To be used in code and as post-processing from jsons.
    Args:
        asset_name: asset_name of gas or heat pipe
        results: AliasDict with results
        parameters: Dict with results

    Returns:

    """
    post_processed_velocity = (
            results[f"{asset_name}.{commodity}Out.Q"] / parameters[f"{asset_name}.area"]
    )
    return post_processed_velocity
