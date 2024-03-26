within WarmingUp.HeatNetwork.Heat;

block Node
  import SI = Modelica.SIunits;
  parameter String component_type = "node";

  replaceable parameter Integer n(min = 2) = 2 "Number of flows";

  parameter Real state = 1.0;

  HeatPort HeatConn[n];
  output SI.Position H;
equation
  // Because the orientation of the connected pipes are important to setup the
  // heat conservation, these constraints are added in the mixin.

  for i in 1:n loop
    HeatConn[i].H = H;
    // Q and Heat to be set in the mixin
  end for;
end Node;
