private _display = findDisplay 59000;
private _ctrlList2 = _display displayCtrl 59005;

private _index2 = lbCurSel _ctrlList2;
private _uid = _ctrlList2 lbData _index2;
private _player = _uid call BIS_fnc_getUnitByUid;

if ((_player getVariable ["LEVEL",2]) != 1) exitWith {hint "Этот боец не является новобранцем"};

_player setVariable ["LEVEL",2,true];
[getPlayerUID _player,"level",2] remoteExecCall ["bt_db_fnc_changePlayer",2];

[name player,getPlayerUID player,name _player,getPlayerUID _player] remoteExecCall ["bt_db_fnc_insertKMB",2];