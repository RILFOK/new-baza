




private ["_cooldown","_currenttime"];

if !(ARTILLERY_HN_ACTIVE) exitwith {};

_currenttime = time;
_cooldown = missionNameSpace getvariable ["_art_hn_cooldown",_currenttime];

if (_currenttime < _cooldown) exitwith {};

if (playersNumber east < 19) exitwith {};

params ["_group","_target"];

private ["_veh","_isMan","_isOnFoot"];



if (!(isPlayer _target) && {(side _target != EAST) && {_target getVariable ["isUnconscious", false]}}) exitwith {};




_isOnFoot = _target isKindOf "Man";

if (_isOnFoot) then {

  missionNameSpace setvariable ["_art_hn_firing",true];

  {[_target,_x] remoteExec ["srv_fnc_fireScorcher",2]}forEach (list_artillery select {alive _x});

} else {
  if ((_target iskindof "Air") || (_target iskindof "Ship") ) exitwith {};
  if (speed _target > 5) exitwith {};


  missionNameSpace setvariable ["_art_hn_firing",true];
  {[_target,_x] remoteExec ["srv_fnc_fireScorcher",2]}forEach (list_artillery select {alive _x});
};
