private _display = findDisplay 33300;
private _ctrlList = _display displayCtrl 33304;
private _index = lbCurSel _ctrlList;
private _valueData = (_this # 1) - 1;
private _value = _this # 0 # 1;

private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _playerData = player getVariable ["PLAYERDATA",[0,0,0,0,0]];

_playerData set [_valueData,_value];

//_value remoteExec To BD
