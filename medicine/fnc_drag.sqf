_medic = _this select 0;
_patient = _this select 1;

if !(_patient getVariable ["isUnconscious",false]) exitWith {};

private _display = findDisplay 46;
private _id = _display displayAddEventHandler ["KeyDown", {
    true
}];

_id spawn {
	private _id = _this;
	uiSleep 2;
	(findDisplay 46) displayRemoveEventHandler ["keyDown",_id];
};

_patient setVariable ["isDragged", true, true];
_medic setVariable ["isDrag",true,true];
_patient attachTo [_medic, [0, 1.1, 0.092]];
[[_patient],{_this select 0 setDir 180;}] remoteExec ["BIS_fnc_spawn"];
_patient setPos (getPos _patient);
[_medic, "AcinPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow"];
[_patient, "AinjPpneMrunSnonWnonDb"] remoteExec ["switchMove"];
_relese_id = player addAction [ "<t color='#ff0000'>Отпустить</t>",{_this select 3 setVariable ["isDragged", false, true];player setVariable ["isDrag",false,true];},_patient , 1, false, true, "", ""];
_drag_temp = true;
while {_drag_temp} do
{
	if (!(_patient getVariable "IsDragged") || (_medic getVariable "isUnconscious")|| !alive _medic) exitWith
	{
		[_medic, "AmovPknlMstpSrasWrflDnon"] remoteExec ["playMoveNow"];
		_patient setVariable ["IsDragged",false,true];
		_medic setVariable ["isDrag",false,true];
		detach _patient;
		[_patient, "UnconsciousReviveDefault_A"] remoteExec ["switchMove"];
		[_patient, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
		_medic removeAction _relese_id;
		_drag_temp = false;
	};
	sleep 0.3;
};