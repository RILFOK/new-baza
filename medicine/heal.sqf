if !(isServer) exitWith {};

fnc_revive = compile preprocessFile "medicine\fnc_revive.sqf";

// Если массив "global_med_vehicles" не объявлен в "init.sqf" то пройтись по всем названиям объектов и создать массив из начинающихся с "veh_med"
if (isNil "global_med_vehicles") then {
  private _temp = ((allVariables missionNamespace) select {"veh_med" in _x});
  missionNamespace setVariable ["global_med_vehicles", _temp];
};


private _medVehicles = [];
private _obj = objNull;

while {true} do {
	_medVehicles = global_med_vehicles;
	{
		// получаем объект по названию непосредственно при использовании. Когда в массиве сохранялись объекты - он не обновлялся при возрождении техники
		_obj = missionNamespace getVariable _x; 
		{
			if ((alive _x) && !(_x getVariable "isDragged") && !(_x getVariable "isCarryed") && !(_x getVariable "isBleeding")) then {
				if (_x getVariable "isUnconscious") then {
					"Подождите, сейчас Вас вылечат" remoteExec ["hint",_x];
					sleep 3;
					[objNull,_x] spawn fnc_revive;
					_x setDamage 0;
					"300" remoteExec ["hint",_x];
				} else {
					if (damage _x > 0) then {
						"Подождите, сейчас Вас вылечат" remoteExec ["hint",_x];
						sleep 3;
						_x setDamage 0;
					};
				};
			};
		} forEach ((getPos _obj) nearEntities [["Man"], 8]);
	} forEach _medVehicles;
	sleep 3;
};
