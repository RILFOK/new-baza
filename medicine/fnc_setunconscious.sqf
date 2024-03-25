_unit = _this select 0;
_instigator = _this select 1;

//проверка на синих
if (playerSide == west) exitWith {
	if (alive _unit) then {
	_unit setDamage 1;
	_kmsg = format ["%1 был казнён",name (_this select 0)];
	_kmsg = _kmsg + format ["(%1)",name _instigator];
	[[_kmsg],{systemChat (_this select 0)}] remoteExec ["BIS_fnc_spawn"];
	};
};

if (unc_work) exitWith {};
unc_work = true;
_unit setUnconscious true;
_msg = format ["%1 ранен",name (_this select 0)];
_leader = objNull;
_slot = _unit getVariable["slot","rifleman"];

//Штраф за ТК и за 300
if (side _unit == east) then {
	if (side _unit == side _instigator) then {
		_msg = _msg + format ["(%1)",name _instigator];
		if (_unit != _instigator) then {
			[_instigator,-10] spawn bt_fnc_addExp;
		} else {
				[_unit,-2] spawn bt_fnc_addExp;
			};
	} else {
		_leader = leader (group _unit);
		if (_slot in ["tankman"]) then {
			[_unit,-10] spawn bt_fnc_addExp;
			if (_leader != _unit) then {
				[_leader,-1] spawn bt_fnc_addExp;
			};
		} else {
			if (_slot == "pilot") then {
				[_unit,-20] spawn bt_fnc_addExp;	
				if (_leader != _unit) then {
					[_leader,-2] spawn bt_fnc_addExp;
				};
				//Убран штраф за 300 пехоте
			};
			/*else {
				_unit, -2] spawn bt_fnc_addExp;
				if (_leader != _unit) then {
					[_leader,-0.2] spawn bt_fnc_addExp;
				};
			};*/
		};
	};
};

_unit setVariable ["isUnconscious", true, true];
_unit setVariable ["isBleeding", true, true];

//Высадить из уничтоженой техники
if (vehicle _unit != _unit ) then {
	unAssignVehicle _unit;
	moveOut _unit;;
};
//отменить урон 300тому
_side_unt = side _unit;
_unit setCaptive 1;
_unit setDamage 0;

[[_msg],{systemChat (_this select 0)}] remoteExec ["BIS_fnc_spawn"];

sleep 2;

[_unit, "UnconsciousReviveBody_A"] remoteExec ["playMoveNow"];

if (player == _unit) then {
	id_down = ((findDisplay 46) displayAddEventHandler ["keyDown","_this call block_key"]);
	id_up = ((findDisplay 46) displayAddEventHandler ["keyUp","_this call block_key"]);
	inGameUISetEventHandler ["Action","true"];
};

//Закрыть каналы кроме прямого
private _channels = [1,3,4,6,7,8];
{_x enableChannel false;} forEach _channels;
//вернуть возможность меток в синий
if ((_unit getVariable ["LEVEL",1]) > 1) then {
	1 enableChannel [true,false];	
};
setCurrentChannel 5;

sleep 1;

//Kill to an end
	_unit addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		if (isPlayer _instigator) then {
		if (alive _unit && (_unit getVariable "isUnconscious"))	then {
			if (_selection == "head") then {
				_KHP = _unit getVariable "KillHitPoint";
				_KHP = _KHP - 250;
				player setVariable ["KillHitPoint", _KHP, true];
				if (_unit getVariable "KillHitPoint" == 0) then {
					_unit setDamage 1;
					[_unit, -3] spawn bt_fnc_addExp;
					_leader = leader (group _unit);
					[_leader,-1] spawn bt_fnc_addExp;
					_kmsg = format ["%1 был казнён",name (_this select 0)];
					_kmsg = _kmsg + format ["(%1)",name _instigator];
					[[_kmsg],{systemChat (_this select 0)}] remoteExec ["BIS_fnc_spawn"];
				};
			};
		};
		};
	}];



while {alive _unit && {_unit getVariable "isUnconscious"}} do {
	_min_dist = 5000;
	_min_dist_temp = _min_dist;
	_medic = objNull;
	_msg = "";
	_msg = "Кровотечение:\n\n";
	if (_unit getVariable "isBleeding") then {
		_unc_timer = _unit getVariable "Blood";
		_unc_timer = _unc_timer - 1;
		player setVariable ["Blood", _unc_timer, true];
		if (_unit getVariable "Blood" == 0 ) then {
			_unit setDamage 1;
			_leader = leader (group _unit);
			[_leader,-9] spawn bt_fnc_addExp;
			[[_unit],{systemChat format ["%1 умер от потери крови", name (_this select 0)] }] remoteExec ["BIS_fnc_spawn"];

		};
		_msg = _msg + format ["%1c",_unc_timer];

	} else {
		_msg = _msg + "Остановлено";
	};

	{
		if ( !(_x getVariable "isUnconscious") && (side _x == _side_unt) && (_x distance _unit) < _min_dist_temp) then {
			_medic = _x; 
			_min_dist_temp = (_x distance _unit);
		};
	} foreach PlayableUnits;

	if (!isNull _medic) then {
		_msg = _msg + format ["\n\n Ближайший боец %1, %2м",name _medic,floor (_medic distance _unit)];
	} else {
		_msg = _msg + "\n\n Нет бойцов рядом";
	};

	hintsilent _msg;

	if (!(_unit getVariable "isDragged") && !(_unit getVariable "isCarryed")) then {
		if (vehicle _unit == _unit) then {
			[_unit, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
		};
	};
	sleep 1;
};


unc_work = false;

hintsilent "";


if (side _unit != west) then {
if ((_unit getVariable ["LEVEL",1]) > 1) exitWith {
	{
		_x enableChannel true;
	} forEach _channels;
};
};

//Bluechannel
private _BC = [3,4];
If (side _unit == West) then {
	if ((player getVariable ["LEVEL",1]) > 1) exitWith {
		{_x enableChannel true;} forEach _BC;
	};
};