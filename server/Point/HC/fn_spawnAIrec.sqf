
params ["_arraypos","_posPoint","_arrayrecon"];
private ["_ptrpos","_sppos","_nopldist","_overWater","_grp","_recongrouparry","_recon_hn_arry","_SP","_SupportArray","_testsppos","_list"];
{

	_ptrpos = _x;
	_overWater = !(_ptrpos isFlatEmpty  [-1, -1, -1, -1, 0, false] isEqualTo []);
	if(_overWater && {_ptrpos distance (getMarkerPos "respawn_east") > 300}) then {
		_grp  = creategroup west;
		
		//_grp enableDynamicSimulation true;

		_testsppos = [];
		while {true} do {
			_testsppos = [_ptrpos, 1,200, 1, 0,-1,0] call srv_fnc_findSafePos;
			_list = _testsppos nearEntities [["Man","Car","Tank"],200];
			if((EAST countSide _list) == 0) exitWith {_sppos =+ _testsppos};
			sleep 2;
		};
		
		{
			_unit = [_grp,_sppos,_x,5,1] call srv_fnc_createenemyunit;
			_unit addEventhandler ["killed",{
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				// [_unit,_killer,_instigator,1] spawn bt_fnc_addScore;
				["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
			}];
			[_unit] join _grp;
			_recongrouparry = missionNameSpace getVariable ["recongrouparry",[]];
			_recongrouparry pushback _unit;
			missionNameSpace setVariable ["recongrouparry",_recongrouparry,true];
			
			//_unit setVariable ["deadunit",false];
			
			_unit addMPEventHandler ["MPkilled",{_this remoteexec ["srv_fnc_deadreconunit",2]}];
		} forEach _arrayrecon;

		_grp selectleader (units _grp select 0);
		_grp setCombatMode "RED";
		_grp setBehaviour "STEALTH";
		_grp setSpeedMode "LIMITED";

		_recon_hn_arry = missionNameSpace getVariable ["main_recon_hn_grouparry",[]];
		_recon_hn_arry pushBack _grp;
		missionNameSpace setVariable ["main_recon_hn_grouparry",_recon_hn_arry,true];

		//обнаружениеп противника и передача инфы на арту
		_grp addEventHandler ["EnemyDetected", {
			params ["_group", "_newTarget"];
			[_group, _newTarget] remoteexeccall ["srv_fnc_AIenemydetected",2];
		}];

		//Маршруты. Стандартные вначале. После второго подрыва спн сдвигается в город
		if (Stage < 4) then {
			[_grp,_ptrpos,_arraypos] call srv_fnc_reconPatrol;
		} else {

			_grp setBehaviour "COMBAT";
			_grp setSpeedMode "FULL";

			private _wp=_grp addWaypoint [_posPoint,150];
			_wp setWaypointType "MOVE";
			_wp setWaypointFormation "LINE";
			_wp setWaypointCompletionRadius 50;
			_wp setWaypointStatements ["true", "null = [this] spawn srv_fnc_ReinforcePatrol"];

		};
				
	};
	
} forEach _arraypos;