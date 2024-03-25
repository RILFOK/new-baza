params ["_veh","_veh_type"];
private ["_veh_crew","_tr_hn_veh_number_allow","_remove_veh"];


while {alive _veh} do {
	sleep 15;
	_remove_veh = TRUE;
	_veh_crew = (crew _veh) select {alive _x};
	if ( count _veh_crew == 0) then {
		{
			if (_x distance2D _veh < 50) then {_remove_veh = FALSE};
		}foreach playableUnits;
	} else {_remove_veh = FALSE;};

	if (_remove_veh) exitWith {				
		deleteVehicle _veh;
		_tr_hn_veh_number_allow = missionNameSpace getvariable [format ["_tr_hn_veh_number_allow%1",_veh_type],1];
		_tr_hn_veh_number_allow = _tr_hn_veh_number_allow - 1;
		missionNameSpace setvariable [format ["_tr_hn_veh_number_allow%1",_veh_type],_tr_hn_veh_number_allow,true];
	};	
};