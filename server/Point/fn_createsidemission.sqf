//Haron

if(!isServer) exitWith {};

private ["_marker","_pos0","_pos1","_axis","_location","_group","_typeradar","_typeveh","_spawnpos","_SpawnPosVeht","_radar", "_veht", "_random_pos_koef1","_random_pos_koef2"];


sleep 5;
//выбор города

_marker = (Gamer getVariable "datapoint") param [0];
_axis = Worldsize;
_pos0 = [_axis,_axis] vectorDiff (getMarkerPos _marker);


_location = nearestLocation [_pos0,"NameVillage"];
_pos1 = ATLToASL (getPos _location);

if ((_pos1 distance (getMarkerPos _marker)) < 3000) then {

	_random_pos_koef1 = selectrandom [0,1];
	_random_pos_koef2 = selectrandom [0,1]; 
	_pos0 = [_axis * _random_pos_koef1, _axis *_random_pos_koef2, 0];
	_location = nearestLocation [_pos0,"NameVillage"];
	_pos1 = ATLToASL (getPos _location);

};

while {(_pos1 distance baseutf) < 2000} do {
	_random_pos_koef1 = selectrandom [0,1];
	_random_pos_koef2 = selectrandom [0,1]; 
	_pos0 = [_axis * _random_pos_koef1, _axis *_random_pos_koef2, 0];
	_location = nearestLocation [_pos0,"NameVillage"];
	_pos1 = ATLToASL (getPos _location);
};

//------------------------------
//Тип допки
if (random 1 < 0.5) then {
    //включить допку со спавном истребителей
	missionNameSpace setvariable ["_enemy_aircycle_AA",true,true];
	missionNameSpace setvariable ["_sidemission_hn_type",1,true];
	[] remoteExec ["anti_btv_fnc_createShip", 2];
} else {
	//Вариации допки без вражеский истребителей
	missionNameSpace setvariable ["_sidemission_hn_type",2,true];
	missionNameSpace setvariable ["_enemy_aircycle_AA",false,true];

};
missionNameSpace setvariable ["_dop_radar_pos1",_pos1,true];

//спавн радара
_typeradar = "Land_Radar_Small_F";
_spawnpos = [_pos1,0,250,5,5,_typeradar] call Srv_fnc_findEmptyPos;
_radar = _typeradar createVehicle _spawnpos;
_radar allowdamage false;
missionNamespace setVariable ["_dop_radar1",_radar];



_radar setPos _spawnpos;
_radar setVectorUp [0,0,1];

_BRO_fnc_placing = { 
    params ["_class","_X","_Y","_angle","_offset"]; 
    if (isNil "_offset") then {_offset = 0}; 
    _az = getDir _radar ; 
    _obj = _class createVehicle getPosWorld _radar; 
    _obj setDir _az+_angle; 
    _obj setPos (_radar modelToWorld [_X,_Y]); 
    _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"]; 
}; 

["Land_Cargo_Patrol_V1_F" , -12 ,  -20 ,  0  ] call _BRO_fnc_placing;  

["Land_BagBunker_Large_F" , 12 ,  -20 ,  0  ] call _BRO_fnc_placing; 

["Land_Cargo_Patrol_V1_F" , 12 ,  25 ,  180  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 8 ,  -8 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -13.4 ,  -22 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -19 ,  -22 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 10 ,  27 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 4.4 ,  27 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -7 ,  -14 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 7 ,  28 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -8 ,  20 ,  90  ] call _BRO_fnc_placing;

["Land_BagBunker_Large_F" , -12 ,  23 ,  180  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 18 ,  23.6 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 21 , 16 ,  45  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 24 , 9 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 20 , 4 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -18 , -18.6 , 90  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -21.5 , -12 , 45  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -24 , -5 , 90  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -19.5 , -1.5 ,0  ] call _BRO_fnc_placing;
 
["Land_HBarrier_5_F" , -17 , -1.5 ,0  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 20.5 , -16 ,0  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 28 , -13 ,135  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , 31 , -5.5 ,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,31 , 6 ,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,31 , 11.6 ,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 23 , 13 ,0  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -20.5 , 17.5 ,0  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -28,14.5 ,135  ] call _BRO_fnc_placing;

["Land_HBarrier_Big_F" , -31,7,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -31,4.2,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -31,-1,90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -32,-10.5,0  ] call _BRO_fnc_placing;
//добавить кнопку

//не забыть отключить jip 
[_radar] remoteExec ["srv_fnc_holdactionbash",east,true];


//СПН
//========================== HC HANDLE ====================================
//===========================================================================

sleep 180;

if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_spawnpos] remoteExec ["srv_fnc_spawnAIside",(serverNamespace getVariable "hn_headlessClients") select 0];
    //["спн на HC"] remoteExec ["diag_log",2];
    
} else {
    [_spawnpos] spawn srv_fnc_spawnAIside;
    //["спн на сервере"] remoteExec ["diag_log",2];
};

//===========================================================================


