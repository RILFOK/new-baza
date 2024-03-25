private _display = findDisplay 33300;
private _list = _display displayCtrl 33304;
private _index = lbCurSel _list;
private _uid = _list lbData _index;
private _player = _uid call BIS_fnc_getUnitByUid;


if !(isPlayer _player) exitwith {hint "Выберите игрока!"};
closeDialog 33300;
[_player,_uid] spawn bt_medalPlayer_fnc_medalInit1;