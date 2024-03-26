within WarmingUp.HeatNetwork.QTH;

block Demand
  import SI = Modelica.SIunits;

  parameter Real Q_nominal = 1.0;

  extends _NonStorageComponent(Q(nominal=Q_nominal));
  extends _FluidPropertiesComponent;

  parameter String component_type = "demand";

  parameter Real theta;

  Modelica.SIunits.Heat Heat_demand(nominal=cp * rho * dT * Q_nominal);
equation
  (Heat_demand - cp * rho * QTHOut.Q*((1-theta)*(dT) + (theta)*(QTHIn.T - QTHOut.T)))/(cp* rho * dT * Q_nominal) = 0.0;
end Demand;
