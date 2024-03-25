private _display = findDisplay 51000;
private _ctrlList = _display displayCtrl 51004;
private _ctrlKick = _display displayCtrl 51006;
private _ctrlLevel = _display displayCtrl 51008;
private _ctrlAvia = _display displayCtrl 51010;
private _ctrlTank = _display displayCtrl 51012;
private _ctrlGreen = _display displayCtrl 51014;

{
    _x cbSetChecked false;
} forEach [_ctrlLevel,_ctrlKick,_ctrlAvia,_ctrlTank,_ctrlGreen];

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

private _index = _this # 1;

lbClear _ctrlList;
private _pilots = [];

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
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["AVIA_T_H",0])>0});
    };
    case 2: {
        {
           // uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["AVIA_T_P",0])>0});
    };
    case 3: {
        {
           // uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["AVIA_B_H",0])>0});
    };
    case 4: {
        {
          //  uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["AVIA_B_P",0])>0});
    };
    case 5: {
        {
           // uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach (_humanPlayers select {(_x getVariable ["AVIA_B_STORM",0])>0});
    };
};