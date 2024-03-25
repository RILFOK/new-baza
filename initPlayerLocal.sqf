if (!hasInterface) exitwith {};

[] spawn {_this call compile preProcessFileLineNumbers"s_player\init.sqf";};
//======================================================================================
//======================================================================================

player setVariable ["SaveInventory",false]; 
if (side player == east) then {
    [player] call srv_fnc_variableDefaultLoadOut;
} else {
    [player] call srv_fnc_variableDefaultLoadOutrp;
};

//------------------------------------------------------------------------------------------------------------

[] call srv_fnc_diary;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//FPS
//================================
null = [] spawn Srv_fnc_init_fps;
//================================



if(isNil {Gamer getVariable format ["ArrayactAllremovalVeh_%1",getPlayerUID player]}) then {
 Gamer SetVariable [format ["ArrayactAllremovalVeh_%1",getPlayerUID player],[],true];
};


waitUntil {!isNull player};
sleep 5;

[] spawn srv_fnc_NewTask;

player addEventHandler ["GetInMan", {[_this select 2] execVM "s_player\kp_fuel_consumption.sqf";}];
if (side player == east) then {
    player addeventhandler ["respawn",{_this spawn srv_fnc_respawn}];
} else {
    player addeventhandler ["respawn",{_this spawn srv_fnc_respawnrp}];
};

player addEventHandler ["Fired", {
    if (_this select 4 == "DemoCharge_Remote_Ammo") then {
        [_this select 0] call C4_Attach;
    };
}];

[missionNamespace, "arsenalClosed", {    
    /*
    {
        _x removeAction (_x getVariable ['bis_fnc_arsenal_action', -1]);
    } forEach [arsenal1, arsenal2, box_arsenal_1, box_arsenal_2, box_arsenal_3];
    */
    ["AmmoboxExit", player] call TB_fnc_arsenal; 
	[player] spawn TB_fnc_applyRestrictions;
    player removeAction (player getVariable ['bis_fnc_arsenal_action', -1]);
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    _display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [19,24,29,31,46,47]) then {true}"];
    {
        ( _display displayCtrl _x ) ctrlSetText "";
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
    } forEach [44150, 44148, 44149];
    /*
    {
        _x removeAction (_x getVariable ['bis_fnc_arsenal_action', -1]);
    } forEach [arsenal1, arsenal2, box_arsenal_1, box_arsenal_2, box_arsenal_3];
    */
}] call BIS_fnc_addScriptedEventHandler;

private _earplugsctrl = (findDisplay 46) ctrlCreate ["RscText", 9001];
_earplugsctrl ctrlSetPosition [SafeZoneXAbs, SafeZoneY + (SafeZoneH - 0.05) / 2, 0.2, 0.03];
_earplugsctrl ctrlSetFontHeight 0.03;
_earplugsctrl ctrlSetText "БЕРУШИ АКТИВИРОВАНЫ";
_earplugsctrl ctrlShow false;
_earplugsctrl ctrlCommit 0;
player setVariable ["EARS_text", _earplugsctrl];