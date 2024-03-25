private _display = findDisplay 54000;
private _ctrlZvanie = _display displayCtrl 54005;
private _ctrlExp = _display displayCtrl 54006;
private _ctrlCombo = _display displayCtrl 54011;

private _ctrlList = _this # 0;
private _index = _this # 1;
private _uid = _ctrlList lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;

private _level = _player getVariable ["LEVEL",1];
private _zvanie = _level call bt_fnc_getZvanie;
private _exp = _player getVariable ["EXP",0];
private _expNeed = [_level,_exp] call bt_fnc_getExpNeed;
private _nextExpNeed = (_expNeed # 1) - (_expNeed # 0);
private _percent = _nextExpNeed / 100;
private _expNow = (_expNeed # 1) - _exp;
private _percents = 100 - (_expNow / _percent);

_ctrlZvanie ctrlSetText format["Звание - %1",_zvanie];
_ctrlExp ctrlSetText format["Прогресс - %1%2",floor _percents,"%"];

private _vseZvaniya = missionNamespace getVariable ["LEVELS",[]];

lbClear _ctrlCombo;
{
    _ctrlCombo lbAdd (_x # 1);
} forEach _vseZvaniya;
