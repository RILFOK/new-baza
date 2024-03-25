

params ["_veh"];


_veh addEventHandler ["Local", {
	params ["_entity", "_isLocal"];
	private ["_veh_islocal_handler_kil","_veh_islocal_handler_del"];


	if (_isLocal) then {

		
		//Killed
		_veh_islocal_handler_kil = _entity addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			private ["_veh_netid","_veh_array"];
			_unit removeAllEventHandlers "Killed";
			_veh_netid = _unit getvariable "_veh_netid";
			_veh_array = missionNamespace getvariable _veh_netid;

			// время уничтожения обломков
			_unit removeAllEventHandlers "Deleted";
			[_unit,_veh_array] remoteexec ["srv_fnc_veh_hn_delete",2];
			[_unit, "Local"] remoteExec ["removeAllEventHandlers",2];

			if !(_veh_array # 1) then {

				[_veh_netid] remoteExec ["srv_fnc_veh_hn_respawn",2];

			} else {
				private _vehicle_hn_TOrespawn = missionNameSpace getvariable ["vehicle_hn_TOrespawn",[]];
				_vehicle_hn_TOrespawn pushBack _veh_netid;
				missionNameSpace setvariable ["vehicle_hn_TOrespawn",_vehicle_hn_TOrespawn,true];
			};
		
		}];

		//Deleted
		_veh_islocal_handler_del = _entity addEventHandler ["Deleted", {
			params ["_unit"];
			private ["_veh_netid","_veh_array"];

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
		


		_entity setVariable ["_veh_islocal_handler_kil",_veh_islocal_handler_kil];
		_entity setVariable ["_veh_islocal_handler_del",_veh_islocal_handler_del];
	
	
	} else {
		_veh_islocal_handler_kil = _entity getVariable ["_veh_islocal_handler_kil",0];
		_veh_islocal_handler_del = _entity getVariable ["_veh_islocal_handler_del",0];

		_entity removeEventHandler ["Killed", _veh_islocal_handler_kil];
		_entity removeEventHandler ["Deleted", _veh_islocal_handler_del];

	};

}];