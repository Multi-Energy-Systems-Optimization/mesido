within WarmingUp.HeatNetwork.Heat;

block GeothermalSource
  import SI = Modelica.SIunits;
  extends Source;

  parameter String component_subtype = "geothermal";

  parameter SI.VolumeFlowRate target_flow_rate;
end GeothermalSource;
