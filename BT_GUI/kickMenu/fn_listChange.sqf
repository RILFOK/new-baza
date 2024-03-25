private _display = findDisplay 55000;
private _ctrlZvanie = _display displayCtrl 55005;
private _ctrlExp = _display displayCtrl 55006;
private _ctrlCombo = _display displayCtrl 55010;


private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;


