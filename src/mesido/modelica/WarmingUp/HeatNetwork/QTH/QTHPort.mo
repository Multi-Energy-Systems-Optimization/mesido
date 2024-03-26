within WarmingUp.HeatNetwork.QTH;

connector QTHPort "Connector with potential temperature (T), flow discharge (Q) and head (H)"
  Modelica.SIunits.Temperature T "Temperature";
  Modelica.SIunits.VolumeFlowRate Q "Volume flow";
  Modelica.SIunits.Level H "Head";
end QTHPort;
