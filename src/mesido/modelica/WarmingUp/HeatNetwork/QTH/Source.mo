within WarmingUp.HeatNetwork.QTH;

block Source
  import SI = Modelica.SIunits;

  parameter Real Q_nominal = 1.0;

  extends _NonStorageComponent(Q(nominal=Q_nominal));
  extends _FluidPropertiesComponent;

  parameter String component_type = "source";

  parameter Real price;

  parameter Real theta;

  Modelica.SIunits.Heat Heat_source(nominal=cp * rho * dT * Q_nominal);

  Modelica.SIunits.Level dH(min=0.0);
equation
  dH = QTHOut.H - QTHIn.H;

  (Heat_source - cp * rho * QTHOut.Q*((1-theta)*(dT) + (theta)*(-QTHIn.T + QTHOut.T)))/(cp* rho * dT * Q_nominal) = 0.0;
 end Source;
