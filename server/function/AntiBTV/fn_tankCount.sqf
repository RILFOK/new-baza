params["_target", "_weapon"];
private["_pos", "_currenttime", "_cooldown", "_maxShotsTank", "_mrls", "_pos"];

//PGSHKA anti-btv
// if !(_weapon == "cannon_120_long"
// || _weapon == "cannon_125mm_advanced"
// || _weapon == "cannon_125mm"
// || _weapon == "cannon_railgun") exitwith {};

// _mrls = missionNamespace getVariable ["_RADAR_MRLS", false];

// _currenttime = time;
// _cooldown = missionNameSpace getVariable ["_TanksCooldown", _currenttime];

// _trigger = getMarkerPos (missionNamespace getVariable["trigPoint", [0,0,0]]);

// if (alive _mrls && (_currenttime >= _cooldown) && (_target distance _trigger > 800 && _target distance _trigger < 2800)) then {
// 	_maxShotsTank = _target getVariable["_AllowedShots", 4];
// 	_shoots = _target getVariable["_TankShoots", 0];
// 	_target setVariable["_TankShoots", _shoots + 1, true];
// 	if (_target getVariable["_TankShoots", 0] > _maxShotsTank) then {
// 		////=====================================================================
// 		_target setVariable["_TankShoots", 0, true];
// 		_target setVariable["_AllowedShots", [3, 9] call BIS_fnc_randomInt, true];
// 		////=====================================================================

// 		private _MRLS_target = missionNamespace getVariable ["_RADAR_MRLS_TARGET", false];
// 		if (_MRLS_target isNotEqualTo false) then { deleteVehicle _MRLS_target; };

// 		_pos = createGroup [sideLogic, true] createUnit ["Logic", [(position _target) select 0, (position _target) select 1, 0], [], 50, "CAN_COLLIDE"];
		
// 		(side _mrls) reportRemoteTarget [_pos, 3000];
// 		_mrls setWeaponReloadingTime [gunner _mrls, (weapons _mrls) select 0, 0];
// 		_mrls fireAtTarget [_pos, (weapons _mrls) select 0];
		
// 		////=====================================================================
// 		missionNamespace setVariable ["_RADAR_MRLS_TARGET", _pos, true];
// 		missionNameSpace setvariable ["_TanksCooldown", _currenttime + ([150, 300] call BIS_fnc_randomInt), true];
// 		////=====================================================================
// 	};
// };