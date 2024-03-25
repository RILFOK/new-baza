_target = _this select 0;
_near_veh = nearestObjects [_target, ["Air","LandVehicle"], 5];
if (count _near_veh > 0) then
{
	_target setVariable ["IsDragged",false,true];
	_target setVariable ["isCarryed",false,true];
	[_target, (_near_veh select 0)] remoteExec ["moveInCargo", _target];
};
waitUntil {vehicle _target != _target};
_anim_unit = (((configfile >> 'CfgMovesMaleSdr' >> 'States' >> animationState _target >> 'interpolateTo') call BIS_fnc_getCfgData) select 0);
sleep 0.3;
[_target, _anim_unit] remoteExec ["switchMove"];