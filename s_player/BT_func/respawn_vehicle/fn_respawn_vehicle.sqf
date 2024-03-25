if (!isServer) exitWith {};

params ["_vehicle","_distance"];

_unit = player;

_dir = getDir _vehicle;
_pos = getPos _vehicle;
_type = typeOf _vehicle;
_pylon = getPylonMagazines _vehicle;
_texture = getObjectTextures _vehicle;

while {true} do {
	uiSleep 5;
	_crew = count (crew _vehicle);
	{
		if ((_vehicle distance2D _pos) > 10) then {
			//"дистанция1" remoteExec ["hint"];
			if (_vehicle distance2D _x > _distance) then {
				//"дистанция2" remoteExec ["hint"];
				if (_crew == 0) exitWith {
					//"дистанция3" remoteExec ["hint"];
					deleteVehicle _vehicle;
					_veh = createVehicle [_type,_pos,[],0,"CAN_COLLIDE"];
					_veh setDir _dir;
					_veh setPos [(_pos # 0),(_pos # 1),0];
					_countText = 0;
					{
						_veh setObjectTextureGlobal [_countText,_x];
						_countText = _countText + 1;
					} forEach _texture;
					_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
					{
						_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon"); 
					} forEach getPylonMagazines _veh;
					{ 
						_veh setPylonLoadOut [_forEachIndex + 1,_x,true,_pylonPaths # _forEachIndex]; 
					} forEach _pylon;

					[[_veh,_distance],"s_player\BT_func\respawn_vehicle\fn_respawn_vehicle.sqf"] remoteExec ["execVM",2];
				};
			};
		};
	} forEach playableUnits;

	if (!alive _vehicle) exitWith {
		//"уничтожение" remoteExec ["hint"];
		uiSleep 10;
		deleteVehicle _vehicle;
		uiSleep 5;
		_veh = createVehicle [_type,_pos,[],0,"CAN_COLLIDE"];
		_veh setDir _dir;
		_veh setPos [(_pos # 0),(_pos # 1),0];
		_countText = 0;
		{
			_veh setObjectTextureGlobal [_countText,_x];
			_countText = _countText + 1;
		} forEach _texture;
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		{
			_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") 
		} forEach getPylonMagazines _veh;
		{ 
			_veh setPylonLoadOut [_forEachIndex + 1,_x,true,_pylonPaths # _forEachIndex] 
		} forEach _pylon;

		[[_veh,_distance],"s_player\BT_func\respawn_vehicle\fn_respawn_vehicle.sqf"] remoteExec ["execVM",2];
	};
};
