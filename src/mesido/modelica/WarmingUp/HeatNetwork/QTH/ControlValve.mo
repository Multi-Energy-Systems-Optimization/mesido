within WarmingUp.HeatNetwork.QTH;

model ControlValve
  extends QTHTwoPort;
  parameter String component_type = "control_valve";

  Modelica.SIunits.Level dH;
equation
  dH = QTHOut.H - QTHIn.H;

  QTHIn.T = QTHOut.T;
end ControlValve;
