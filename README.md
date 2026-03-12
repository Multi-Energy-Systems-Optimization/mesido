# MESIDO

MESIDO is an optimization application for optimal planning, design and 
operation of Energy Systems with the current main focus on District Heating Systems (DHS). The current application focuses on a Mixed Integer Linear Problem (MILP) approach, with multiple linearization strategies to conservatively approximate the steady-state physics and financial models. See for example the head loss validation test, using pandapipes, in the test folder. All physics, placement, sizing and financial models are combined in the TechnoEconomicMixin class. When inherited this class can be combined with objective functions (that typically incorporate the financial aspects) and interface methods to create an
optimization workflow (see also running an example).

The main supported method for defining your Energy system is ESDL (Energy System Description Language), which is a modelling language for energy systems. See also: https://github.com/EnergyTransition/ESDL.
With ESDL you can define assets like demands, sources, pipes, etc. and fill in their attributes. The ESDLMixin class
will parse the ESDL file and utilize the attributes to build up the model representation.

The documentation on the mathematical modelling and workflow application can be found on: 
readthedocs: https://mesido.readthedocs.io/en/latest/.

Installation
============

Installation of the MESIDO library is as simple as::

    # 1a. Use pip to install directly
    pip install mesido

If you are going to develop and change the source code, you probably want to do something like::

	# 1b. Use git clone and pip to make an editable/developer installation
	git clone https://github.com/Multi-Energy-Systems-Optimization/mesido
	python -m pip install -e .

MESIDO depends on `RTC-Tools <https://gitlab.com/deltares/rtc-tools.git>`_, which is automatically installed as one of its dependencies.

Running an example
==================

To make sure that everything is set-up correctly, you can run one of the example cases.
These do not come with the installation, and need to be downloaded separately::

    # 1. Clone the repository
    git clone https://github.com/Multi-Energy-Systems-Optimization/mesido.git

    # 2. Change directory to the example folder
    cd mesido/examples/pipe_diameter_sizing/src

    # 3. Run the example
    python example.py

You will see the progress in your shell.
If all is well, you should see something like the following output:

![img.png](img.png)

In this example.py file you can see a small workflow being set-up. The PipeDiameterSizingProblem class
inherits from (Note only the *classes are defined in MESIDO the others come from rtc-tools package):
- CollocatedIntegratedOptimizationProblem: This class does all the discretization of the state variables in your problem.
- *ESDLMixin: This class does the parsing and setting up of a model based on an ESDL file.
- GoalProgrammingMixin: This class allows you to add Goals (objective functions) with different priorities.
- LinearizedOrderGoalProgrammingMixin: This class allows you to add higher order goals (e.g. order=2) for MILP problems.
- *TechnoEconomicMixin: This class combines all the Mixin classes required for a full techno-economic optimization. 

Within the PipeDiameterSizingProblem class you can see that the path_goals() function is overwritten and that
a path_goal with priority one is added to meet the heat demands. The definition path_goal is used
to define a goal that is applied to a state variable at every time step. Furthermore, the goals() method is also overwritten
in this case where an objective with priority two is added to minimize `length*diameter`.
The goals() method is used here for global variables that do not change over time. The priorities indicate the sequential order 
in which the optimizer would be applied to the goals. In this example the heat demand is matched first, after which priority 2 `length*diameter` 
is minimized. In this example the objective of the priority one goal constraints the priority two goal optimization, which ensures that the 
optimization of the priority two goal does not have impact on the optimal result of the priority one goal.

Contribute
==========

You can contribute to this code through Pull Request on GitHub.
Please, make sure that your code is coming with unit tests to ensure full coverage and continuous integration in the API.

GitHub: https://github.com/Multi-Energy-Systems-Optimization/mesido



## Release
This package is released on pypi [here](https://pypi.org/project/mesido/) whenever a new tag is pushed.
In order to release this package:

1. Make sure that all relevant merge requests and commits have been merged to the master and/or poc-release branch.
2. Run `git checkout master` or `git checkout poc-release` to switch to the release branch.
3. Run `git pull origin master` or `git pull origin poc-release` to pull all latest changes.
4. Run `git tag <new_version>` where `<new_version>` is the new version number.
5. Run `git push origin <new_version>` to push the tag to Github.
6. Check [Github](https://github.com/Multi-Energy-Systems-Optimization/mesido/actions) to confirm the release is
   processed without errors.
7. Once the release has finished, confirm the new version is available on [pypi](https://pypi.org/project/mesido/).


License
=======

This code base is licensed as LGPLv3 as specified in `LICENSE`. However, the LGPLv3 license
references the GPLv3 license. As such, we have added a copy of GPLv3 as a reference in the file
`additional_info_for_license.txt`. This does NOT entail that this code base is licensed as `GPLv3`.
The copy of the `GPLv3` license is only added as a reference.
