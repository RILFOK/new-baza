if !(isServer) exitWith {};
// Допустимые начальные имена:
//// veh_pylonmanager - Имя объекта, на котором можно менять пилоны
private _tempArrVehicle = [];

_tempArrVehicle = ((allVariables missionNamespace) select {"veh_pylonmanager" in _x});
{
	[ missionNamespace getVariable _x ] remoteExec ["pylon_manager_fnc_pylonmanageradd",2];
} forEach _tempArrVehicle;

if (true) exitWith {};