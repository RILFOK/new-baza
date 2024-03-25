waitUntil {
    uiSleep 0.3;
    missionNamespace getVariable ["UTF_DBCONNECTED",false];
};

//HAron
player remoteExecCall ["bt_db_fnc_selectPlayer",2];
player remoteExecCall ["bt_db_fnc_selectMedalsP",2];

private _playerData = [];

while {(count _playerData) == 0} do {
    uiSleep 0.5;
    _playerData = player getVariable ["PLAYERDATA",[]];
};



//Haron 

_playerData params [
    "_uid",
    "_name",
    "_anotherNameString",
    "_level",
    "_exp",
    "_green",
    "_kmb",
    "_avia_t_h",
    "_avia_t_p",
    "_avia_b_h",
    "_avia_b_p",
    "_avia_b_storm",
    "_tank_1",
    "_tank_2",
    "_tank_3",
    "_tank_4",
    "_kick",
    "_avia",
    "_tank",
    "_green_a",
    "_level_a",
    "_admin"
];
if (side player == east) then {
    player setVariable ["ANOTHERNAME",_anotherNameString,true];
    player setVariable ["LEVEL",_level,true];
    player setVariable ["EXP",_exp,true];
    player setVariable ["KMB",_kmb,true];
    player setVariable ["AVIA_T_H",_avia_t_h,true];
    player setVariable ["AVIA_T_P",_avia_t_p,true];
    player setVariable ["AVIA_B_H",_avia_b_h,true];
    player setVariable ["AVIA_B_P",_avia_b_p,true];
    player setVariable ["AVIA_B_STORM",_avia_b_storm,true];
    player setVariable ["TANK_1",_tank_1,true];
    player setVariable ["TANK_2",_tank_2,true];
    player setVariable ["TANK_3",_tank_3,true];
    player setVariable ["TANK_4",_tank_4,true];
    player setVariable ["KICK",_kick,true];
    player setVariable ["AVIA",_avia,true];
    player setVariable ["TANK",_tank,true];
    player setVariable ["GREEN_A",_green_a,true];
    player setVariable ["LEVEL_A",_level_a,true];
    player setVariable ["ADMIN",_admin];
};

player setVariable ["GREEN",_green,true];

