_medic = _this select 0;
_patient = _this select 1;

_patient setVariable ["isUnconscious", false, true];
_patient setVariable ["isDragged", false, true];

//[_medic, "AinvPknlMstpSlayWrflDnon_medic"] remoteExec ["playMoveNow"];
sleep 0.5;
[[_patient],{if (player == _this select 0) then {
	(findDisplay 46) displayRemoveEventHandler ["keyDown",id_down];
	id_down = "none";
	(findDisplay 46) displayRemoveEventHandler ["keyUp",id_up]; 
	id_up = "none"; 
	inGameUISetEventHandler ["Action", ""];
};
}] remoteExec ["BIS_fnc_spawn"];

if ((UAVControl _patient) select 0 != objNull) then
{
	[[(UAVControl _patient) select 0],{if (player == _this select 0) then {(findDisplay 46) displayRemoveAllEventHandlers "keyDown";(findDisplay 46) displayAddEventHandler ["keyDown", "_this call bt_fnc_deh_keDown"];inGameUISetEventHandler ["Action", ""];};}] remoteExec ["BIS_fnc_spawn"];
};

_patient setDamage 0;
[_patient, false] remoteExec ["setUnconscious", _patient];
[[_patient],{(_this select 0) setCaptive 0;}] remoteExec ["BIS_fnc_spawn"];
_patient setVariable ["isUnconscious", false, true];
_patient setVariable ["isBleeding", false, true];
_patient setVariable ["isDragged", false, true];
_patient setVariable ["Blood", 1000, true];
_patient setVariable ["isHostage",false,true];
_patient setVariable ["KillHitPoint", 1000, true];
[_patient, "UnconsciousOutProne"] remoteExec ["playMoveNow"];


if (isPlayer _medic) then {
	[[_patient,_medic],{systemChat format ["%1 Вылечен (%2)",name (_this select 0),name (_this select 1)]}] remoteExec ["BIS_fnc_spawn"];
	//	добавление экспы медику за поднятие
	["medicine",["revive", _medic ]] spawn bt_fnc_eventScore;
	_leader = leader (group _medic);
	if (_leader != _medic) then {	//	если игрок не лидер группы
		//	добавить экспу лидеру
		["medicine",["revive_leader", _leader ]] spawn bt_fnc_eventScore; 
	};
} else {
	[[_patient],{systemChat format ["%1 Вылечен (мед. сестричка)",name (_this select 0)]}] remoteExec ["BIS_fnc_spawn"];
};