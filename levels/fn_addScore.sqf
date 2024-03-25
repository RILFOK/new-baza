params ["_killed","_killer1","_instigator","_score"];
//  Принято решение, что входящий параметр "_score" отныне будет являться множителем
//  для базового показателя начисляемой ЭКСПЫ
//  и после прихода в вункцию будет вынесен в новую переменную _coefficient
//  ДОП ФИКС: Если множитель больше 1 то говорим что он 1. Если меньше то оставляем.

private _coefficient = _score min 1;

diag_log format["ADDSCORE %1",_killer1];

if (!(isPlayer _killer1) && !(isPlayer _instigator)) exitWith {};

//Синие превенцыя ТК
if (side _instigator == west) then {
    if (side group _killed == side _instigator) exitWith {
        [_killed, _instigator] spawn blu_fnc_preventTK;
    };
};

If ((side _instigator == east) || (side _killer1 == east)) then {
private _slot = _killer1 getVariable ["slot","null"];
private _killer = objNull;
if (_slot == "null") then {
    _slot = _instigator getVariable ["slot","null"];
    _killer = _instigator;
} else {
    _killer = _killer1;
};
diag_log format["ADDSCORE %1",_killer];
private ["_isMan","_isHeli","_isPlain","_isCar","_isTank","_isShip","_leader","_isLeader","_nsh","_isnsh","_distance","_role","_crew"];
_isMan = _killed isKindOf "Man";
_isHeli = _killed isKindOf "Helicopter";
_isPlain = _killed isKindOf "Plane";
_isCar = _killed isKindOf "Car";
_isTank = _killed isKindOf "Tank";
_isShip = _killed isKindOf "Ship";
_leader = leader (group _killer);
_isLeader = if (_leader == _killer) then {true} else {false};

if !(isNil "NASH") then {
    _nsh = NASH;
    _isnsh = if (_nsh == _killer) then {true} else {false};
} else {
    _isnsh = true;
};

_distance = 0;
_role = "";
_crew = [_killer];


//опыт всему экипажу 
if (vehicle _killer != _killer) then {
    _crew = [driver vehicle _killer, gunner vehicle _killer, commander vehicle _killer];
};



_score = 0;

switch (true) do {
    case _isShip: {
        _score = 1 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                _score = 6 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 6 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "antitank": {
                _score = 4 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };
        
        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isCar: {
        _score = 1 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                _score = 6 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 6 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "antitank": {
                _score = 4 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_killer,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isTank: {
        _score = 1 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "antitank": {
                _score = 6 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 
        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isHeli: {
        _score = 1 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "antitank": {
                _score = 6 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };

        if !(_isLeader) then {
            [_killer,_score * 0.2] spawn bt_fnc_addExp;
        }; 

        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isPlain: {
        _score = 1 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 8 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "antitank": {
                _score = 6 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
            };
            default {
                [_killer,_score] spawn bt_fnc_addExp;
            };
        };
        
        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
        }; 
        
        if !(_isnsh) then {
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
    case _isMan: {
        diag_log format["ADDSCORE %1 isMan",name _killer];
        _score = 6 * _coefficient;
        switch (_slot) do {
            case "pilot": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 1 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "tankman": {
                _score = 1 * _coefficient;
                {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
            };
            case "sniper": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 2 * _coefficient;
                _distance = _killer distance _killed;
                if (_distance <= 1000) then {
                    _score = 2 * _coefficient;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                } else {
                    _score = 3.53 * _coefficient;
                    _score = _score * _distance / 1000;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                };
                //Дополнение за офицера и ПТ/ПВО бойца
                _targetIcon = ["iconManOfficer","iconManAT", "iconManLeader"];
                _target  = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "icon");
                if (_target in _targetIcon) then {
                    _score = 10 * _coefficient;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                };
            };
             case "marksman": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 1 * _coefficient;
                _distance = _killer distance _killed;
                if (_distance <= 300) then {
                    _score = 1 * _coefficient;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                } else {
                    _score = 2.6 * _coefficient;
                    _score = _score * _distance / 300;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                };
                 //Дополнение за офицера и ПТ/ПВО бойца
                _targetIcon = ["iconManOfficer","iconManAT","iconManLeader"];
                _target  = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "icon");
                if (_target in _targetIcon) then {
                    _score = 10 * _coefficient;
                    [_killer,_score] spawn bt_fnc_addExp;
                    diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
                };
            };   
            case "antitank": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 4 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
            case "medic": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 3 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
            case "engineer": {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                _score = 4 * _coefficient;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
            default {
                diag_log format["ADDSCORE %1 slot %2",name _killer,_slot];
                // _score = 4;
                [_killer,_score] spawn bt_fnc_addExp;
                diag_log format["ADDSCORE %1 addScore %2",name _killer,_score];
            };
        };

        if !(_isLeader) then {
            [_leader,_score * 0.2] spawn bt_fnc_addExp;
            diag_log format["ADDSCORE %1 addScore %2",name _leader,_score];
        }; 
        if !(_isnsh) then{
            [_nsh,_score * 0.2] spawn bt_fnc_addExp;
        };
    };
};
};