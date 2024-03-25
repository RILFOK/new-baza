//Спавн спн
//-------------------------------------------------------------------------------------------------------


params ["_spawnpos"];
private ["_arrayrecon","_gr","_SpawnPosGrp","_unit","_list_dynsim"];

//список групп для включения динамической симуляции.
_list_dynsim = [];

_arrayrecon =  missionNamespace getvariable ["_trigger_hn_spn1",[]];

for "_gr" from 1 to 2 do  {
    _grp  = creategroup west;

    _SpawnPosGrp = [_spawnpos, 1,60, 2, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
    {
	    _unit = [_grp,_SpawnPosGrp,_x,50] call srv_fnc_createenemyunit;
	    _unit setVariable ["srv_cme",true];
	    [_unit] join _grp;
        _unit addEventHandler ["Killed", {
	        params ["_unit", "_killer", "_instigator", "_useEffects"];
	        // [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
			["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
        }];

        sleep 1;

    }forEach _arrayrecon;
	
	_grp setCombatMode "RED";
	_grp setBehaviour "STEALTH";
	_grp setSpeedMode "LIMITED";

    [_grp,_SpawnPosGrp,_spawnpos,0,-1,[-1,-1,-1,0,false],"path for group soldiers",70] spawn srv_fnc_InfantryTasckPatrol;

	//дин симуляция
    _list_dynsim pushBack _grp;

	sleep 0.1;
};

sleep 5;
//дин симуляция
{[_x,true] remoteexec ["enableDynamicSimulation",2]}foreach _list_dynsim;
