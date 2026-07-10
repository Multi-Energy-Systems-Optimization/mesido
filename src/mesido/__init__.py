import rtctools_highs  # noqa: F401 — registers HiGHS 1.14.0 plugin with CasADi

from ._version import get_versions

__version__ = get_versions()["version"]
del get_versions
