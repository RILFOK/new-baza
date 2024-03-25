createDialog "bt_anim_menu";

waitUntil {!(isNull (findDisplay 58000))};

player setVariable ["animMenuOpen",true];

private _display = findDisplay 58000;
private _ctrlList = _display displayCtrl 58004;




_anim_list = [] call compile preprocessFileLineNumbers "BT_GUI\animMenu\animList.sqf";

lbClear _ctrlList;

private _index = 0;

{
    _index = _ctrlList lbAdd (_x select 1);
    _ctrlList lbSetData [_forEachindex, _x select 0];
} forEach _anim_list;



/*
private _display = findDisplay 51000;

private _ctrlCombo = _display displayCtrl 58003;
private _ctrlList = _display displayCtrl 58004;

/
private _index = 0;

_ctrlCombo lbSetCurSel 0;
*/