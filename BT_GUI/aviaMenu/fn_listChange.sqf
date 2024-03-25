private _display = findDisplay 51000;
private _ctrlTH = _display displayCtrl 51006;
private _ctrlTP = _display displayCtrl 51008;
private _ctrlBH = _display displayCtrl 51010;
private _ctrlBP = _display displayCtrl 51012;
private _ctrlBStorm = _display displayCtrl 51014;

private _ctrlCheckArray = [_ctrlTH,_ctrlTP,_ctrlBH,_ctrlBP,_ctrlBStorm];

private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _avia_t_h = _player getVariable ["AVIA_T_H",0];
private _avia_t_p = _player getVariable ["AVIA_T_P",0];
private _avia_b_h = _player getVariable ["AVIA_B_H",0];
private _avia_b_p = _player getVariable ["AVIA_B_P",0];
private _avia_b_storm = _player getVariable ["AVIA_B_STORM",0];

private _actualData = [_avia_t_h,_avia_t_p,_avia_b_h,_avia_b_p,_avia_b_storm];

private _data = 0;
{
    _data = _actualData # _forEachIndex;
    if (_data == 0) then {
        _x cbSetChecked false;
    } else {
        _x cbSetChecked true;
    };
} forEach _ctrlCheckArray;
