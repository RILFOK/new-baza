/*
Author: ToxaBes
Description: open arsenal whitelisted per player
*/
_myBox = _this select 0;
if (vehicle player != player) exitWith {
    systemChat "Арсенал недоступен внутри техники";
};
if (player distance2D _myBox > 5) exitWith {
    systemChat "Арсенал доступен в радиусе 5м";
};

_uniform = [];
_vest = [];
_backpack = [];
_headgear = [];
_items = [];
_optics = [];
_handgunWeapon = [];
_secondaryWeapon = [];
_primaryWeapon = [];
_muzzles = [];
_pointers = []; 
_bipods = [];
_googles = [];
_magazines = [];
_type = typeOf player;
switch (_type) do { 
	case "O_engineer_F" : { //engineer
        #include "..\s_player\arsenal\engineer.sqf"
    }; 
	case "O_medic_F",
    case "O_G_medic_F" : {  //medic
        #include "..\s_player\arsenal\medic.sqf"    
    };
    case "O_soldier_M_F" : { //sniper
        #include "..\s_player\arsenal\sniper.sqf"
    };
    case "O_Soldier_F" : { //strelok
        #include "..\s_player\arsenal\rifleman.sqf"
    };
    case "O_Soldier_AR_F" : { //support
        #include "..\s_player\arsenal\support.sqf"
    };
    case "O_Sharpshooter_F" : { //marksman
        #include "..\s_player\arsenal\marksman.sqf"
    };
    case "O_T_Medic_F";  // dispetcher
    case "O_helipilot_F";  // heli pilot
    case "O_T_Pilot_F" : { //pilot
        #include "..\s_player\arsenal\pilot.sqf"
    };
    case "O_soldierU_medic_F"; // tank commander
    case "O_soldierU_repair_F" : { // tank crew
        #include "..\s_player\arsenal\tankman.sqf"
    };
    case "O_Soldier_AA_F";
    case "O_Soldier_LAT_F" : {  // AT
        #include "..\s_player\arsenal\antitank.sqf"
    };    
	default { //strelok
        #include "..\s_player\arsenal\rifleman.sqf"
    }; 
    case "I_soldier_F";
    case "I_medic_F";
    case "I_engineer_F" : { // green
        #include "..\s_player\arsenal\green.sqf"
    };
};

[_myBox, true, false] call BIS_fnc_removeVirtualWeaponCargo;
[_myBox, true, false] call BIS_fnc_removeVirtualItemCargo;
[_myBox, true, false] call BIS_fnc_removeVirtualBackpackCargo;
[_myBox, true, false] call BIS_fnc_removeVirtualMagazineCargo;

[_myBox, _backpack, false, false] call BIS_fnc_addVirtualBackpackCargo;
[_myBox, _vest, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _headgear, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _optics, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _items, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _muzzles, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _pointers, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _bipods, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _googles, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _uniform, false, false] call BIS_fnc_addVirtualItemCargo;
[_myBox, _handgunWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
[_myBox, _primaryWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
[_myBox, _secondaryWeapon, false, false] call BIS_fnc_addVirtualWeaponCargo;
[_myBox, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;

['Open', [false, _myBox, player]] call TB_fnc_arsenal;