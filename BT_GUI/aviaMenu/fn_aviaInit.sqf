private _isAdmin = player getVariable ["AVIA",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к панели Авиа-инструктора";
};

createDialog "bt_avia_menu";

waitUntil {!(isNull (findDisplay 51000))};

private _display = findDisplay 51000;

private _ctrlCombo = _display displayCtrl 51003;
private _ctrlList = _display displayCtrl 51004;

private _index = 0;

private _comboText = ["Онлайн","Т Вертолеты","Т Самолеты","Б Вертолеты","Б самолеты","ШТОРМ"];

for "_c" from 0 to ((count _comboText) - 1) do {
    _index = _ctrlCombo lbAdd (_comboText # _c);
};

_ctrlCombo lbSetCurSel 0;
