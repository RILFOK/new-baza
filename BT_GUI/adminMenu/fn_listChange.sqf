private _display = findDisplay 57000;
private _ctrlKick = _display displayCtrl 57006;
private _ctrlLevel = _display displayCtrl 57008;
private _ctrlAvia = _display displayCtrl 57010;
private _ctrlTank = _display displayCtrl 57012;
private _ctrlGreen = _display displayCtrl 57014;
private _ctrlKMB = _display displayCtrl 57016;

private _ctrlCheckArray = [_ctrlKick,_ctrlLevel,_ctrlAvia,_ctrlTank,_ctrlGreen,_ctrlKMB];

private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _kick = _player getVariable ["KICK",0];
private _level = _player getVariable ["LEVEL_A",0];
private _avia = _player getVariable ["AVIA",0];
private _tank = _player getVariable ["TANK",0];
private _green = _player getVariable ["GREEN_A",0];
private _kmb = _player getVariable ["KMB",0];

private _actualData = [_kick,_level,_avia,_tank,_green,_kmb];

private _data = 0;
{
    _data = _actualData # _forEachIndex;
    if (_data == 0) then {
        _x cbSetChecked false;
    } else {
        _x cbSetChecked true;
    };
} forEach _ctrlCheckArray;
