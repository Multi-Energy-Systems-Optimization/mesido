from pathlib import Path
from typing import Any

import esdl
from esdl.esdl_handler import EnergySystemHandler
from esdl.profiles.credentials import Credentials
from esdl.profiles.profile_utils import get_time_varying_profile_header_and_raw_data


if __name__ == "__main__":
    database_credentials: list[dict[str, Any]] = [
        {
            "host": "localhost",
            "port": "5432",
            "username": "postgres",
            "password": "password",
            "database": "energy_profiles",
            "ssl_enabled": False,
        }
    ]

    esdl_path = Path("Delft_T_proftest.esdl")
    esh = EnergySystemHandler()
    es = esh.load_file(str(esdl_path))

    for cred in database_credentials:
        Credentials.add_credential(cred["host"], cred["username"], cred["password"])

    # Print all profiles
    for el in es.eAllContents():
        if isinstance(el, esdl.Asset) and hasattr(el, "port") and el.port is not None:
            for port in el.port:
                if hasattr(port, "profile") and port.profile is not None:
                    for profile in port.profile:
                        print(profile)
                        profile_raw_data, profile_header = (
                            get_time_varying_profile_header_and_raw_data(profile, True)
                        )

                        if profile_header is not None:
                            print(profile_header)
                            for data in profile_raw_data[:10]:
                                print(data)

