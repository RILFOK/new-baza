// это не менять
private _radioBashnya = _this;
 
// менять отсюда 
 
private _grp = createGroup west;
 
private _BRO_fnc_placing = { 
	params ["_class","_X","_Y","_angle","_offset"];
	if (isNil "_offset") then {_offset = 0};
	_az = getDir _radioBashnya;
	_obj = _class createVehicle getPosWorld _radioBashnya;
	_obj setDir _az+_angle;
	_obj setPos (_radioBashnya modelToWorld [_X,_Y]);
	_obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];
};
 
private _BRO_fnc_placing_turret = { 
	params ["_class","_X","_Y","_angle","_offset"];
	if (isNil "_offset") then {_offset = 0};
	_az = getDir _radioBashnya;
	_obj = _class createVehicle getPosWorld _radioBashnya;
	_obj setDir _az+_angle;
	_obj setPos (_radioBashnya modelToWorld [_X,_Y]);
	_obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];
	_man = _grp createUnit [selectRandom (missionNameSpace getVariable ["_trigger_hn_shta_defence",[]]), position _obj,[],10,"FORM"];
	_man setSkill 1;
	_man allowFleeing 0;
	[_man] join _grp;
	_man moveInGunner _obj;
};
 
private _BRO_fnc_placing_trooper = { 
	params ["_class","_X","_Y","_angle","_offset"];
	if (isNil "_offset") then {_offset = 0};
	_az = getDir _radioBashnya;
	_man = _grp createUnit [_class, getPosWorld _radioBashnya,[],0,"NONE"];
	_man setDir _az+_angle;
	_man setPos (_radioBashnya modelToWorld [_X,_Y]);
	_man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"];
	_man setSkill 1;
	_man allowFleeing 0;
	[_man] join _grp;
	doStop _man;
};
 
["B_GMG_01_high_F" , 0 , 0 , 180 , 10 ] call _BRO_fnc_placing_turret;
// менять отсюда 
_isFlat = !(position _radioBashnya isFlatEmpty [-1, -1, 0.3, 10, -1] isEqualTo []);
_nobjects = nearestObjects [_radioBashnya, ["house"], 15];
if (_isFlat && count _nobjects <= 1) then {
	["Land_Cargo_Patrol_V1_F" , -12 , -20 , 0 ] call _BRO_fnc_placing;
	["B_GMG_01_high_F" , -11 , -19 , 180 , 5 ] call _BRO_fnc_placing_turret;
	["Land_BagBunker_Large_F" , 12 , -20 , 0 ] call _BRO_fnc_placing;
	["Land_Cargo_Patrol_V1_F" , 12 , 25 , 180 ] call _BRO_fnc_placing;
	["B_HMG_01_high_F" , 11 , 24 , 0,5 ] call _BRO_fnc_placing_turret;
	["Land_HBarrier_5_F" , 8 , -8 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -13.4 , -22 , 0 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -19 , -22 , 0 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , 10 , 27 , 0 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , 4.4 , 27 , 0 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -7 , -14 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , 7 , 28 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -8 , 20 , 90 ] call _BRO_fnc_placing;
	["Land_BagBunker_Large_F" , -12 , 23 , 180 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 18 , 23.6 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 21 , 16 , 45 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 24 , 9 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 20 , 4 , 0 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -18 , -18.6 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -21.5 , -12 , 45 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -24 , -5 , 90 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -19.5 , -1.5 ,0 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -17 , -1.5 ,0 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 20.5 , -16 ,0 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 28 , -13 ,135 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , 31 , -5.5 ,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" ,31 , 6 ,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" ,31 , 11.6 ,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , 23 , 13 ,0 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -20.5 , 17.5 ,0 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -28,14.5 ,135 ] call _BRO_fnc_placing;
	["Land_HBarrier_Big_F" , -31,7,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -31,4.2,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -31,-1,90 ] call _BRO_fnc_placing;
	["Land_HBarrier_5_F" , -32,-10.5,0 ] call _BRO_fnc_placing;
};