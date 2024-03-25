/*disableSerialization;

_unit = player;
_pUID = getPlayerUID _unit;
_name = name _unit;

("bt_progressBar" call BIS_fnc_rscLayer) cutRsc ["bt_progressBar","PLAIN"];
_display = uiNamespace getVariable ["progressBar",displayNull];

private _level = player getVariable ["LEVEL",1];
private _exp = player getVariable ["EXP",0];
private _green = player getVariable ["GREEN",0];
private _avia_trans = player getVariable ["AVIA_TRANS",0];
private _avia_boev = player getVariable ["AVIA_BOEV",0];
private _tank_light = player getVariable ["TANK_LIGHT",0];
private _tank_heavy = player getVariable ["TANK_HEAVY",0];

private _zvanie = _level call bt_fnc_getZvanie;
private _expNeed = [0,0];
private _percents = 0;

if (_level != 0) then {
    private _expNeed = [_level,_exp] call bt_fnc_getExpNeed;
    private _percents = ((_expNeed # 0) / ((_expNeed # 1) / 100));
};

_ctrlGroup = _display displayCtrl 11002;
_ctrlName = _display displayCtrl 11003;
_ctrlZvanie = _display displayCtrl 11004;
_ctrlAvia_t = _display displayCtrl 11005;
_ctrlAvia_b = _display displayCtrl 11006;
_ctrlTank_l = _display displayCtrl 11007;
_ctrlTank_b = _display displayCtrl 11008;
_progbar = _display displayCtrl 11009;

_ctrlName ctrlSetText format["Имя - %1",_name];

while {!(isNull _display)} do {
    uiSleep 0.2;
    if (visibleMap) then {
        _ctrlGroup ctrlShow true;

        _level = player getVariable ["LEVEL",1];
        _exp = player getVariable ["EXP",0];
        _green = player getVariable ["GREEN",0];
        _avia_trans = player getVariable ["AVIA_TRANS",0];
        _avia_boev = player getVariable ["AVIA_BOEV",0];
        _tank_light = player getVariable ["TANK_LIGHT",0];
        _tank_heavy = player getVariable ["TANK_HEAVY",0];

        _zvanie = _level call bt_fnc_getZvanie;
        _expNeed = [0,0];
        _percents = 0;

        if (_level != 0) then {
            _expNeed = [_level,_exp] call bt_fnc_getExpNeed;
            _percents = ((_expNeed # 0) / ((_expNeed # 1) / 100));
        };

        _ctrlName ctrlSetText format["Имя - %1",_name];
        _ctrlZvanie ctrlSetText format["Звание - %1",_zvanie];
        _ctrlAvia_t ctrlSetText format["Авиа Т. - %1",_avia_trans];
        _ctrlAvia_b ctrlSetText format["Авиа Б. - %1",_avia_boev];
        _ctrlTank_l ctrlSetText format["Танк Л. - %1",_tank_light];
        _ctrlTank_b ctrlSetText format["Танк Т. - %1",_tank_heavy];
        _progbar progressSetPosition (_percents / 100 + 0.5);
    } else {
        _ctrlGroup ctrlShow false;
    };
};
