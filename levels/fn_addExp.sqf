params ["_player","_exp"];
private _level = _player getVariable ["LEVEL",1];

if (missionNamespace getVariable ["#DEBUGLOG_addExp", false]) then {
    {
        [getAssignedCuratorUnit _x, format ["Игрок: %1 значение: (%2)", name _player, _exp]] remoteExec ["groupChat", getAssignedCuratorUnit _x];
    } forEach allCurators;
};

if (_level == 1) exitWith {};
private _levels = missionNamespace getVariable ["LEVELS",[]];
private _expPlayer = _player getVariable ["EXP",0];
private _nextExp = _levels # (_levels findIf {(_x # 0) == _level}) # 2;
private _prevExp = _levels # (_levels findIf {(_x # 0) == (_level - 1)}) # 2;

private _newExp = _expPlayer + _exp;
if (_newExp >= _nextExp) exitWith {
    _player setVariable ["LEVEL",_level + 1,true];
    [getPlayerUID _player,"level",_level + 1] remoteExecCall ["bt_db_fnc_changePlayer",2];

    _player setVariable ["EXP",_newExp,true];
    [getPlayerUID _player,"exp",_newExp] remoteExecCall ["bt_db_fnc_changePlayer",2];
};

if (_newExp < _prevExp) exitWith {
    if (_level == 2) then {
        _player setVariable ["EXP",0,true];
        [getPlayerUID _player,"exp",0] remoteExecCall ["bt_db_fnc_changePlayer",2];
    } else {
        _player setVariable ["LEVEL",_level - 1,true];
        [getPlayerUID _player,"level",_level - 1] remoteExecCall ["bt_db_fnc_changePlayer",2];

        _player setVariable ["EXP",_newExp,true];
        [getPlayerUID _player,"exp",_newExp] remoteExecCall ["bt_db_fnc_changePlayer",2];
    };
};
_player setVariable ["EXP",_newExp,true];
[getPlayerUID _player,"exp",_newExp] remoteExecCall ["bt_db_fnc_changePlayer",2];
