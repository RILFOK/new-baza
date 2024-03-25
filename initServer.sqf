diag_log "++++++++++++++++++++++++++++++++++старт сервера++++++++++++++++++++++++++++++++";
diag_log "++++++++++++++++++++++++++++++++++старт сервера++++++++++++++++++++++++++++++++";

MUH_fnc_spawnCraft = compileFinal preprocessFile "MUH\MUH_fnc_spawnCraft.sqf";
MUH_fnc_cleanup = compileFinal preprocessFile "MUH\MUH_fnc_cleanup.sqf";
MUH_fnc_mrProper = compileFinal preprocessFile "MUH\MUH_fnc_mrProper.sqf";
MUH_fnc_despawnCraft = compileFinal preprocessFile "MUH\MUH_fnc_despawnCraft.sqf";
#include "MUH\MUH_array.sqf"

[] execVM "HPAwesomeQuery.sqf";



//============================================================================================================================
//============================================================================================================================
//==================================== onPlayerConnected/Disconnected======================================
//=============================================================================================================================
//============================================================================================================================

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	missionNamespace setVariable [format ["TIMEDIS_%1",_uid],true,true];

	

	// ServerNamespace
	//============================== HS Handle =============================================
	if ((_uid select [0,2]) isEqualTo 'HC') exitwith {
		private _hn_headlessClients = (serverNamespace getVariable 'hn_headlessClients');
		_hn_headlessClients deleteAt ((serverNamespace getVariable 'hn_headlessClients') find _owner);
		serverNamespace setVariable ['hn_headlessClients',_hn_headlessClients];
		
		if ((serverNamespace getVariable ['hn_headlessClients',[]]) isEqualTo []) then {
			if (serverNamespace getVariable ['hn_HC_Active',TRUE]) then {
				serverNamespace setVariable ['hn_HC_Active',FALSE];
			};
		};
		if (!(allPlayers isEqualTo [])) then {
			'A headless client has disconnected, please stand by.' remoteExec ['systemChat',-2,FALSE];
		};
		diag_log (format ['Headless Client %1 ( %2 ) disconnected',_owner,_uid]);
	};
	//====================================================================================
	
}];

missionNamespace setVariable ["IgrokVIgre",[],true];


addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	

	//==========================   HS Handle   ====================================
	if ((_uid select [0,2]) isEqualTo 'HC') exitWith {
		private _hn_headlessClients = serverNamespace getVariable ['hn_headlessClients',[]];
		_hn_headlessClients pushBackUnique _owner;
		serverNamespace setVariable ['hn_headlessClients',_hn_headlessClients];

		if (!(serverNamespace getVariable ['hn_HC_Active',FALSE])) then {
			serverNamespace setVariable ['hn_HC_Active',TRUE];
		};
		'A headless client has connected' remoteExec ['systemChat',-2,FALSE];
		diag_log (format ['***** SERVER ***** HC Registered ***** %1 * %2 *****',_owner,_uid]);
	};

	//=================================================================================================================================================


	[_uid,_name] spawn srv_fnc_PlayerConnected;
	
}];

//Chane
addMissionEventHandler ["HandleDisconnect",{
	if ((_uid select [0,2]) isEqualTo 'HC') exitWith {};

	_this spawn srv_fnc_playerdisconnected}
	];

missionNamespace setVariable ["shof", false, true];
//============================================================================================================================
//============================================================================================================================
//============================================================================================================================
//============================================================================================================================
//============================================================================================================================
//============================================================================================================================





// запуск фпс
//null = [] spawn Srv_fnc_init_fps;
// запуск динамических групп
["Initialize"] call BIS_fnc_dynamicGroups;

//Wether and timeskip
_numbers = [1,3,5,7,8,9,10,11,12,13,14,15,16,13,15,17,19];
_numbers = _numbers call BIS_fnc_arrayShuffle;
_numbers = _numbers call BIS_fnc_arrayShuffle;
_num = selectRandom _numbers;
skipTime _num;
_nms = [0.25,0,0,0.5,0.8];
_nms = _nms call BIS_fnc_arrayShuffle;
_nms = _nms call BIS_fnc_arrayShuffle;
_nm = selectRandom _nms;
0 setRain _nm;
_nm = selectRandom _nms;
0 setOvercast _nm;
forceWeatherChange;

//Установки dynamicSimulation
//======================================================
enableDynamicSimulationSystem true;
"Group" setDynamicSimulationDistance 2500;
"Vehicle" setDynamicSimulationDistance 5000;
"EmptyVehicle" setDynamicSimulationDistance 70;
"Prop" setDynamicSimulationDistance 50;
"IsMoving" setDynamicSimulationDistanceCoef 1;
//======================================================
//======================================================


//------------------Установки НШ--------------------
missionNamespace setVariable ["3pw", false,true];
missionNamespace setVariable ["stamina", false,true];
missionNamespace setVariable ["traska", false,true];
missionNamespace setVariable ["MapNV", false,true];

//----------------Blue life counter------------------
missionNamespace setVariable ["blueUID",[],true];


//запуск триггера и боевого воздуха
//==================================================================
//==================================================================
//==================================================================

if(PointSelectionMethod == 0) then {
    [] spawn srv_fnc_createPoint;
} else {
if(!_NoPoints) then {[] spawn srv_fnc_createPoint};
};

sleep 1;
switch AirPatrol do {
    case 1:{};
    case 2:{[selectRandom EnemyAir,2] spawn srv_fnc_enemyairCycle};
	case 3:{[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle};
	case 4:{
		if((random 10)>4) then {
			if (random 10 > 8) then {
				[EnemyAir select 0, 2] spawn srv_fnc_enemyairCycle;
			} else {
				[EnemyAir select 1, 2] spawn srv_fnc_enemyairCycle;
			};
		} else {
			[selectRandom EnemyHelli,3] spawn srv_fnc_enemyairCycle;
		};
	};
};

// запрос данных с бд
[] spawn bt_db_fnc_selectData;

// check admin, log zeus, запукает/отключает скрипт для видимости зевсам. Haron
//=======================================================================================
//=======================================================================================
//=======================================================================================

if (!isDedicated) then {[] spawn srv_fnc_zeusaddobjects;};

addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	private _name = (getUserInfo _networkId) # 3;
	private _uid = (getUserInfo _networkId) # 2;
	private _value = 0;

	missionNamespace setVariable ["_Active_Zeus1","",true];
	if (_loggedIn == true) then {
		_value = 1;
		missionNamespace setVariable ["_Active_Zeus1",_name,true];

		if (count (allplayers select {!isNull (_x getVariable ["Achilles_var_promoZeusModule",objNull])}) == 0 ) then {
			[] spawn srv_fnc_zeusaddobjects;
		};
	} else {

		if (count (allplayers select {!isNull (_x getVariable ["Achilles_var_promoZeusModule",objNull])}) == 0 ) then {
			terminate (missionNamespace getvariable "_zeusaddobjects_script");
		};
	};

	[_name,_uid,_name,_uid,"zeus",_value] remoteExecCall ["bt_db_fnc_insertDopusklog",2];
	
}];

//=======================================================================================
//=======================================================================================
//=======================================================================================
//=======================================================================================
[] call custom_service_fnc_vehserviceload;
[] call pylon_manager_fnc_pylonmanagerload;
[] call anti_btv_fnc_tankload;
[] call aps_fnc_attachaps;