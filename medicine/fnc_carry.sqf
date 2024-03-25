_medic = _this select 0;
_patient = _this select 1;

if !(_patient getVariable ["isUnconscious",false]) exitWith {};

private _display = findDisplay 46;
private _id = _display displayAddEventHandler ["KeyDown", {
    true
}];

_id spawn {
	private _id = _this;
	uiSleep 5;
	(findDisplay 46) displayRemoveEventHandler ["keyDown",_id];
};

_patient setVariable ["isCarryed", true, true];
_medic setVariable ["isDrag",true,true];
_patient attachTo [_medic, [0.50, 0.50, 0]];
[[_patient],{_this select 0 setDir 180;}] remoteExec ["BIS_fnc_spawn"];
_patient setPos (getPos _patient);
[_medic, "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon"] remoteExec ["playMoveNow", _medic];
[_patient, "AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExec ["SwitchMove"];
[_patient, "AinjPfalMstpSnonWrflDnon_carried_Up"] remoteExec ["playMoveNow"];
[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["playMove"];
_relese_id = player addAction [ "<t color='#ff0000'>Отпустить</t>",{_this select 3 setVariable ["isCarryed", false, true];player setVariable ["isDrag",false,true];},_patient , 1, false, true, "", ""];
//sleep 15;
_patient attachTo [_medic, [0.1, -0.1, -1.25], "RightShoulder"];
[[_patient],{_this select 0 setDir 0;}] remoteExec ["BIS_fnc_spawn"];
_carry_temp = true;
while {_carry_temp} do {
	if (!(_patient getVariable "isCarryed") || (_medic getVariable "isUnconscious")|| !alive _medic) exitWith {
		[_medic, "AmovPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow", _medic];
		_patient setVariable ["isCarryed",false,true];
		_medic setVariable ["isDrag",false,true];
		detach _patient;
		[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["switchMove"];
		[_patient, "AinjPfalMstpSnonWrflDnon_carried_still"] remoteExec ["playMove"];
		_medic removeAction _relese_id;
		_carry_temp = false;
	};
	sleep 0.3;
};