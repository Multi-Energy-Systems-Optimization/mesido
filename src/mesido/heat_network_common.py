from enum import IntEnum


class CheckValveStatus(IntEnum):
    """
    Enumeration for the possible status a check valve can have.
    """

    CLOSED = 0
    OPEN = 1


class ControlValveDirection(IntEnum):
    """
    Enumeration for the possible directions a control valve can have.
    """

    NEGATIVE = -1
    POSITIVE = 1


class PipeFlowDirection(IntEnum):
    """
    Enumeration for the possible directions a pipe can have.
    """

    NEGATIVE = -1
    DISABLED = 0
    POSITIVE = 1


class NodeConnectionDirection(IntEnum):
    """
    Enumeration for the orientation of a pipe connected to a node, or of the
    flow into a node.
    """

    OUT = -1
    IN = 1
