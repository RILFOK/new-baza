/*private _display = findDisplay 58000;
private _ctrlList = _display displayCtrl 58004;


private _index = _this # 1;

lbClear _ctrlList;
private _players = [];

switch (_index) do {
    case 0: {
        {
            uiSleep 0.2;
            _index = _ctrlList lbAdd (name _x);
            _ctrlList lbSetData [_forEachIndex,getPlayerUID _x];
        } forEach allPlayers;
    };
};*/