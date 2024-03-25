if(!isServer) exitWith {};
params ["_pos"];

private _arrayrecon =  missionNamespace getvariable ["_trigger_hn_spn1",[]];

missionNameSpace setVariable ["arrayrecon",_arrayrecon,true];
missionNameSpace setVariable ["recongrouparry",[],true];
missionNameSpace setVariable ["spawnrecongroup",true,true];
[_pos,_arrayrecon] call srv_fnc_spawnrecongroup;
