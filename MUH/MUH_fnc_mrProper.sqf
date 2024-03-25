/*
	Author: MUH

	Description:
		Expects to see <PARAM_0> array, deletes ALL vehicles from array members, gets array ready for the new spawns.
		Expects array elements to be [<classname>, <spawn position marker>, <init script>, <display name>, <spawned object>]

	Parameter(s):
		0: String - name of array

	Returns:
		None

	Examples:
		g_crafts = [
			["B_Heli_Light_01_dynamicLoadout_F", "", "pawnee_1", "Pawnee", player],
			["B_Heli_Light_01_dynamicLoadout_F", "pawnee_2", "params [""_new""]; {_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new;", "Pawnee2", vehicle player],
			["B_Heli_Light_01_dynamicLoadout_F", "pawnee_3", "params [""_new""]; {_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new; _new setPylonLoadout [1, ""PylonWeapon_300Rnd_20mm_shells"", true];_new setPylonLoadout [2, ""PylonWeapon_300Rnd_20mm_shells"", true];", "Pawnee3", nil]
		];
		["g_crafts", 2] call "MUH_fnc_spawnCraft.sqf";
*/

params [["_var", nil, ["String"]]];

if (isNil "_var") exitWith {hint "Shit inputs"; false}; // Invalid input parameters
if (!isServer) exitWith {false}; // Only run on server

//systemChat "Cleanup";

{
	private _veh = (_x select 4);
	//systemChat str ;
	if (!isNil "_veh") then {
		//if (!alive _veh) then {
			{ _x moveOut _veh;} forEach crew _veh;
			deleteVehicle _veh;
			_x set [4, nil];
		//};
	};
} forEach (missionNamespace getVariable _var);