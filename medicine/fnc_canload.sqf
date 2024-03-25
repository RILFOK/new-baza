_target = _this select 0;
_return = false;
if (_target getVariable "isUnconscious" && {count ( nearestObjects [_target, ["Air","LandVehicle"], 5]) > 0 && (alive _target)}) then 
{
	_near_veh = nearestObjects [_target, ["Air","LandVehicle"], 5];
	_crewCount = [typeof (_near_veh select 0),false] call BIS_fnc_crewCount;
	_full_crewCount = [typeof (_near_veh select 0),true] call BIS_fnc_crewCount;
	if ((_full_crewCount - _crewCount) - (count crew (_near_veh select 0)) > 0) then 
	{
		_return = true;
	};
};
_return;