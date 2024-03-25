private _isAdmin = player getVariable ["ADMIN",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к панели Администратора";
};

createDialog "bt_admin_menu";

waitUntil {!(isNull (findDisplay 57000))};

private _display = findDisplay 57000;

private _ctrlCombo = _display displayCtrl 57003;
private _ctrlList = _display displayCtrl 57004;

private _index = 0;

private _comboText = ["Онлайн","Кик-панель","Звания","Авиация","Танкисты","Зелень","КМБ-панель"];

for "_c" from 0 to ((count _comboText) - 1) do {
    _index = _ctrlCombo lbAdd (_comboText # _c);
};

_ctrlCombo lbSetCurSel 0;
