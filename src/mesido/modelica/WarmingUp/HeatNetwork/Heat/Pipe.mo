within WarmingUp.HeatNetwork.Heat;

block Pipe
  import SI = Modelica.SIunits;
  extends _NonStorageComponent;
  parameter String component_type = "pipe";
  parameter Boolean disconnectable = false;
  parameter Boolean has_control_valve = false;

  parameter Real length = 1.0;
  parameter Real diameter = 1.0;
  final parameter Real area = 0.25 * 3.14159265358979323846 * diameter ^ 2;
  parameter Real temperature;

  parameter Real carrier_id = -1;

  // Parameters determining the heat loss
  // All of these have default values in the library function
  parameter SI.Thickness insulation_thickness;
  parameter SI.ThermalConductivity conductivity_insulation;
  parameter SI.ThermalConductivity conductivity_subsoil;
  parameter SI.Distance depth;
  parameter SI.CoefficientOfHeatTransfer h_surface;
  parameter SI.Distance pipe_pair_distance;

  parameter Real T_ground = 10.0;

  Modelica.SIunits.Level dH;
  Modelica.SIunits.Level Hydraulic_power;

  parameter Real Heat_loss;
equation
  // Note: Heat loss is added in the mixin, because it depends on the flow direction
  // * heat loss equation: (HeatOut.Heat - (HeatIn.Heat +/- Heat_loss)) = 0.0
end Pipe;
