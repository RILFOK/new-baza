private _key = _this # 1;
private _keys = 61;
private _return = false;

if (_key != _keys) exitWith {_return};

closeDialog 56000;
player setVariable ["circleMenuOpen",false];

if ((player getVariable ["keyUp","NULL"]) == "NULL") exitWith {_return};

_return = true;

closeDialog 56000;

switch (player getVariable ["keyUp","NULL"]) do {
    case "ADMIN": {
        [] spawn bt_admin_fnc_adminInit;
    };
    case "KICK": {
        [] spawn bt_kick_fnc_kickInit;
    };
    case "VIEW": {
        [] spawn TAWVD_fnc_openMenu;
    };
    case "BERUSHI": {
        [] spawn fnc_sepa;
    };
    case "WFROMBACK": {
        player action ["SWITCHWEAPON",player,player,-1];
    };
    case "GREEN_A": {
        [] spawn bt_green_fnc_greenInit;
    };
    case "LEVEL_A": {
        [] spawn bt_level_fnc_levelInit;
    };
    case "AVIA": {
        [] spawn bt_avia_fnc_aviaInit;
    };
    case "TANK": {
        [] spawn bt_tank_fnc_tankInit;
    };
    case "KMBMENU": {
        [] spawn bt_kmenu_fnc_kmbMenuInit;
    };
    /*
    case "KMB": {
        [] spawn {
            private _kmb = cursorObject;
            if (!(isPlayer _kmb) || (_kmb != (vehicle _kmb))) exitWith {};
            if ((_kmb getVariable ["LEVEL",2]) != 1) exitWith {hint "Этот боец не является новобранцем"};

            _kmb setVariable ["LEVEL",2,true];
            [getPlayerUID _kmb,"level",2] remoteExecCall ["bt_db_fnc_changePlayer",2];

            [name player,getPlayerUID player,name _kmb,getPlayerUID _kmb] remoteExecCall ["bt_db_fnc_insertKMB",2];
        };
    };
    */
};

_return
