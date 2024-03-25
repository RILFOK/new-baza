private _isAdmin = player getVariable ["KICK",0];;

if (_isAdmin == 0) exitWith {
    hint "У вас нет доступа к Кик-панели";
};

createDialog "bt_kick_menu";

waitUntil {!(isNull (findDisplay 55000))};

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

private _display = findDisplay 55000;
private _ctrlList = _display displayCtrl 55004;

{
   // uiSleep 0.2;
    _index = _ctrlList lbAdd (name _x);
    _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
} forEach _humanPlayers;
