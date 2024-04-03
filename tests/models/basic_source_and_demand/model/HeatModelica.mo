model HeatModelica
  parameter Real Q_nominal = 0.001;

  WarmingUp.HeatNetwork.Heat.Source source(
    Heat_source(min=0.75e5, max=1.25e5, nominal=1e5),
    Heat_out(max=2e5),
    T_supply=75.0,
    T_return=45.0,
    Q_nominal=Q_nominal
  );
  WarmingUp.HeatNetwork.Heat.Demand 921eb017-927b-4789-98c8-41adbd70552c(
    Heat_in(max=2e5),
    T_supply=75.0,
    T_return=45.0,
    Q_nominal=Q_nominal
  );
  WarmingUp.HeatNetwork.Heat.Pipe pipe_hot(
    length=1000.0,
    diameter=0.15,
    temperature=75.0,
    HeatIn.Heat(min=-2e5, max=2e5, nominal=1e5),
    HeatOut.Heat(nominal=1e5),
    T_supply=75.0,
    T_return=45.0,
    Q_nominal=Q_nominal
  );
  WarmingUp.HeatNetwork.Heat.Pipe pipe_cold(
    length=1000.0,
    diameter=0.15,
    temperature=45.0,
    HeatOut.Heat(nominal=1e5),
    HeatIn.Heat(max=2e5, nominal=1e5),
    T_supply=75.0,
    T_return=45.0,
    Q_nominal=Q_nominal
  );
  WarmingUp.HeatNetwork.Heat.Pump pump(
    T_supply=75.0,
    T_return=45.0,
    Q_nominal=Q_nominal
  );

   input Modelica.SIunits.Heat Heat_source(fixed=false) = source.Heat_source;
equation
  connect(source.HeatOut, pipe_hot.HeatIn);
  connect(pipe_hot.HeatOut, 921eb017-927b-4789-98c8-41adbd70552c.HeatIn);
  connect(921eb017-927b-4789-98c8-41adbd70552c.HeatOut, pipe_cold.HeatIn);
  connect(pipe_cold.HeatOut, pump.HeatIn);
  connect(pump.HeatOut, source.HeatIn);
end HeatModelica;
