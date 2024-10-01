from typing import Dict, List, Tuple

from mesido.heat_network_common import NodeConnectionDirection


class Topology:
    def __init__(
        self,
        nodes=None,
        gas_nodes=None,
        pipe_series=None,
        buffers=None,
        atess=None,
        busses=None,
        demands=None,
        sources=None,
    ):
        if nodes is not None:
            self._nodes = nodes
        if gas_nodes is not None:
            self._gas_nodes = gas_nodes
        if pipe_series is not None:
            self._pipe_series = pipe_series
        if buffers is not None:
            self._buffers = buffers
        if busses is not None:
            self._busses = busses
        if atess is not None:
            self._atess = atess
        if demands is not None:
            self._demands = demands
        if sources is not None:
            self._sources = sources

    @property
    def nodes(self) -> Dict[str, Dict[int, Tuple[str, NodeConnectionDirection]]]:
        """
        Maps a node name to a dictionary of its connections. Written out using
        descriptive variable names the return type would be:
            Dict[node_name, Dict[connection_index, Tuple[connected_pipe_name, pipe_orientation]]]
        """
        try:
            return self._nodes
        except AttributeError:
            raise NotImplementedError

    @property
    def gas_nodes(self) -> Dict[str, Dict[int, Tuple[str, NodeConnectionDirection]]]:
        """
        Maps a gas_node name to a dictionary of its connections. Written out using
        descriptive variable names the return type would be:
            Dict[node_name, Dict[connection_index, Tuple[connected_pipe_name, pipe_orientation]]]
        """
        try:
            return self._gas_nodes
        except AttributeError:
            raise NotImplementedError

    @property
    def busses(self) -> Dict[str, Dict[int, Tuple[str, NodeConnectionDirection]]]:
        """
        Maps a bus name to a dictionary of its connections. Written out using
        descriptive variable names the return type would be:
            Dict[bus_name, Dict[connection_index, Tuple[connected_cable_name, cable_orientation]]]
        """
        try:
            return self._busses
        except AttributeError:
            raise NotImplementedError

    @property
    def pipe_series(self) -> List[List[str]]:
        """
        Return a list of a pipe series (which itself is a list of pipe names
        per serie). Note that all pipes in a series should have the same
        orientation.
        """
        try:
            return self._pipe_series
        except AttributeError:
            raise NotImplementedError

    @property
    def buffers(
        self,
    ) -> Dict[str, Tuple[Tuple[str, NodeConnectionDirection], Tuple[str, NodeConnectionDirection]]]:
        """
        Maps a buffer name to a dictionary of its in/out connections. Written out using
        descriptive variable names the return type would be:
            Dict[buffer_name, Tuple[Tuple[hot_pipe, hot_pipe_orientation],
                                    Tuple[cold_pipe, cold_pipe_orientation]]]
        """
        try:
            return self._buffers
        except AttributeError:
            raise NotImplementedError

    @property
    def ates(
        self,
    ) -> Dict[str, Tuple[Tuple[str, NodeConnectionDirection], Tuple[str, NodeConnectionDirection]]]:
        """
        Maps an ates name to a dictionary of its in/out connections. Written out using
        descriptive variable names the return type would be:
            Dict[buffer_name, Tuple[Tuple[hot_pipe, hot_pipe_orientation],
                                    Tuple[cold_pipe, cold_pipe_orientation]]]
        """
        try:
            return self._atess
        except AttributeError:
            raise NotImplementedError

    @property
    def demands(
        self,
    ) -> Dict[str, Tuple[str, NodeConnectionDirection]]:
        """
        Maps an demand name to a dictionary of its in/out connections. Written out using
        descriptive variable names the return type would be:
            Dict[demand_name, Tuple[pipe/cable, orientation]
        """
        try:
            return self._demands
        except AttributeError:
            raise NotImplementedError

    @property
    def sources(
        self,
    ) -> Dict[str, Tuple[str, NodeConnectionDirection]]:
        """
        Maps a source name to a dictionary of its in/out connections. Written out using
        descriptive variable names the return type would be:
            Dict[source_name, Tuple[pipe/cable, orientation]
        """
        try:
            return self._sources
        except AttributeError:
            raise NotImplementedError
