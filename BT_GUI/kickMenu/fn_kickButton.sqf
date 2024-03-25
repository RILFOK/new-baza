private _display = findDisplay 55000;
private _list = _display displayCtrl 55004;
private _textCtrl = _display displayCtrl 55015;
private _check_1 = _display displayCtrl 55006;
private _check_2 = _display displayCtrl 55008;
private _check_3 = _display displayCtrl 55010;
private _check_4 = _display displayCtrl 55012;
private _check_5 = _display displayCtrl 55014;
private _check_6 = _display displayCtrl 55016;
private _text_7 = _display displayCtrl 55019;
private _textBox = ctrlText _text_7;
private _checks = [[_check_1,"Тимкилл"],[_check_2,"Правила построения"],[_check_3,"Не выход на связь"],[_check_4,"Плохой Никнейм"],[_check_5,"Возрождение"],[_check_6,"АФК"]];
private _checked = _checks select {cbChecked (_x # 0)};
private _index = lbCurSel _list;
private _uid = _list lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;
private _nameKick = name _player;
private _nameKicker = name player;
private _uidKicker = getplayeruid player;
private _reason = "";
private _text = "";
private _ctrlIDC = 0;
private _ctrlTextIDC = 0;
private _ctrl = controlNull;

{
    _reason = _reason + (_x # 1) + "; ";
} forEach _checked;
_reason = _reason + _textBox;

if ((count _reason) < 6) exitWith {
    hint "Укажите причину кика!";
};

[
    _uid,
    {
        private _uid = _this;
        "1233123" serverCommand format ["#kick %1",_uid];
    }
] remoteExec ["bis_fnc_call", 2];

[_nameKicker,_nameKick,_reason] remoteExecCall ["bt_db_fnc_insertKick",2];

[_nameKicker,_uidKicker,_nameKick,_uid,"kicked",_reason] remoteExecCall ["bt_db_fnc_insertDopusklog",2];