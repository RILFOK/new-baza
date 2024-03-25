private _display = findDisplay 54000;
private _ctrlList = _display displayCtrl 54004;

private _index = _this # 1;

lbClear _ctrlList;

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

switch (_index) do {
    case 0: {
        {
           // uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach _humanPlayers;
    };
    case 1: {
        {
           // uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["LEVEL",1])>8});

    };
};