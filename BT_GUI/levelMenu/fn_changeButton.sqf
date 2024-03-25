private _display = findDisplay 54000;
private _ctrlCombo = _display displayCtrl 54011;
private _indexLevel = lbCurSel _ctrlCombo;
if (_indexLevel < 0) exitWith {hint "Вы не выбрали звание"};
private _newLevel = _indexLevel + 1;
private _uidgiver = getPlayerUID player;
private _namegiver = name player;


private _zvanieAdmin = player getVariable ["LEVEL",1];
// if (_newLevel > _zvanieAdmin) exitWith {
//     hint "Вы не можете давать звание выше Вашего";
// };

private _ctrlList = _display displayCtrl 54004;
private _index = lbCurSel _ctrlList;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;
private _nametaker = name _player;

private _zvaniePlayer = _player getVariable ["LEVEL",1];
// if (_zvaniePlayer > _zvanieAdmin) exitWith {
//     hint "Вы не можете изменять игроков со званием не ниже Вашего!";
// };

private _vseZvaniya = missionNamespace getVariable ["LEVELS",[]];
private _needExp = 0;

if (_newLevel == 1) then {
    _needExp = 0;
} else {
    _needExp = _vseZvaniya # (_indexLevel - 1) # 2;
};

_player setVariable ["LEVEL",_newLevel,true];
[_uid,"level",_newLevel] remoteExecCall ["bt_db_fnc_changePlayer",2];
_player setVariable ["EXP",_needExp,true];
[_uid,"exp",_needExp] remoteExecCall ["bt_db_fnc_changePlayer",2];

[_namegiver,_uidgiver,_nametaker,_uid,"level",_newlevel] remoteExecCall ["bt_db_fnc_insertDopusklog",2];

_ctrlList lbSetCurSel _index;
