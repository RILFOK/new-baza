createDialog "bt_kmb_menu";

waitUntil {!(isNull (findDisplay 59000))};



private _display = findDisplay 59000;
private _ctrlList2 = _display displayCtrl 59005;
(_display displayCtrl 59006) ctrlShow false;


// ctrlDelete ((findDisplay 59000) displayCtrl 59005);
/*
private _ctrlList = _display displayCtrl 59004;
lbClear _ctrlList;

private _index = 0;
{
    uiSleep 0.2;
    _index = _ctrlList lbAdd (name _x);
    _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
}  forEach (allPlayers select {(_x getVariable ["KMB",0]) > 0});
*/
if (player getVariable ["KMB",0] > 0) then {
    (_display displayCtrl 59006) ctrlShow true;
};

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

private _index2 = 0;
lbClear _ctrlList2;
{
    //uiSleep 0.2;
    _index2 = _ctrlList2 lbAdd (name _x);
    _ctrlList2 lbSetData [_forEachIndex,getPlayerUID _x];
}  forEach (_humanPlayers select {(_x getVariable ["LEVEL",0]) == 1});

/*
private _display = findDisplay 51000;

private _ctrlCombo = _display displayCtrl 58003;
private _ctrlList = _display displayCtrl 58004;

/
private _index = 0;

_ctrlCombo lbSetCurSel 0;
*/