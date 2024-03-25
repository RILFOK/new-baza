_killed = _this # 0;
_instigator = _this # 1;

_msg = format ["%1 это предатель!", name _instigator];
[[_msg],{systemChat (_this # 0)}] remoteExec ["BIS_fnc_spawn"];
missionNameSpace setVariable ["blueNoTK", false, true];