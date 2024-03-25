/*

Спавн ботов в триггере взависимости от наличия HClient

*/

//Выйти, если клиент, но не хост

/*

if (hasInterface && (!isServer)) exitwith {};


//Если есть HC, передать ему спавн юнитов

if (missionNamespace getVariable ["hn_HC_Active", false]) then {
	if (isServer) exitwith {};
    ["упралвение у HC"] remoteExec ["systemChat",0];
} else {
	if (!isServer) exitwith {};
    ["упралвение у сервера"] remoteExec ["systemChat",0];
};

*/
//====================================================================================================
//====================================================================================================
//====================================================================================================
//====================================================================================================
//====================================================================================================
params ["_v","_cmmin","_ost","_n","_pos","_variantCount"];

private ["_grp","_SpawnPosGrp","_infantry","_type","_unit","_c","_group1",
"_Car","_typevehc","_SpawnPosVehc","_vehc","_t",
"_group2","_Tank","_typeveht","_SpawnPosVeht","_veht","_r","_list_dynsim"];

//список групп для включения динамической симуляции.
_list_dynsim = [];

//Спавн ботов в триггере внутренний радиус

for "_gr" from 1 to (_v-2) do
{
    _grp  = creategroup west;

    _SpawnPosGrp = [_pos, 1,400, 2, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
	_cm = [_gr,_v,_cmmin,_ost,_n] call srv_fnc_numberfor;
    for "_inf" from 1 to _cm do {
        _infantry = infantry call BIS_fnc_arrayShuffle;
        _type = selectRandom _infantry;
	    _unit = [_grp,_SpawnPosGrp,_type,50] call srv_fnc_createenemyunit;



	    _unit setVariable ["srv_cme",true];
	    [_unit] join _grp;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
	        // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
            ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
        }];
        
        sleep 0.2;
    }; 
    
    [_grp,_SpawnPosGrp,_pos,0,150,[-1,-1,-1,0,false],"path for group soldiers",400] spawn srv_fnc_InfantryTasckPatrol;

    //дин симуляция
    _list_dynsim pushBack _grp;

	sleep 0.1;
};

//внешний

for "_gr" from 1 to _v/4 do  
{
    _grp  = creategroup west;

    private _radius_1 = random [500, 700, 800];

    _SpawnPosGrp = [_pos, 600,_radius_1, 2, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
	_cm = [_gr,_v,_cmmin,_ost,_n] call srv_fnc_numberfor;
    for "_inf" from 1 to _cm do {
        _infantry = infantry call BIS_fnc_arrayShuffle;
        _type = selectRandom _infantry;
	    _unit = [_grp,_SpawnPosGrp,_type,50] call srv_fnc_createenemyunit;


	    _unit setVariable ["srv_cme",true];
	    [_unit] join _grp;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
	        // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
            ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
        }];
        sleep 0.2;
    }; 
    [_grp,_SpawnPosGrp,_pos,0,150,[-1,-1,-1,0,false],"path for group soldiers",_radius_1] spawn srv_fnc_InfantryTasckPatrol;

    //дин симуляция
    _list_dynsim pushBack _grp;

    //Арта. Эта группа может передавать информацию по местоположению красных
    _grp addEventHandler ["EnemyDetected", {
        params ["_group", "_newTarget"];
        [_group, _newTarget] remoteexeccall ["srv_fnc_AIenemydetected",2];
    }];
    

	sleep 0.1;
};

//=================================================================================================================
//=================================================================================================================
//=================================================================================================================
//=================================================================================================================

BT_fnc_getPos = {
    params ["_pos","_dir","_dis","_alt"];
    if (count _this  == 3) then {
    };
    _r = [(_pos select 0) + sin _dir * _dis, (_pos select 1) + cos _dir * _dis, _alt];
    _r
};

private _BT_fnc_inHouse = {
	params ["_marker","_list_dynsim"];
    _arrunits = [];
	_pos = [];
	_houseList = nearestObjects [_marker, ["building"], 200];
	{
		_c = 0;
		while {(format ["%1",_x buildingPos _c] != "[0,0,0]") && (_C < 2)} do {
			_pos set [(count _pos),[_x,_x buildingPos _c]];
			_c = _c + 1;
		};
	} forEach _houseList;

    _grp = createGroup WEST;

    _units = infantry;
    _grp setVariable ["Vcm_Disable",true];
    _ind = (floor (random ((count _pos) / 4)));
    _pos = _pos call BIS_fnc_arrayShuffle;
	for "_i" from 1 to (_ind) step 1 do {
		_point = _pos # (_i - 1);
        _pos deleteAt (_i - 1);
		_house = _point # 0;
		_posH = _point # 1;
        _unit = _grp createUnit [(_units call BIS_fnc_selectRandom), [0, 0, 0], [], 0, "CAN_COLLIDE"];
        [_unit] join _grp;
		_unit setPosATL _posH;
		_watchDir = (([_unit, _house] call BIS_fnc_dirTo) + 180);
		_unit setDir _watchDir;
		_unit setUnitPos (["UP", "MIDDLE"] call BIS_fnc_selectRandom) ;
		_unit disableAI "PATH";
		_watchPos = [getPos _unit, _watchDir, ((round (random 30) + 30)), 1] call BT_fnc_getPos;
		_unit doWatch _watchPos;
        _arrunits pushBack _unit;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
            // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
            ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
        }];
        sleep 0.1;
	};
    //дин симуляция
    _list_dynsim pushBack _grp;

};


[_pos,_list_dynsim] spawn _BT_fnc_inHouse;
sleep 0.1;


//======================================================================техника==================================================
//======================================================================Хамеры=====================================================
_c = 0;
if(nachinaem_zonovo) then { 
    switch(true) do {
        case (_variantCount == "min"):{_c = 3 + (round(random 2))};
	};	
};
missionnamespace setvariable ["countcar",_c,true];
for "_c" from 1 to _c do  
{
    _group1 = creategroup west;
    _Car = Car call BIS_fnc_arrayShuffle;
    _typevehc = selectRandom _Car;
    _SpawnPosVehc = [_pos,1,500,4,0,0.4,0] call srv_fnc_findSafePos;
    _vehc=[_group1,_SpawnPosVehc,_typevehc,0] call srv_fnc_createenemyvehicle;
    _vehc limitSpeed 10;
    [_group1,_SpawnPosVehc,_pos,0,150,[-1,-1,-1,0,false],"path for car",300] spawn srv_fnc_InfantryTasckPatrol;
    sleep 1;	 
};
sleep 0.1;


//==================================================================Бронетехника====================================================
_t = 0;
if(nachinaem_zonovo) then { 
    switch(true) do {
        case (_variantCount == "min"):{_t = 4 + (round(random 2))};
	};		
};
missionnamespace setvariable ["counttank",_t,true];
for "_t" from 1 to _t do  
{
  _group2 = creategroup west;
  _Tank = Tank call BIS_fnc_arrayShuffle;
  _typeveht = selectRandom _Tank;
  _SpawnPosVeht = [_pos,1,500,4,0,0.4,0] call srv_fnc_findSafePos;
  _veht=[_group2,_SpawnPosVeht,_typeveht,0] call srv_fnc_createenemyvehicle;
  _veht limitSpeed 10;
  [_group2,_SpawnPosVeht,_pos,0,150,[-1,-1,-1,0,false],"path for tank",300] spawn srv_fnc_InfantryTasckPatrol;
  sleep 1;	
   
};





sleep 10;
//дин симуляция
{[_x,true] remoteexec ["enableDynamicSimulation",2]}foreach _list_dynsim;


//DONE
missionNamespace setVariable ["_spawn_AI_point_done",true,2];