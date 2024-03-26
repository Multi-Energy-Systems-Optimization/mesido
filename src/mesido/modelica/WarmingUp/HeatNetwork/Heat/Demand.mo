within WarmingUp.HeatNetwork.Heat;

block Demand
  import SI = Modelica.SIunits;
  extends _NonStorageComponent(
    Heat_in(min=0.0),
    Heat_out(min=0.0)
  );

  parameter String component_type = "demand";

  // Assumption: heat in/out and extracted is nonnegative
  // Heat in the return (i.e. cold) line is zero
  Modelica.SIunits.Heat Heat_demand(min=0.0, nominal=Heat_nominal);
equation
  (HeatOut.Heat - (HeatIn.Heat - Heat_demand))/Heat_nominal = 0.0;
  (Heat_flow - Heat_demand)/Heat_nominal = 0.0;
end Demand;
