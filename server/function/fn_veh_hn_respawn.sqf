
//-------------------------Haron

params ["_veh_netid"];

private ["_veh","_vehName","_vehDir","_vehPos","_vehtype",
		"_vehpyl","_item","_weapon","_magazine",
		"_backpack","_textures","_anim_names","_arr_anim","_veh_array","_count",
		"_veh_lock_cargo", "_veh_lock_rearm"];

if (isServer) then {



	_veh_array = missionNamespace getvariable _veh_netid;

	//DELAY
	sleep (_veh_array # 0);

	_vehDir = _veh_array # 2;
	_vehPos = _veh_array # 3;
	_vehtype = 	_veh_array # 4;
	_vehpyl = _veh_array # 5;
	_item = _veh_array # 6;
	_weapon = _veh_array # 7;
	_magazine = _veh_array # 8;
	_backpack = _veh_array # 9;
	_textures = _veh_array # 10;
	_anim_names = _veh_array # 11;
	_arr_anim = _veh_array # 12;
	_vehName = _veh_array # 13;
	_veh_lock_cargo = _veh_array # 14;
	_veh_lock_rearm = _veh_array # 15;


	_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
	_veh setDir _vehDir;
	_veh setPosATL _vehpos;



	_veh setVariable ["dnt_remove_me",true];
	_veh setvariable ["_veh_netid",_veh_netid,true];

	if (_vehName != "") then {
		missionNamespace setVariable [_vehName, _veh];
		_veh setVehicleVarName _vehName;
		publicVariable _vehName;
	};

	[_veh] call TB_fnc_addDoorsAction;
	//[_veh, _item, _weapon, _magazine, _backpack] call TB_fnc_initVehicle;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;


	if (_veh_lock_rearm) then {
		_veh setAmmoCargo 0;
	};
	
	_count = 0;

	{	
		_veh setObjectTextureGlobal [ _count, _x ];
		_count = _count + 1;
	} forEach _textures;

	{
		_veh animate [(_x select 0), (_x select 1),true]; 
	}forEach _arr_anim;

	_pylons = _vehpyl;
	_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
	{ _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veh;
	{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;

	if ((typeOf _veh) isEqualTo "O_Heli_Attack_02_dynamicLoadout_F") then {
		_veh setPylonLoadout ["PylonLeft1","PylonRack_1Rnd_Missile_AA_03_F", true];
		_veh setPylonLoadout ["PylonLeft2","PylonRack_4Rnd_LG_scalpel", true, [0]];
		_veh setPylonLoadout ["PylonRight1","PylonRack_1Rnd_Missile_AA_03_F", true];
		_veh setPylonLoadout ["PylonRight2","PylonRack_20Rnd_Rocket_03_HE_F", true];
	};
	if ((typeOf _veh) isEqualTo "I_Heli_light_03_dynamicLoadout_F") then {
		_veh setPylonLoadout ["PylonLeft1", "PylonRack_12Rnd_PG_missiles", true]; 
		_veh setPylonLoadout ["PylonRight1", "PylonRack_12Rnd_PG_missiles", true]; 
	};

	if (unitIsUAV _veh) then {
		if (_veh isKindOf "Air") then {
			_veh enableUAVWaypoints false;
		};
		_grpUAV = createGroup EAST;
		createVehicleCrew _veh;
		_units = units (group (driver _veh));
		_units joinSilent _grpUAV;
		_veh enableDynamicSimulation FALSE; 
	} else {
		//dynamicSimulation
		_veh enableDynamicSimulation TRUE; 
	};

	//Killed init server
	private  _veh_islocal_handler_kil = _veh  addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		private ["_veh_netid","_veh_array"];
		if (!isServer) exitwith {};

		_veh_netid = _unit getvariable "_veh_netid";
		_veh_array = missionNamespace getvariable _veh_netid;

		// время уничтожения обломков
		_unit removeAllEventHandlers "Deleted";
		[_unit,_veh_array] remoteexec ["srv_fnc_veh_hn_delete",2];

		if !(_veh_array # 1) then {

			[_veh_netid] remoteExec ["srv_fnc_veh_hn_respawn",2];

		} else {
			private _vehicle_hn_TOrespawn = missionNameSpace getvariable ["vehicle_hn_TOrespawn",[]];
			_vehicle_hn_TOrespawn pushBack _veh_netid;
			missionNameSpace setvariable ["vehicle_hn_TOrespawn",_vehicle_hn_TOrespawn,true];
		};

	}];

	//Deleted init server
	private _veh_islocal_handler_del = _veh addEventHandler ["Deleted", {
		params ["_unit"];
		private ["_veh_netid","_veh_array"];

		if (!isServer) exitwith {};

		_unit removeAllMPEventHandlers "MPKilled";

		_veh_netid = _unit getvariable "_veh_netid";
		_veh_array = missionNamespace getvariable _veh_netid;



		if !(_veh_array # 1) then {

			[_veh_netid] remoteExec ["srv_fnc_veh_hn_respawn",2];

		} else {
			private _vehicle_hn_TOrespawn = missionNameSpace getvariable ["vehicle_hn_TOrespawn",[]];
			_vehicle_hn_TOrespawn pushBack _veh_netid;
			missionNameSpace setvariable ["vehicle_hn_TOrespawn",_vehicle_hn_TOrespawn,true];
		};
	
	
	}];
	

	_veh setVehicleReportOwnPosition true;
	_veh setVehicleReportRemoteTargets true;
	_veh setVehicleReceiveRemoteTargets true;

	_veh setVariable ["_veh_islocal_handler_kil",_veh_islocal_handler_kil];
	_veh setVariable ["_veh_islocal_handler_del",_veh_islocal_handler_del];

	//Закрыть инвентарь. Должен быть в конце
	//PGSHKA разрешил открывать инвентарь в машине пон
	if (_veh_lock_cargo) then {
		//[_veh,true] remoteexec ["lockInventory",0,_veh];
		_veh setMaxLoad 0;
	};

	//// 0 - veh_service - Полное обслуживание техники
	//// 1 - veh_repair - Ремонт
	//// 2 - veh_refuel - Заправка
	//// 3 - veh_rearm - Пополнение боекомплекта
	if ("veh_service" in _vehName) then {[ _veh , 0 ] remoteExec ["custom_service_fnc_vehserviceadd",2];};
	if ("veh_repair" in _vehName) then {[ _veh , 1 ] remoteExec ["custom_service_fnc_vehserviceadd",2];};
	if ("veh_refuel" in _vehName) then {[ _veh , 2 ] remoteExec ["custom_service_fnc_vehserviceadd",2];};
	if ("veh_rearm" in _vehName) then {[ _veh , 3 ] remoteExec ["custom_service_fnc_vehserviceadd",2];};
	//// veh_pylonmanager - Имя объекта, на котором можно менять пилоны
	if ("veh_pylonmanager" in _vehName) then {[ _veh ] remoteExec ["pylon_manager_fnc_pylonmanageradd",2];};

	//// Установка евента для антибтв
	// if ("veh_antibtv" in _vehName) then {
	// 	_veh addEventHandler ["Fired", {params ["_unit", "_weapon"]; [(vehicle _unit), _weapon] remoteExec ["anti_btv_fnc_tankCount", 2];}];
	// };
	if ("veh_aps" in _vehName) then {
		[_veh] remoteExec ["aps_fnc_aps_enable", 2];
	};
};


