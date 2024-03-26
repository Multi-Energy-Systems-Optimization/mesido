within WarmingUp.HeatNetwork.Heat;

model CheckValve
  extends _NonStorageComponent(
    Q(min=0.0)
  );
  parameter String component_type = "check_valve";

  Modelica.SIunits.Level dH(min=0.0);
equation
  dH = HeatOut.H - HeatIn.H;

  (HeatIn.Heat - HeatOut.Heat) / Heat_nominal = 0.0;
end CheckValve;
