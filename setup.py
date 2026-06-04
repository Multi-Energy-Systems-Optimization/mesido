"""Multi Energy System Optimization

MILP optimization for design and operational optimization
"""

from pathlib import Path

from setuptools import find_packages, setup

import versioneer

this_directory = Path(__file__).parent
long_description = (this_directory / "README.md").read_text()

DOCLINES = __doc__.split("\n")

CLASSIFIERS = """\
Development Status :: 4 - Beta
Intended Audience :: Science/Research
Intended Audience :: Information Technology
License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)
Programming Language :: Other
Topic :: Scientific/Engineering :: GIS
Topic :: Scientific/Engineering :: Mathematics
Topic :: Scientific/Engineering :: Physics
Operating System :: Microsoft :: Windows
Operating System :: POSIX
Operating System :: Unix
Operating System :: MacOS
"""

setup(
    name="mesido",
    version=versioneer.get_version(),
    description=DOCLINES[0],
    long_description=long_description,
    long_description_content_type="text/markdown",
    classifiers=[_f for _f in CLASSIFIERS.split("\n") if _f],
    url="https://github.com/Multi-Energy-Systems-Optimization/mesido/",
    author="Jim Rojer",
    author_email="jim.rojer@tno.nl",
    maintainer="Jim Rojer, Kobus van Rooyen, Kelbij Star, "
    "Femke Janssen, Jesús Andrés Rodríguez Sarasty, "
    "Thijs van der Klauw",
    license="LGPLv3",
    keywords="Multi-Energy-Systems, optimization",
    platforms=["Windows", "Linux", "Mac OS-X", "Unix"],
    packages=find_packages("src"),
    package_dir={"": "src"},
    install_requires=[
        "influxdb >= 5.3.1",
        "pyecore >= 0.13.2",
        "pymoca >= 0.9.0",
        "rtc-tools == 2.7.3",
        # setuptools version limitations currently:
        # < 81.0.0 needed for pandapipes (still to be removed)
        # < 82.0.0 needed for pkg_resources (used in rtctools)
        "setuptools <= 80.9.0",
        "pyesdl == 26.3",
        "pandas >= 1.3.1, < 2.0",
        "rtctools-highs == 0.1.3",
        "StrEnum == 0.4.15",
        "CoolProp==6.6.0",
    ],
    include_package_data=True,
    python_requires=">=3.10,<3.13",  # pandas<2.0 does not provide wheels for 3.13+
    cmdclass=versioneer.get_cmdclass(),
    entry_points={"rtctools.libraries.modelica": ["library_folder = mesido:modelica"]},
)
