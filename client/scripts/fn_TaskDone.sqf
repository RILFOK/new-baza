if(!local player) exitWith {};
private _task = missionnamespace getVariable "task";
private _doptask = missionnamespace getVariable "_dop_task4";
private _datapoint = Gamer getVariable ["datapoint",[]];
_datapoint params ["","_NamePoint"];
_task setTaskState "Succeeded";
_doptask setTaskState "Succeeded";

["TaskSucceeded",["",format [localize "STR_CONF_TASKDONE",_NamePoint]]]call BIS_fnc_showNotification;
