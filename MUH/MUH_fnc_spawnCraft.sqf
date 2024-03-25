/*
	Author: MUH

	Description:
		Expects to see <PARAM_0> array, spawns craft with <PARAM_1> index from it.
		Expects array elements to be [<classname>, <spawn position marker>, <init script>, <display name>, <spawned object>]

	Parameter(s):
		0: String - name of array
		1: Number - index of craft to spawn




	Returns:
		Boolean - true if craft spawned

	Examples:
		g_crafts = [
			["B_Heli_Light_01_dynamicLoadout_F", "", "pawnee_1", "Pawnee", player],
			["B_Heli_Light_01_dynamicLoadout_F", "pawnee_2", "params [""_new""]; {_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new;", "Pawnee2", vehicle player],
			["B_Heli_Light_01_dynamicLoadout_F", "pawnee_3", "params [""_new""]; {_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new; _new setPylonLoadout [1, ""PylonWeapon_300Rnd_20mm_shells"", true];_new setPylonLoadout [2, ""PylonWeapon_300Rnd_20mm_shells"", true];", "Pawnee3", nil]
		];
		["g_crafts", 2] call "MUH_fnc_spawnCraft.sqf";
*/

params [["_var", nil, ["String"]], ["_index", nil, [0]]];

if (isNil "_var" or isNil "_index") exitWith {hint "Shit inputs"; false}; // Invalid input parameters
if (!isServer) exitWith {false}; // Only run on server

private _tgt = (missionNamespace getVariable _var) select _index;
private _veh = _tgt select 4;
if (!isNil "_veh") exitWith {false}; // Vehicle already spawned

_veh = (_tgt select 0) createVehicle (getMarkerPos (_tgt select 1));

//dynamicSimulation
_veh enableDynamicSimulation TRUE; 

[_veh] call compile (_tgt select 2);
(missionNamespace getVariable _var) select _index set [4, _veh];
true