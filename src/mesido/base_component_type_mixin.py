from abc import abstractmethod
from typing import Dict, List

from .topology import Topology


class BaseComponentTypeMixin:
    """
    The standard naming convention is that pipes have "_hot" and "_cold" suffixes.
    Such convention can be overridden using the `is_hot_pipe` and `is_cold_pipe` methods.
    Moreover, one has to set the mapping between hot and cold pipes via `hot_to_cold_pipe`
    and `cold_to_hot_pipe`.
    """

    @property
    @abstractmethod
    def energy_system_components(self) -> Dict[str, str]:
        """
        This method return a dict with the components structured by asset_type.
        """
        raise NotImplementedError

    @property
    @abstractmethod
    def energy_system_components_commodity(self) -> Dict[str, List[str]]:
        """
        This method return a dict with the components ad their network types.
        """
        raise NotImplementedError

    def energy_system_components_get(self, list_types: list) -> list:
        components = []
        for component_type in list_types:
            components.extend(self.energy_system_components.get(component_type, []))
        components = list(set(components))
        return components

    @property
    @abstractmethod
    def energy_system_topology(self) -> Topology:
        """
        The method return a Topology object that contains asset with specific
        topology and associated direction information needed for the physics in the constraints
        """
        raise NotImplementedError

    def is_hot_pipe(self, pipe: str) -> bool:
        """
        The function return true if the pipe is a supply pipe based on a name convention
        """
        return pipe.endswith("_hot")

    def is_cold_pipe(self, pipe: str) -> bool:
        """
        The function return true if the pipe is a return pipe based on a name convention
        """
        return pipe.endswith("_cold")

    def hot_to_cold_pipe(self, pipe: str):
        """
        This function returns the name of the associated cold/return pipe of a supply/hot pipe.
        """
        assert self.is_hot_pipe(pipe)

        return f"{pipe[:-4]}_cold"

    def cold_to_hot_pipe(self, pipe: str):
        """
        This function returns the name of the associated hot/supply pipe of a cold/return pipe.
        """
        assert self.is_cold_pipe(pipe)

        return f"{pipe[:-5]}_hot"

    def has_related_pipe(self, pipe: str) -> bool:
        """
        This function checks whether a pipe has a related hot/cold pipe. This is done based on the
        name convention.

        :params pipe: is the pipe name.
        :returns: True if the pipe has a related pipe, else False.
        """
        related = False
        if self.is_hot_pipe(pipe):
            if self.hot_to_cold_pipe(pipe) in self.energy_system_components.get("heat_pipe", []):
                related = True
        elif self.is_cold_pipe(pipe):
            if self.cold_to_hot_pipe(pipe) in self.energy_system_components.get("heat_pipe", []):
                related = True
        return related

    @property
    def hot_pipes(self) -> List[str]:
        """
        This function return a list of all the supply/hot pipe names.
        """
        return [
            p for p in self.energy_system_components.get("heat_pipe", []) if self.is_hot_pipe(p)
        ]

    @property
    def cold_pipes(self) -> List[str]:
        """
        This function return a list of all the return/cold pipe names.
        """
        return [
            p for p in self.energy_system_components.get("heat_pipe", []) if self.is_cold_pipe(p)
        ]
