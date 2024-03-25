createDialog "bt_medal_menu";

waitUntil {!(isNull (findDisplay 33300))};

player setVariable ["medalMenuOpen",true];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

private _display = findDisplay 33300;
private _ctrlList = _display displayCtrl 33304;

{
   // uiSleep 0.2;
    _index = _ctrlList lbAdd (name _x);
    _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
} forEach _humanPlayers;
