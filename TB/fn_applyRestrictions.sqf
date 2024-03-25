/*
Author: ToxaBes
Description: apply restrictions for player

Edition Author: Avotion
Check all equipment, remove restricted
*/
_player = _this select 0;
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
_skip = false;
_type = typeOf _player;
switch (_type) do { 
	case "O_engineer_F" : {
        #include "..\s_player\arsenal\engineer.sqf"
    }; 
    case "O_medic_F";
    case "O_G_medic_F" : {
        #include "..\s_player\arsenal\medic.sqf"    
    };
    case "O_soldier_M_F" : {
        #include "..\s_player\arsenal\sniper.sqf"
    };
    case "O_Soldier_F" : {
        #include "..\s_player\arsenal\rifleman.sqf"
    };
    case "O_Soldier_AR_F" : {
        #include "..\s_player\arsenal\support.sqf"
    };
    case "O_Sharpshooter_F" : {
        #include "..\s_player\arsenal\marksman.sqf"
    };
    case "O_T_Medic_F";
    case "O_helipilot_F"; 
    case "O_T_Pilot_F" : {
        #include "..\s_player\arsenal\pilot.sqf"
    };
    case "O_soldierU_medic_F";
    case "O_soldierU_repair_F" : {
        #include "..\s_player\arsenal\tankman.sqf"
    };
    case "O_Soldier_AA_F";
    case "O_Soldier_LAT_F" : {
        #include "..\s_player\arsenal\antitank.sqf"
    };    
    case "I_soldier_F";
    case "I_medic_F";
    case "I_engineer_F" : {
        #include "..\s_player\arsenal\green.sqf"
    };
	default {
        _skip = true;
    }; 
};

if (_skip) exitWith {};


_allItems = _uniform + _vest + _backpack + _headgear + _items + _optics + _handgunWeapon + _secondaryWeapon + _primaryWeapon + _muzzles + _pointers + _bipods + _googles;
_bagrestriction = _handgunWeapon + _backpack + _secondaryWeapon + _primaryWeapon;
_bagrestriction = _bagrestriction apply {toLower _x};
_allItems = _allItems apply {toLower _x};
_magazines = _magazines apply {toLower _x};

_playerItems = getUnitLoadout _player;

_TAG_check = { 
    params ["_currentItem","_c","_array","_doubleArray"];
    _inArray = _array;
    _array = (_array select _c);


    switch (_doubleArray) do {
        case false: {
                if (typeName _currentItem == "ARRAY") then {
                    if ((count _currentItem) > 0) then {
                        if (typeName (_currentItem select 0) == "ARRAY") then {
                                {   
                                    _y = _forEachIndex;
                                    [_x,_y,_array,true] call _TAG_check;
                                } forEach _currentItem;
                            
                        } else {

                            if (!((toLower (_currentItem select 0)) in _magazines) && !((_currentItem select 0) == "")) then {
                                if !((toLower (_currentItem select 0)) in _allItems) then {
                                    systemChat "Вы не можете использовать этот предмет!"; 
                                    systemChat format ["%1", _currentItem select 0]; 
                                    _array deleteRange [0,(count _currentItem)-1];
                                }else{
                                    {   
                                        _y = _forEachIndex;
                                        [_x,_y,_array,false] call _TAG_check;
                                    } forEach _currentItem;
                                };
                            };
                        };
                    };
                } else {
                
                    if !(typeName _currentItem == "SCALAR") then {
                        if !(_currentItem == "") then {
                            if !((toLower _currentItem) in _allItems) then {
                                systemChat "Вы не можете использовать этот предмет!"; 
                                systemChat format ["%1", _currentItem]; 
                                _inArray set [_c,""];
                            };
                        };
                    };
                };
        };
        case true: {
                if (typeName (_currentItem select 0) == "ARRAY") then {
                    if ((count _currentItem) > 0) then {
                            if !((toLower ((_currentItem select 0) select 0)) in _magazines) then {
                                _dbaItem = (tolower ((_currentItem select 0) select 0));
                                if ((_dbaItem in _bagrestriction) || (_dbaItem in _bagrestriction) || (_dbaItem in _bagrestriction) || (_dbaItem in _bagrestriction)) then {
                                        systemChat "Вы не можете хранить данный предмет внутри снаряжения!";
                                    systemChat format ["%1", _dbaItem];  
                                    _inArray deleteAt _y;
                                };
                                if !(_dbaItem in _allItems) then {
                                    systemChat "Вы не можете использовать этот предмет!";
                                    systemChat format ["%1", _dbaItem];   
                                    _inArray deleteAt _y;
                                };
                            };
                    };
                } else {
                    if !(typeName (_currentItem select 0) == "SCALAR") then {
                        if !((_currentItem select 0) == "") then {
                            if (!((toLower (_currentItem select 0)) in _allItems) && !((toLower (_currentItem select 0)) in _magazines)) then {
                                systemChat "Вы не можете использовать этот предмет!"; 
                                systemChat format ["%1", (_currentItem select 0)]; 
                                _inArray deleteAt _y;
                            };
                        };
                    };
                }; 
        };
    };  

};



{
    _y = _forEachIndex;
    [_x,_y,_playerItems,false] call _TAG_check;

} forEach _playerItems;


removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;


_player setUnitLoadout _playerItems;