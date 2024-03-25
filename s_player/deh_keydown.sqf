private _key = _this # 1;
private _keys = [59,60,61,62,5,25,63];
private _ctrl = _this # 3;

private _return = false;

if (!(_key in _keys) && !(_key in (actionKeys "TacticalView")) && !(_key in (ActionKeys "PersonView"))) exitWith {_return};

_return = true;

switch (_key) do {

    //F1
    case 59: {
        [] spawn fnc_sepa;
    };

    //F2
    case 60: {
        player action ["SWITCHWEAPON",player,player,-1];
    };

    //F3
    case 61: {
        if (player getVariable ["circleMenuOpen",false]) exitWith {_return};
        [] spawn bt_gui_fnc_circleMenuOpen;
    };

    // F4
    case 62: {
        if ((vehicle player) != player) exitWith {_return};
        if (side player == west) exitWith {_return};
        if (player getVariable ["isDrag",false]) exitWith {_return};
        if (player getVariable ["animMenuOpen",false]) exitWith {_return};
        [] spawn bt_anim_fnc_animInit; 
        //[] spawn bt_gui_fnc_circleMenuOpen;
    };

    //Hotkey CTRL + 4
    case 5: {
        if (_ctrl) then {
            private _timenow = time;
            if ((player getvariable ["metka_hn_time",0]) < _timenow ) then {
                private _text = format ["_USER_DEFINED_%1", getPosATL player];
                private _marker = createMarker [_text, getPosATL player, 1, player];
                _marker setMarkerType "hd_dot";
                _marker setMarkerColor "ColorBlack";
                playSound "Click";
                player setvariable ["metka_hn_time",_timenow + 10];
            };
        } else {
            _return = FALSE;
        };
    };

    // Hotkey P
    case 25: {
        private _icon_hn_3d = player getvariable ["_icon_hn_3d",FALSE];

        if !(_icon_hn_3d isEqualTo FALSE) then {            
            removeMissionEventHandler ["Draw3D", _icon_hn_3d];
            player setvariable ["_icon_hn_3d",FALSE];
            systemchat "Иконки выключены";
        } else {
            [] spawn {_this call compile preProcessFileLineNumbers "s_player\icons3d.sqf";};
            systemchat "Иконки включены";
        };

    };

    // Ачивки
    case 63: {
        if (player getVariable ["medalMenuOpen",false]) exitWith {_return};
        [] spawn bt_medal_fnc_medalInit;
    };
    
};

if ((_key in (actionKeys "PersonView")) && (playerSide != west)) then {_return = false;};   

_return