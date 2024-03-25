private _display = findDisplay 53000;
private _ctrlList = _display displayCtrl 53004;
private _ctrlKick = _display displayCtrl 53006;
private _ctrlLevel = _display displayCtrl 53008;
private _ctrlAvia = _display displayCtrl 53010;
private _ctrlTank = _display displayCtrl 53012;
private _ctrlGreen = _display displayCtrl 53014;
private _pilots = [];
{
    _x cbSetChecked false;
} forEach [_ctrlLevel,_ctrlKick,_ctrlAvia,_ctrlTank,_ctrlGreen];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

private _index = _this # 1;

lbClear _ctrlList;

switch (_index) do {
    case 0: {
        {
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach _humanPlayers;
    };
    case 1: {
        {
         //   uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["GREEN",0])>0});

    };
};