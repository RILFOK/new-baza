private ["_veh"];
_veh = _this select 0;

if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};

if (!(_veh isKindOf "Air")) exitWith { 
	_veh vehicleChat "Этот сервис только для авиации.";

};

_veh vehicleChat "Сервис. Ожидайте...";

_veh setFuel 0;

//---------- RE-ARMING

sleep 30;

_veh vehicleChat "Перезарядка ...";
//---------- REPAIRING

sleep 30;

_veh vehicleChat "Починка ...";

//---------- REFUELING

sleep 30;

_veh vehicleChat "Заправка ...";

//---------- FINISHED

sleep 10;
{_x setDamage 0}foreach crew _veh;
_veh setDamage 0;
_veh vehicleChat "Ремонт (100%).";

_veh setVehicleAmmo 1;
_veh vehicleChat "Перезарядка (100%).";

_veh setFuel 1;
_veh vehicleChat "Заправка (100%).";

sleep 2;

_veh vehicleChat "Сервис закончен.";