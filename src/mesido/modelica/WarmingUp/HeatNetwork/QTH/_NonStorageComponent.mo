within WarmingUp.HeatNetwork.QTH;

model _NonStorageComponent
  extends QTHTwoPort;

  Modelica.SIunits.VolumeFlowRate Q;

  Modelica.SIunits.Level H_in;
  Modelica.SIunits.Level H_out;
equation
  QTHIn.Q = Q;
  QTHOut.Q = QTHIn.Q;

  QTHIn.H = H_in;
  QTHOut.H = H_out;
end _NonStorageComponent;
