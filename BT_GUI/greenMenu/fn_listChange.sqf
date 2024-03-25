private _display = findDisplay 53000;
private _ctrlGreen = _display displayCtrl 53006;

private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _green = _player getVariable ["GREEN",0];

if (_green == 0) then {
    _ctrlGreen cbSetChecked false;
} else {
    _ctrlGreen cbSetChecked true;
};
