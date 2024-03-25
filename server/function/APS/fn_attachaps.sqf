if !(isServer) exitWith {};
private _tempArrVehicle = [];

_tempArrVehicle = ((allVariables missionNamespace) select {"veh_aps" in _x});
{
	[missionNamespace getVariable _x] remoteExec ["aps_fnc_aps_enable", 2];
} forEach _tempArrVehicle;


if (true) exitWith {};