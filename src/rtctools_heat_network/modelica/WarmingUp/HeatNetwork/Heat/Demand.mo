within WarmingUp.HeatNetwork.Heat;

block Demand
  import SI = Modelica.SIunits;
  extends HeatTwoPort;
  parameter String component_type = "demand";

  parameter Real T_supply = 75.0;
  parameter Real T_return = 45.0;
  parameter Real dT = T_supply - T_return;
  parameter Real cp = 4200.0;
  parameter Real rho = 988.0;
  parameter Real Heat_nominal = cp * rho * dT;

  // Assumption: heat in/out and extracted is nonnegative
  // Heat in the return (i.e. cold) line is zero
  Modelica.SIunits.Heat Heat_demand(min=0.0, nominal=cp * rho * dT);
  Modelica.SIunits.Heat Heat_in(min=0.0, nominal=cp * rho * dT);
  Modelica.SIunits.Heat Heat_out(min=0.0, max=0.0, nominal=cp * rho * dT);
equation
  // Heat balance equation
  (HeatOut.Heat - (HeatIn.Heat - Heat_demand))/Heat_nominal = 0.0;

  // Heat in/out aliases
  (Heat_out - HeatOut.Heat)/Heat_nominal = 0.0;
  (Heat_in - HeatIn.Heat)/Heat_nominal = 0.0;
end Demand;