private _display = findDisplay 52000;
private _ctrlList = _display displayCtrl 52004;
private _ctrlKick = _display displayCtrl 52006;
private _ctrlLevel = _display displayCtrl 52008;
private _ctrlAvia = _display displayCtrl 52010;
private _ctrlTank = _display displayCtrl 52012;
private _ctrlGreen = _display displayCtrl 52014;
private _pilots = [];

{
    _x cbSetChecked false;
} forEach [_ctrlLevel,_ctrlKick,_ctrlAvia,_ctrlTank,_ctrlGreen];

private _index = _this # 1;

lbClear _ctrlList;

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

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
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["TANK_1",0])>0});
    };
    case 2: {
        {
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["TANK_2",0])>0});
    };
    case 3: {
        {
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["TANK_3",0])>0});
    };
    case 4: {
        {
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["TANK_4",0])>0});
    };
};