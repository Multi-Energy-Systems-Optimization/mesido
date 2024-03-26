within WarmingUp.HeatNetwork.QTH;

model CheckValve
  extends _NonStorageComponent(Q(min=0.0));
  parameter String component_type = "check_valve";

  Modelica.SIunits.Level dH(min=0.0);
equation
  dH = QTHOut.H - QTHIn.H;

  QTHIn.T = QTHOut.T;
end CheckValve;
