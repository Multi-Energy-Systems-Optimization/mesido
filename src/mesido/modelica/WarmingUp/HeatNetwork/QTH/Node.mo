within WarmingUp.HeatNetwork.QTH;

block Node
  import SI = Modelica.SIunits;
  parameter String component_type = "node";

  replaceable parameter Integer n(min = 2) = 2 "Number of flows";

  parameter Real temperature;

  SI.Temperature Tnode;
  QTHPort QTHConn[n];
  output SI.Position H;
equation
  // Because the in/outflows are to be determined in Python, the associated
  // equations for conservation of heat and flow are also set in Python and
  // not here.

  for i in 1:n loop
    QTHConn[i].H = H;
    // Q and T to be set in the mixin
  end for;
end Node;
