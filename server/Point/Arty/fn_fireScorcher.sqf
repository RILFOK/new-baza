params ["_target", "_art"];

private ["_he","_gu","_typeHE","_typeGU","_shells"];

//missionNameSpace setvariable ["_art_hn_messagesend",true];
_shells = missionNameSpace getVariable ["Arty_hn_mag",["32Rnd_155mm_Mo_shells","4Rnd_155mm_Mo_guided"]];

_typeHE = _shells select 0;
_typeGU = _shells select 1;

_art setVehicleAmmo 1;

_he=[];_gu=[];

{
	if (_x == _typeHE) then{_he pushBack 1};
	if (_x == _typeGU) then{_gu pushBack 1};
} forEach (magazines _art);

(gunner _art) setUnitCombatMode "RED";

if (_target iskindof "Tank") then {
	if (count _gu  > 0 ) then {_art doArtilleryFire [getPos _target, _typeGU, 2]} else {
		if (count _he  > 0 ) then {_art doArtilleryFire [getPos _target, _typeHE, ([2, 6] call BIS_fnc_randomInt)]} else {
		};
	};
};

if (_target iskindof "Car") then {
	if (count _he  > 0 ) then {_art doArtilleryFire [getPos _target,_typeHE, ([2, 6] call BIS_fnc_randomInt)]} else {
			if (count _gu  > 0 ) then {_art doArtilleryFire [getPos _target, _typeGU, 2]};
	};
};
if (_target iskindof "Man") then {
	if (count (list_artillery) > 1) then {
		_art doArtilleryFire [_target getPos [(15 * (sqrt (random 1))),(random 360)], _typeHE, ([4, 6] call BIS_fnc_randomInt)];
	} else {
		_art doArtilleryFire [_target getPos [(15 * (sqrt (random 1))),(random 360)], _typeHE, ([8, 12] call BIS_fnc_randomInt)];
	};
	/*
	if (random 1 < 0.5) then {
		_art doArtilleryFire [_target getPos [(10 * (sqrt (random 1))),(random 360)], "2Rnd_155mm_Mo_Cluster", 1];
	} else {
		_art doArtilleryFire [_target getPos [(10 * (sqrt (random 1))),(random 360)], "32Rnd_155mm_Mo_shells", (selectrandom[6,8,10])];
	};
	*/
};

waitUntil {sleep 1; unitReady _art};
(gunner _art) setUnitCombatMode "BLUE";