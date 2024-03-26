within WarmingUp.HeatNetwork.Heat;

model Pump
  extends _NonStorageComponent;
  parameter String component_type = "pump";

  Modelica.SIunits.Level dH(min=0.0);
equation
  dH = HeatOut.H - HeatIn.H;

  (HeatIn.Heat - HeatOut.Heat) / Heat_nominal = 0.0;
end Pump;
