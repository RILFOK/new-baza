//if(!isServer) exitWith {};
params ["_grp","_ptrpos","_arraypos"];
_arraypos params ["_ptrpos0","_ptrpos1","_ptrpos2","_ptrpos3","_ptrpos4","_ptrpos5","_ptrpos6","_ptrpos7",
                "_ptrpos8","_ptrpos9","_ptrpos10","_ptrpos11"];

private _pt1 = [];
private _pt2 = [];
private _nextpos1 = [];
private _nextpos2 = [];


private _id = _arraypos find _ptrpos;
private _ind2 = 20;


if (_id == 0) then {
    _ind2 = (count _arraypos) - 1;
} else {
    _ind2 = _id - 1;
};


if ( _id < ((count _arraypos) - 1)) then {
    _id = _id + 1;

} else {
    _id = 0;
};



_pt1 = _arraypos select _id;
_pt2 = _arraypos select _ind2;

if!(_pt1 isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []) then {
    _nextpos1 = _pt1;
} else {
    _nextpos1  = [_ptrpos,_pt1] call srv_fnc_nearshore;
};

if!(_pt2 isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []) then {
    _nextpos2 = _pt2;
} else {
    _nextpos2 = [_ptrpos,_pt2] call srv_fnc_nearshore;
};

private _leader = leader _grp;
_leader setVariable ["data",[_ptrpos,_nextpos1,_nextpos2]];

[_grp,_ptrpos,20,"MOVE","STEALTH","RED","LIMITED",20,"this spawn srv_fnc_rptr"] call srv_fnc_addWaypoint;
