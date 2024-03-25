//-------------------------Haron



params ["_veh","_destroyedDelay","_after_trigger"];

private ["_vehName","_vehDir","_vehPos","_vehtype","_vehpyl",
		"_item","_weapon","_magazine","_backpack","_textures",
		"_anim_names","_arr_anim","_veh_lock_cargo","_veh_lock_rearm"];

if (isServer) then {

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

		//Dynamicsimulation
		_veh enableDynamicSimulation TRUE;
	};
	clearMagazineCargoGlobal _veh;


	private _veh_netid = netId _veh;

	_veh setvariable ["_veh_netid",_veh_netid,true];

	_vehDir = getDir _veh; 
	_vehPos = getPosATL _veh; 
	_vehtype = typeOf _veh; 
	_vehpyl = GetPylonMagazines _veh;
	_item = getItemCargo _veh;
	_weapon = getWeaponCargo _veh;
	_magazine = getMagazineCargo _veh;
	_backpack = getBackpackCargo _veh;
	_textures = getObjectTextures _veh;
	_anim_names = animationNames _veh;
	_vehName =  vehicleVarName _veh;
	_veh_lock_cargo = _veh getvariable ["lock_hn_cargo",false];
	// diag_log str _veh_lock_cargo;
	_veh_lock_rearm = _veh getVariable ["veh_lock_rearm",false];
	
	//dynamicSimulation

	if (_veh_lock_rearm) then {
		_veh setAmmoCargo 0;
	};
	
	_arr_anim = [];
	{
		_phase = _veh animationPhase _x;
		_arr_anim pushBack [_x,_phase];
	}foreach _anim_names;

	//[_veh, _item, _weapon, _magazine, _backpack] call TB_fnc_initVehicle;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	[_veh] call TB_fnc_addDoorsAction;



	//_veh setvariable ["_arr_anim", _arr_anim];
	// Порядок важен !! новые переменные добавлять в конец 

	missionNamespace setvariable [_veh_netid, 
	[
		_destroyedDelay,_after_trigger,_vehDir,_vehPos,_vehtype,_vehpyl,
		_item,_weapon,_magazine,_backpack,_textures,_anim_names,_arr_anim,_vehName,
		_veh_lock_cargo,_veh_lock_rearm
	],true];



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
	
	_veh setVariable ["_veh_islocal_handler_kil",_veh_islocal_handler_kil];
	_veh setVariable ["_veh_islocal_handler_del",_veh_islocal_handler_del];

	_veh setVehicleReportOwnPosition true;
	_veh setVehicleReportRemoteTargets true;
	_veh setVehicleReceiveRemoteTargets true;

	//Закрыть инвентарь. Должен быть в конце
	//PGSHKA разрешил открывать инвентарь в машине пон
	if (_veh_lock_cargo) then {
		//[_veh,true] remoteexec ["lockInventory",0,_veh];
		_veh setMaxLoad 0;
	};
};