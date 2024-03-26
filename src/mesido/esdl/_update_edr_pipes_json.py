import json
import xml.etree.ElementTree as ET  # noqa: N817
from typing import Tuple

from mesido._heat_loss_u_values_pipe import heat_loss_u_values_pipe

import requests


def main():
    """
    This script is meant to create a local update of the json file that has the standard pipe
    properties. These pipe classes are then used to select the most desireble pipe class

    Returns
    -------
    Nothing, it writes json file.
    """
    logstore = requests.get("https://edr.hesi.energy/api/edr_list?category=Assets/Logstore").json()
    asset_id_map = {x["title"].rsplit(".", maxsplit=1)[0]: x["key"] for x in logstore}

    # Build a dictionary of EDR pipe name to its properties.
    pipe_properties_map = {}

    for a, key in asset_id_map.items():
        xml_string = requests.get(f"https://edr.hesi.energy/api/edr_item?id={key}").json()[
            "esdl_string"
        ]
        tree = ET.fromstring(xml_string)

        inner_diameter = float(tree.get("innerDiameter"))

        investmet_cost = float((tree.findall(".//investmentCosts")[0]).get("value"))

        components = tree.findall(".//component")

        insulation_thicknesses = []
        conductivities_insulation = []

        for c in components:
            insulation_thicknesses.append(float(c.get("layerWidth")))
            matters = c.findall("matter")
            assert len(matters) == 1
            conductivities_insulation.append(float(matters[0].get("thermalConductivity")))

        u_1, u_2 = heat_loss_u_values_pipe(
            inner_diameter=inner_diameter,
            insulation_thicknesses=insulation_thicknesses,
            conductivities_insulation=conductivities_insulation,
        )

        pipe_properties_map[a] = {
            "inner_diameter": inner_diameter,
            "u_1": u_1,
            "u_2": u_2,
            "insulation_thicknesses": insulation_thicknesses,
            "conductivies_insulation": conductivities_insulation,
            "investment_costs": investmet_cost,
            "xml_string": xml_string,
        }

    # Sort the list based on prefix and diameter
    def _sort_series_dn(name: str) -> Tuple[str, int]:
        """
        This function sorts the list based on prefix and diameter
        Parameters
        ----------
        name : string with name of the pipe

        Returns
        -------
        Prefix of the name and the DN size in at int
        """
        a, b = name.rsplit("-", maxsplit=1)
        return a, int(b)

    pipe_properties_map = dict(
        sorted(pipe_properties_map.items(), key=lambda x: _sort_series_dn(x[0]))
    )

    # Export it to an indented (=human readable) JSON file
    json.dump(pipe_properties_map, open("_edr_pipes.json", "w"), indent=4)


if __name__ == "__main__":
    main()
