// if !(isServer) exitWith {};
params [ ["_target", objNull, [objNull]],["_caller", objNull, [objNull]],["_type", 0, [0]] ];
if (_target isEqualTo objNull) exitWith {false;}; // Если не передали объект - выходим отсюда
if (_caller isEqualTo objNull) exitWith {false;}; // Если не передали объект - выходим отсюда
if !( (_type == 0) OR (_type == 1) ) exitWith {false;};
/*
_type
0 - проверка для BIS_fnc_holdActionAdd
1 - проверка для самого скрипта "смены пилонов"
*/

private _result = false;

switch (_type) do {
	case 0: { 
		if ( 
			( not isEngineOn _target ) AND 
			{ speed _target <= 1 }  AND 
			{ getPos _target select 2 < 1 } AND 
			{ driver _target isEqualTo _caller } AND 
			{ count fullCrew _target == 1 } AND 
			{ (alive _target) AND {alive _caller} } 
		) then { _result = true; };
	};
	case 1: { 
		if ( 
			( not isEngineOn _target ) AND 
			{ speed _target <= 1 }  AND 
			{ getPos _target select 2 < 1 } AND 
			{ driver _target isEqualTo _caller } AND 
			{ count fullCrew _target == 1 } AND 
			{ (alive _target) AND {alive _caller} } 
		) then {
			private _tempArrVehicle = ((allVariables missionNamespace) select {"veh_service" in _x});
			_tempArrVehicle append ((allVariables missionNamespace) select {"veh_rearm" in _x});
			{
				// systemChat format[ "%1 до %2 ",  player distance (missionNamespace getVariable _x), _x  ];
				if (_target distance (missionNamespace getVariable _x) <= 35 ) exitWith {_result = true;};

			} forEach _tempArrVehicle;
		};
	};
	default { _result = false; };
};

_result;