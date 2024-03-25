private _display = findDisplay 52000;
private _ctrl1= _display displayCtrl 52006;
private _ctrl2 = _display displayCtrl 52008;
private _ctrl3 = _display displayCtrl 52010;
private _ctrl4 = _display displayCtrl 52012;

private _ctrlCheckArray = [_ctrl1,_ctrl2,_ctrl3,_ctrl4];

private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _tank_1 = _player getVariable ["TANK_1",0];
private _tank_2 = _player getVariable ["TANK_2",0];
private _tank_3 = _player getVariable ["TANK_3",0];
private _tank_4 = _player getVariable ["TANK_4",0];

private _actualData = [_tank_1,_tank_2,_tank_3,_tank_4];

private _data = 0;
{
    _data = _actualData # _forEachIndex;
    if (_data == 0) then {
        _x cbSetChecked false;
    } else {
        _x cbSetChecked true;
    };
} forEach _ctrlCheckArray;
