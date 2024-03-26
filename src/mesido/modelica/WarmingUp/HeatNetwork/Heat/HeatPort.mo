within WarmingUp.HeatNetwork.Heat;

connector HeatPort "Connector with Heat"
  Modelica.SIunits.Heat Heat "Heat";
  Modelica.SIunits.VolumeFlowRate Q "Volume flow";
  Modelica.SIunits.Level H "Head";
end HeatPort;
