within WarmingUp.HeatNetwork.Heat;

model ControlValve
  extends _NonStorageComponent;
  parameter String component_type = "control_valve";

  Modelica.SIunits.Level dH;
equation
  dH = HeatOut.H - HeatIn.H;

  (HeatIn.Heat - HeatOut.Heat) / Heat_nominal = 0.0;
end ControlValve;
