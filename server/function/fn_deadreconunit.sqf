if(!isServer) exitWith {};

private ["_unit","_deadunit","_recongrouparry","_RTST","_found"];

_unit = _this select 0;

_recongrouparry = missionNameSpace getVariable ["recongrouparry",[]];
_RTST = missionNameSpace getVariable "RTST";

_found = _recongrouparry find _unit;

if (_found == -1) exitwith {};


_recongrouparry deleteAt (_recongrouparry find _unit);

missionNameSpace setVariable ["recongrouparry",_recongrouparry,true];

if(((count _recongrouparry) < 7) && {_RTST != 0}) then {

    //отправить последние группы в центр, если они не идут.
    private ["_Point","_posPoint","_gr","_wp"];
    _Point = (Gamer getVariable "datapoint") param [0];
    _posPoint = getmarkerpos _Point;
    {
        _gr = group _x;

        if (waypointname ((waypoints _gr) select 1) isEqualTo "GOTODEFENCE") then {CONTINUE};

        for "_i" from 0 to (count waypoints _gr - 1) do  { 
            deleteWaypoint [_gr, 0]; 
        };

        _gr setBehaviour "COMBAT";
        _gr setSpeedMode "FULL";
        
        _wp = _gr addWaypoint [_posPoint,150,1,"GOTODEFENCE"];
        _wp setWaypointType "MOVE"; 
        _wp setWaypointFormation "LINE"; 
        _wp setWaypointCompletionRadius 50; 
        _wp setWaypointStatements ["true", "null = [this] spawn srv_fnc_ReinforcePatrol"];

    }forEach (missionNameSpace getVariable ["recongrouparry",[]]);

    //Заспавнить новые группы
    missionNameSpace setVariable ["recongrouparry",[],true];

    private _posPoint = getMarkerPos ((Gamer getVariable "datapoint") param [0]);
    private _arrayrecon = missionNameSpace getVariable "arrayrecon";
    sleep 30;

    missionNameSpace setVariable ["spawnrecongroup",true,true];
    sleep 30;
    [_posPoint,_arrayrecon] call srv_fnc_spawnrecongroup;
};