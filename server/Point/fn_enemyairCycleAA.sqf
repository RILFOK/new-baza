// спавн истребители в 	зависимости от типа поднятого в небо самолета ЦУП

if (!isServer) exitWith {};


params ["_enemyAA_mode4","_enemyAA_mode5"];
private ["_marker","_markpos","_dir","_h","_ps","_spwndir","_type","_count","_count_friend"];

if !(missionNameSpace getvariable ["_enemy_aircycle_AA",true]) exitwith {};

if (missionNameSpace getvariable ["_enemy_aircycle_AA_pause",false]) exitwith {};

//количество истребителей в воздухе за раз не больше 3. иначе перекур 60 секунд 


_count_friend = (count _enemyAA_mode5) + (count _enemyAA_mode4);

if ((missionNamespace getVariable ["_enemy_aircycle_AA_count", 0]) >= _count_friend) exitwith {
	missionNameSpace setvariable ["_enemy_aircycle_AA_pause",true];
	sleep 75;
	missionNameSpace setvariable ["_enemy_aircycle_AA_pause",false];
}; 

if (count _enemyAA_mode5 > 0) then {

	_marker = (Gamer getVariable "datapoint") param [0];
	_markpos = getMarkerPos _marker;
	_dir = random 360;
	_h = 300;
	_ps = [(_markpos select 0) + ((sin _dir) * 5000),(_markpos select 1) + ((cos _dir) * 5000),_h];
	_spwndir = _dir + 180; 

	_type = EnemyAirAA # 0;
	[_ps,_spwndir,_type,_markpos,2] spawn srv_fnc_createenemyairCycleAA;

};

if (count _enemyAA_mode4 > 0) then {

	_marker = (Gamer getVariable "datapoint") param [0];
	_markpos = getMarkerPos _marker;
	_dir = random 360;
	_h = 300;
	_ps = [(_markpos select 0) + ((sin _dir) * 5000),(_markpos select 1) + ((cos _dir) * 5000),_h];
	_spwndir = _dir + 180; 

	_type = EnemyAirAA # 1;
	[_ps,_spwndir,_type,_markpos,2] spawn srv_fnc_createenemyairCycleAA;


};

