if(!isServer) exitWith {};
private ["_text","_firstPoint","_pos","_cpleast","_cplresi","_callside","_marksize","_HQ","_v","_grp","_SpawnPosGrp","_infantry","_type","_unit","_c","_group1","_Car","_typevehc","_SpawnPosVehc","_vehc","_t","_group2","_Tank","_typeveht","_SpawnPosVeht","_veht","_listArmy"];
//оборона города
params ["_marker","_radius"];
_pos =  getMarkerPos _marker;
//====================================================================пехота====================================================
private _countplayer = playersNumber east;
private _variantCount = "";

switch true do {
    case (Rezhim == 3 || {Rezhim != 3 && {_countplayer < 6}}):{_variantCount = "min"}; 
    case (Rezhim != 3 && {_countplayer > 5 && {_countplayer < 11}}):{_variantCount = "mind"};
	case (Rezhim != 3 && {_countplayer > 10}):{_variantCount = "max"};
};
missionnamespace setVariable ["variantCount",_variantCount,true];

_HQ = createCenter west;

private ["_countEnemyMan","_ost","_cmmin","_cm","_n","_vp"];
_cm = 0;
_n = 6;
_vp = 0;
_v = 0;
_countEnemyMan = 0;
_ost = 0;
_cmmin = false;


missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];	
_vp = floor(_countEnemyMan/_n);
_ost = _countEnemyMan - (_vp*_n);
if(_ost > 0) then {_v = _vp + 1} else {_v = _vp};
_cmmin = true;

if(nachinaem_zonovo) then { 
    switch (true) do {
        case (_variantCount == "min"):{_v = 20}; 
        case (_variantCount == "mind"):{_v = 25 + (floor(random 5))};
        case (_variantCount == "max"):{_v = 30};
	};
	_countEnemyMan = _v*_n;
    missionnamespace setvariable ["countEnemyMan",_countEnemyMan,true];
};




//========================== HC HANDLE ====================================
//===========================================================================
//Ensure, that HC connected

if (isDedicated) then {
    if ((missionNameSpace getVariable ["Restart",1]) == 1) then {
        sleep 15;
        ["HC","HC","HC","HC","HClient",0] remoteExecCall ["bt_db_fnc_insertDopusklog",2];
        sleep 10;
        ["HC","HC","HC","HC","HClient",1] remoteExecCall ["bt_db_fnc_insertDopusklog",2];
        sleep 120; //Set more after tests
        
    };
};
// Начать спавнить ботов/технику в триггере
missionNamespace setVariable ["_spawn_AI_point_done",false];

if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_v,_cmmin,_ost,_n,_pos,_variantCount] remoteExec ["srv_fnc_spawnAIpoint",(serverNamespace getVariable "hn_headlessClients") select 0];
    //["упралвение у HC"] remoteExec ["systemChat",0];
    waitUntil {sleep 5; missionNamespace getVariable ["_spawn_AI_point_done", false];};
    
} else {
    private _spawn_AI_point = [_v,_cmmin,_ost,_n,_pos,_variantCount] spawn srv_fnc_spawnAIpoint;
    //["упралвение у сервера"] remoteExec ["systemChat",0];
    //ждать, пока все не заспавнится
    waitUntil {sleep 5; scriptDone _spawn_AI_point;};

};

//["Спавн закончился"] remoteExec ["systemChat",0];

//======Мониторинг============================================
private _number_hn_trigger = format["%1/%2",missionNameSpace getVariable ["Restart",1], (missionNameSpace getvariable ["_trigger_hn_config1",[]]) # 1];
missionNamespace setVariable ["_number_hn_trigger_monitoring",_number_hn_trigger,true];
[(Gamer getVariable "datapoint") # 1, 3,_number_hn_trigger, 6] remoteExecCall ["bt_db_fnc_changeMonitoring",2];
//============================================================

//===========================================================================


if(nachinaem_zonovo) then {
    _listArmy = _pos nearEntities [["Man","Car","Tank"],400];
    missionNamespace setVariable ["numberOfArmy",(WEST countSide _listArmy),true];
} else {
    private _countSidelistArmy = ["read", ["Point","numberOfArmy"]];
	missionNamespace setVariable ["numberOfArmy",_countSidelistArmy,true];
};

if(nachinaem_zonovo) then {
    if(Rezhim == 2 || {Rezhim == 3}) then {
	    missionNamespace setVariable ["ReinforPoint1",true,true];
	    
        missionNamespace setVariable ["PerehodPoint",false,true];  
        missionNamespace setVariable ["Stage",2,true];	
    };
};

missionnamespace setvariable ["srv_cycleworks",true,true];
[_marker] spawn srv_fnc_event;


//колличество спавна групп СПН. Минимум 4.
missionNameSpace setVariable ["RC", 8];

if(GroupRecon == 1) then {
   [_pos] call srv_fnc_recongroup;
   sleep 3;
};



if(!nachinaem_zonovo) then {missionNamespace setVariable ["nachinaem_zonovo",true,true]};

//Арта=====================

sleep 1100;
if ((random 1 < 0.80) && (count (missionNameSpace getVariable ["Arty",[]]) > 0) && (playersNumber east > 17)) then {
    missionNameSpace setVariable ["_arty_hn_On", true];
    private _arty = Arty call BIS_fnc_arrayShuffle;
    private _typearty = selectRandom _arty;
    ["Land_HBarrier_3_F",_marker,_typearty] spawn srv_fnc_artPos;

} else {
    missionNameSpace setVariable ["ARTILLERY_HN_ACTIVE", False];
    missionNameSpace setVariable ["_arty_hn_On", False];

};

//======================