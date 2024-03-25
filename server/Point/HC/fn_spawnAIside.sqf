//Спавн спн
//-------------------------------------------------------------------------------------------------------


params ["_spawnpos"];
private ["_arrayrecon","_gr","_SpawnPosGrp","_SpawnPosVeht","_veht","_unit","_typeveh","_random_count","_list_dynsim"];

//список групп для включения динамической симуляции.
_list_dynsim = [];

//спавн техники

_gr = createGroup west;
_typeveh = selectRandom (missionNameSpace getvariable ["_Side_Tank",objNull]);

_SpawnPosVeht = [_spawnpos,2,50,4,0,60 * (pi / 180),0] call srv_fnc_findSafePos;

_veht = [_gr,_SpawnPosVeht,_typeveh, 0] call srv_fnc_createenemyvehicle; 
_veht limitSpeed 10;
[_gr,_SpawnPosVeht,_spawnpos,0,20,[-1,-1,-1,0,false],"path for tank",135] spawn srv_fnc_InfantryTasckPatrol;

sleep 2;

//спавн техники

_gr = createGroup west;
_typeveh = selectRandom (missionNameSpace getvariable ["_Side_light",objNull]);

_SpawnPosVeht = [_spawnpos,2,50,4,0,60 * (pi / 180),0] call srv_fnc_findSafePos;

_veht = [_gr,_SpawnPosVeht,_typeveh, 0] call srv_fnc_createenemyvehicle; 
_veht limitSpeed 10;
[_gr,_SpawnPosVeht,_spawnpos,0,20,[-1,-1,-1,0,false],"path for tank",135] spawn srv_fnc_InfantryTasckPatrol;

sleep 2;


//Спавн спн

_arrayrecon =  missionNamespace getvariable ["_trigger_hn_spn1",[]];

_random_count = [3, 5] call BIS_fnc_randomInt;

for "_gr" from 1 to _random_count do  {
    _grp  = creategroup west;

    _SpawnPosGrp = [_spawnpos, 1,200, 2, 0,60 * (pi / 180),0] call srv_fnc_findSafePos;
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

    [_grp,_SpawnPosGrp,_spawnpos,0,150,[-1,-1,-1,0,false],"path for group soldiers",185] spawn srv_fnc_InfantryTasckPatrol;

	//дин симуляция
    _list_dynsim pushBack _grp;

	sleep 0.1;
};


sleep 5;
//дин симуляция
{[_x,true] remoteexec ["enableDynamicSimulation",2]}foreach _list_dynsim;