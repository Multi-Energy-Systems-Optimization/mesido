within WarmingUp.HeatNetwork.Heat;

block Source
  import SI = Modelica.SIunits;
  extends _NonStorageComponent(
    Heat_in(min=0.0, max=0.0),
    Heat_out(min=0.0)
  );
  parameter String component_type = "source";

  parameter Real price;

  // Assumption: heat in/out and added is nonnegative
  // Heat in the return (i.e. cold) line is zero
  Modelica.SIunits.Heat Heat_source(min=0.0, nominal=Heat_nominal);
  Modelica.SIunits.Level dH(min=0.0);
equation
  dH = HeatOut.H - HeatIn.H;
  (HeatOut.Heat - (HeatIn.Heat + Heat_source))/Heat_nominal = 0.0;
  (Heat_flow - Heat_source)/Heat_nominal = 0.0;
end Source;
