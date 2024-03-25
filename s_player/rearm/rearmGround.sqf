private ["_veh","_rep_end"];
_veh = _this select 0;

if (!(_veh isKindOf "LandVehicle")) exitWith { _veh vehicleChat "Этот сервис только для наземной техники"; };

_veh vehicleChat "Сервис. Ожидайте...";
_rep_end = false;
_veh setFuel 0;

//---------- RE-ARMING

sleep 5;
_veh vehicleChat "Перезарядка...";

//---------- REPAIRING

sleep 5;
_veh vehicleChat "Ремонт...";
//---------- REFUELING

sleep 5;
_veh vehicleChat "Заправка...";
//---------- FINISHED
sleep 5;

_rep_end = true;

_veh setDamage 0;
_veh vehicleChat "Ремонт (100%).";

_veh setVehicleAmmo 1;
_veh vehicleChat "Перезарядка (100%).";

_veh setFuel 1;
_veh vehicleChat "Заправка (100%).";

sleep 2;
_veh vehicleChat "Сервис закончен.";