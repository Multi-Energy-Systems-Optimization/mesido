within WarmingUp.HeatNetwork.QTH;

model _FluidPropertiesComponent
  extends QTHTwoPort;

  parameter Real T_supply;
  parameter Real T_return;
  parameter Real T_supply_id = -1;
  parameter Real T_return_id = -1;
  parameter Real dT = T_supply - T_return;
  parameter Real cp = 4200.0;
  parameter Real rho = 988.0;
end _FluidPropertiesComponent;
