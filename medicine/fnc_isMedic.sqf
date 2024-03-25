_unit = _this;
_return = false;
if (getNumber(configFile >> "CfgVehicles" >> typeOf _unit >> "attendant") == 1) then 
{
  _return = true;
};
_return;