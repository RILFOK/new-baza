private _isAdmin = player getVariable ["LEVEL_A",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к панели Званий";
};

createDialog "bt_level_menu";

waitUntil {!(isNull (findDisplay 54000))};

private _display = findDisplay 54000;

private _ctrlCombo = _display displayCtrl 54003;
private _ctrlList = _display displayCtrl 54004;

private _index = 0;

private _comboText = [
    "Онлайн",
    "Офицеры"
];

for "_c" from 0 to ((count _comboText) - 1) do {
    _index = _ctrlCombo lbAdd (_comboText # _c);
};

_ctrlCombo lbSetCurSel 0;
