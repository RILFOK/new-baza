
params ["_type","_marker","_veh"];
private ["_markerPos","_radioBashnya","_spawnpos","_obj","_grp","_center_pos","_i","_min_dist","_max_dist","_gradient","_min_obj_dist"];

missionnamespace setvariable ["list_artillery",[]];

//Ищем подходящую координату для спавра. Не близко к базе, ровная поверхность
_spawnpos = [];
_markerPos = getmarkerpos _marker;

_center_pos  = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
_spawnpos = _center_pos;

_min_dist = 3000;
_max_dist = 5000;
_min_obj_dist = 15;
_gradient = 0.35;
_mapsize = Worldsize;

_i = 0;

private _xcoord = _spawnpos select 0;
private _ycoord = _spawnpos select 1;

while {_spawnpos isEqualTo _center_pos} do {


    _spawnpos = [_markerPos,_min_dist,_max_dist, _min_obj_dist, 0,_gradient,0] call Srv_fnc_findSafePos;

    _xcoord = _spawnpos select 0;
    _ycoord = _spawnpos select 1;

    if ((_xcoord < 0) || (_xcoord > _mapsize) || (_ycoord > _mapsize) || (_ycoord < 0) || {(_spawnpos distance baseutf) < 3000}) then {
        _spawnpos = _center_pos; 
        _min_dist = 3000;
        _max_dist = 5500;

        if (_i > 10) then {_gradient = 0.5;};
        if (_i > 20) then {_gradient = 0;};

        if (_i > 100) then {"Что-то не пошло не так. Код ошибки ART1. Сообщите данную информацию разработчикам." remoteExec ["systemchat",-2]; Break}; 
        
        _i = _i +1; 

    } else {Break};
    
    sleep 0.1;
};




_radioBashnya = _type createVehicle _spawnpos;

_radioBashnya enableSimulation False;
_radioBashnya allowdamage False;

_radioBashnya setVectorUp surfaceNormal position _radioBashnya;
//разворачиваем арту в сторону триггера
_radiobashnya setDir (((getDir _radiobashnya) + ([_radiobashnya,_markerPos] call BIS_fnc_relativeDirTo)) - 90);
_radioBashnya setPos _spawnpos;
_radioBashnya setPos (getPos _radioBashnya vectorAdd [0,0,0]);

missionNamespace setVariable ["PosArta", _spawnPos];
 
 
_BRO_fnc_placing = { 
    params ["_class","_X","_Y","_angle","_offset"]; 
    if (isNil "_offset") then {_offset = 0}; 
    _az = getDir _radioBashnya ; 
    _obj = _class createVehicle getPosWorld _radioBashnya ; 
    _obj setDir _az+_angle; 
    _obj setPos (_radioBashnya modelToWorld [_X,_Y]); 
    _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"]; 
}; 
 

 
_BRO_fnc_placing_trooper = { 
    params ["_class","_X","_Y","_angle","_offset"]; 
    if (isNil "_offset") then {_offset = 0}; 
    _az = getDir _radioBashnya ; 
    _man = _grp createUnit [_class, getPosWorld _radioBashnya ,[],0,"NONE"]; 
    _man setDir _az+_angle; 
    _man setPos (_radioBashnya  modelToWorld [_X,_Y]); 
    _man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"]; 
    _man setSkill 0.6; 
    _man allowFleeing 0; 
    [_man] join _grp; 
    doStop _man; 
}; 

_hn_fnc_placing_arty = { 
    params ["_class","_X","_Y","_angle","_offset"];
    private ["_arty","_az","_grp","_crew"];
    
    if (isNil "_offset") then {_offset = 0}; 
    _az = getDir _radioBashnya ; 
    _arty = _class createVehicle getPosWorld _radioBashnya;
    
    _arty allowdamage false; 
    _arty setDir _az+_angle; 
    _arty setPos (_radioBashnya  modelToWorld [_X,_Y]); 
    _arty setVehiclePosition [[getPosATL _arty select 0, getPosATL _arty select 1, _offset], [], 0, "CAN_COLLIDE"]; 
    _arty allowdamage true;

    list_artillery pushBack _arty;
    missionnamespace setvariable ["ARTILLERY_HN_ACTIVE",TRUE];

    _grp = createGroup west;
    createVehicleCrew _arty;
    private _crew = crew _arty;
    _crew joinsilent _grp;
    _grp addVehicle _arty;
    _grp deleteGroupWhenEmpty true;
    _arty deleteVehicleCrew (driver _arty);
    _grp setBehaviour 'COMBAT';
    _grp setCombatMode 'RED';
    //(gunner _arty) setUnitCombatMode "BLUE";
    _arty setVehicleReceiveRemoteTargets TRUE;
    
    _arty lock 2;
    _arty setfuel 0;

    {
        [_x] call srv_fnc_fset_AISkill;
        _x allowFleeing 0;
        _x setVariable ["killed",true,true];
        _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
        _x addEventhandler ["killed",{
            params ["_unit", "_killer", "_instigator", "_useEffects"];
            // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
            ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
        }];
    } forEach _crew;

    _arty addEventhandler ["killed",{
	    params ["_unit", "_killer", "_instigator", "_useEffects"];
	    _this spawn srv_fnc_DeleteWreckVehicle;
        _unit removeAllEventHandlers "Deleted";

        list_artillery = list_artillery - [_unit];

        if (count (list_artillery) < 1) then {
            missionnamespace setvariable ["ARTILLERY_HN_ACTIVE",FALSE];
        };
    }];

    _arty addEventHandler ["Deleted", {
        params ["_unit"];
        list_artillery = list_artillery - [_unit];

        if (count (list_artillery) < 1) then {
            missionnamespace setvariable ["ARTILLERY_HN_ACTIVE",FALSE];
        };
    }];

    (gunner _arty) addEventHandler [
        'FiredMan',
        {
            private _firingMessages = [
                "Тепловое сканирование обнаружило огонь вражеской артиллерии! Ищите укрытие!",
                "Разведка докладывает о залпе артиллерийской батареи противника! Бегите в укрытие!",
                "Артиллерия врага открыла огонь! Займите укрытие, немедленно!"
            ];

            if (missionnamespace getvariable ["_art_hn_firing",true]) then {
                [[EAST,'HQ'],(selectRandom _firingMessages)] remoteExec ['sideChat',EAST,FALSE];
                missionNameSpace setvariable ["_art_hn_firing",false];

                private _currenttime = time;
                //missionNameSpace setvariable ["_art_hn_lastshot",_currenttime];
                private _cooldown = _currenttime + ([5, 7] call BIS_fnc_randomInt)*60;

                missionNameSpace setvariable ["_art_hn_cooldown", _cooldown];
            };
            
        }
    ];
    /*
    _man = _grp createUnit ["B_soldier_M_F", position _obj,[],10,"FORM"]; 
    _man setSkill 0.6; 
    _man allowFleeing 0; 
    [_man] join _grp; 
    _man moveInGunner _obj;  
    _man = _grp createUnit ["B_soldier_M_F", position _obj,[],10,"FORM"];  
    _man setSkill 0.6;  
    _man allowFleeing 0;  
    [_man] join _grp;  
    _man moveInCommander _obj; 
    */
}; 

[_veh, 2 , 10,90,2] call _hn_fnc_placing_arty;

sleep 10;

[_veh, 2 , -10,90,2 ] call _hn_fnc_placing_arty;

sleep 10;

["Land_HBarrier_Big_F", 0 , 20,180] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 0 , -20,180] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 14 ,10,90] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 14 ,-10,90] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 8 ,-3,35] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 8 ,3,145] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -8 ,3,35] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -8 ,-3,145] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -8 ,-17,35] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -8 ,17,145] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 8 ,17,35] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", 8 ,-17,145] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -14 ,10,90] call _BRO_fnc_placing;

["Land_HBarrier_Big_F", -14 ,-10,90] call _BRO_fnc_placing;

["CamoNet_BLUFOR_F",0 ,20, 360,2] call _BRO_fnc_placing;

["CamoNet_BLUFOR_F",0 ,-20,180,2] call _BRO_fnc_placing;

["CamoNet_BLUFOR_F",14 ,10,90,2] call _BRO_fnc_placing;

["CamoNet_BLUFOR_F",-14 ,10, -90,2] call _BRO_fnc_placing;
["CamoNet_BLUFOR_F",14 ,-10,90,2] call _BRO_fnc_placing;

["CamoNet_BLUFOR_F",-14 ,-10,-90,2] call _BRO_fnc_placing;

//private _typemine = ["APERSMine", "APERSBoundingMine"];
//[_radioBashnya,4,_typemine,20,50,50,random 360,"rectangle",west] call srv_fnc_createMinefieldPointBash;


//СПН
//========================== HC HANDLE ====================================
//===========================================================================

if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_spawnpos] remoteExec ["srv_fnc_spawnAIartydefence",(serverNamespace getVariable "hn_headlessClients") select 0];
    //["спн на HC"] remoteExec ["diag_log",2];
    
} else {
    [_spawnpos] spawn srv_fnc_spawnAIartydefence;
    //["спн на сервере"] remoteExec ["diag_log",2];
};

//===========================================================================
