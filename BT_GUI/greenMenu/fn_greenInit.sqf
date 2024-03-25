private _isAdmin = player getVariable ["GREEN_A",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к панели Командира зеленой стороны";
};

createDialog "bt_green_menu";

waitUntil {!(isNull (findDisplay 53000))};

private _display = findDisplay 53000;

private _ctrlCombo = _display displayCtrl 53003;
private _ctrlList = _display displayCtrl 53004;

private _index = 0;

private _comboText = ["Онлайн","Зеленые"];

for "_c" from 0 to ((count _comboText) - 1) do {
    _index = _ctrlCombo lbAdd (_comboText # _c);
};

_ctrlCombo lbSetCurSel 0;
