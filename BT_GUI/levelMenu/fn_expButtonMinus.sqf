private _display = findDisplay 54000;
private _percentAddStringCtrl = _display displayCtrl 54008;
private _list = _display displayCtrl 54004;
private _index = lbCurSel _list;
private _uid = _list lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;
private _percentAddString = ctrlText _percentAddStringCtrl;
private _uidgiver = getPlayerUID player;
private _namegiver = name player;
private _nametaker = name _player;

if ((count _percentAddString) < 1) exitWith {
    hint "Вы не заполнили количество процентов!";
};

private _isNotNumber = _percentAddString call {
    private _string = _this;
    private _return = false;
    private _numbers = ["0","1","2","3","4","5","6","7","8","9"];
    private _stringArray = _string splitString "";
    {
        if !(_x in _numbers) exitWith {
            _return = true;
        };
    } forEach _stringArray;

    _return
};
if (_isNotNumber) exitWith {
    hint "Поле содержит недопустимые символы!";
};

private _percentAdd = call compile _percentAddString;
private _level = _player getVariable ["LEVEL",1];
private _exp = _player getVariable ["EXP",0];
private _expNeed = [_level,_exp] call bt_fnc_getExpNeed;
private _expNull = _expNeed # 0;
private _expFull = _expNeed # 1;
private _percent = (_expFull - _expNull) / 100;
private _newExp = _exp - (_percent * _percentAdd);

if (_newExp < _expNull) exitWith {
    hint "Вы пытаетесь убавить процентов больше возможного!";
};

_player setVariable ["EXP",_newExp,true];

//Тест
[_uid,"exp",_newExp] remoteExecCall ["bt_db_fnc_changePlayer",2];
[_namegiver,_uidgiver,_nametaker,_uid,"EXP", -_percentAdd] remoteExecCall ["bt_db_fnc_insertDopusklog",2];

_list lbSetCurSel _index;
