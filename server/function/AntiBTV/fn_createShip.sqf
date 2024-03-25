// TechiesLove <3 
private ["_spawnpos", "_submarine"];

if !(isServer) exitWith {};

// спавн подлодки
_pos0 = [random (worldSize * 0.8), random (worldSize * 0.8), 0];
_pos0 = [_pos0 select 0, _pos0 select 1, getTerrainHeightASL _pos0];

_centerpos = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
_spawnpos = _centerpos;
_count = 0;

_mapsize = worldSize;

while { _spawnpos isEqualTo _centerpos } do {
	_spawnpos = [_pos0, 1000, 10000, 50, 2, 1, 0, [], []] call BIS_fnc_findSafePos;

	if (_spawnpos isEqualTo _centerPos
	|| (_spawnpos distance UTF) < 5000
	|| (_spawnpos distance GREEN) < 5000) then {
		_spawnpos = _centerpos;
		_count = _count + 1;
		if (_count > 20) then {
			break;
		};
		sleep 0.025;
	} else {
		break;
	};
};

_submarine = "B_SDV_01_F" createVehicle _spawnpos;

b1 = "Land_Destroyer_01_hull_04_F" createVehicle [0, 0, 0];
b1 attachTo [_submarine, [0, -45, -2] ]; b1 setDir 180;
b2 = "Land_Destroyer_01_hull_03_F" createVehicle [0, 0, 0];
b2 attachTo [_submarine, [0, 0, -2] ]; b2 setDir 180;
b3 = "Land_Destroyer_01_interior_03_F" createVehicle [0, 0, 0];
b3 attachTo [_submarine, [0, 0, -2] ]; b3 setDir 180;
b4 = "Land_Destroyer_01_hull_02_F" createVehicle [0, 0, 0];
b4 attachTo [_submarine, [0, 45, -2] ]; b4 setDir 180;
b5 = "Land_Destroyer_01_interior_02_F" createVehicle [0, 0, 0];
b5 attachTo [_submarine, [0, 45, -2] ]; b5 setDir 180;
b6 = "Land_Destroyer_01_hull_01_F" createVehicle [0, 0, 0];
b6 attachTo [_submarine, [0, 85, -2] ]; b6 setDir 180;
b7 = "Land_Destroyer_01_hull_05_F" createVehicle [0, 0, 0];
b7 attachTo [_submarine, [0, -80, -2] ]; b7 setDir 180;
b8 = "Land_Destroyer_01_interior_04_F" createVehicle [0, 0, 0];
b8 attachTo [_submarine, [0, -45, -2] ]; b8 setDir 180;

b1 enableSimulation false;
b1 allowDamage false;

b2 enableSimulation false;
b2 allowDamage false;

b3 enableSimulation false;
b3 allowDamage false;

b4 enableSimulation false;
b4 allowDamage false;

b5 enableSimulation false;
b5 allowDamage false;

b6 enableSimulation false;
b6 allowDamage false;

b7 enableSimulation false;
b7 allowDamage false;

b8 enableSimulation false;
b8 allowDamage false;

_SAM = createVehicle ["B_SAM_System_02_F", position _submarine, [], 0, "NONE"];
_SAM attachTo [_submarine, [0, -51, 17]];
_SAM setDir 180;
_SAM setVehicleRadar 1;
_SAM setVehicleReportOwnPosition true;
_SAM setVehicleReportRemoteTargets true;
_SAM setVehicleReceiveRemoteTargets true;

_AAA = createVehicle ["B_AAA_System_01_F", position _submarine, [], 0, "NONE"];
_AAA attachTo [_submarine, [0, -36.5, 20.5]];
_AAA setDir 180;
_AAA setVehicleRadar 1;
_AAA setVehicleReportOwnPosition true;
_AAA setVehicleReportRemoteTargets true;
_AAA setVehicleReceiveRemoteTargets true;

_AAA2 = createVehicle ["B_AAA_System_01_F", position _submarine, [], 0, "NONE"];
_AAA2 attachTo [_submarine, [0, 48, 16.5]];
_AAA2 setDir 0;
_AAA2 setVehicleRadar 1;
_AAA2 setVehicleReportOwnPosition true;
_AAA2 setVehicleReportRemoteTargets true;
_AAA2 setVehicleReceiveRemoteTargets true;

_SAM2 = createVehicle ["B_SAM_System_02_F", position _submarine, [], 0, "NONE"];
_SAM2 attachTo [_submarine, [0, 78.5, 12.5]];
_SAM2 setDir 180;
_SAM2 setVehicleRadar 1;
_SAM2 setVehicleReportOwnPosition true;
_SAM2 setVehicleReportRemoteTargets true;
_SAM2 setVehicleReceiveRemoteTargets true;

private _shipGroup = createGroup west;
{
	createVehicleCrew _x;
	(crew _x) join _shipGroup;
	_x lock 3;
	_x allowCrewInImmobile true;
} forEach [_SAM, _SAM2, _AAA, _AAA2];

_submarine setPos _spawnpos;
_submarine setVectorUp [0, 0, 1];
_submarine enableSimulation false;
_submarine allowDamage false;
deleteVehicle _submarine;

// сохраняем подлодку в миссии
missionNamespace setVariable ["_RADAR_SHIP", [b1, b2, b3, b4, b5, b6, b7, b8, _SAM, _SAM2, _AAA, _AAA2], true];

_LIST = [_SAM, _SAM2];

while { alive _SAM || alive _SAM2 } do {
	sleep 900;
	{
		if (alive _x) then {
			_x setVehicleAmmo 1;
		}
	} forEach _LIST;
};