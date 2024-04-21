private _player = _this # 0;

PAVLIN_fnc_paraDesant = {	//	Функция десант пасажиров
	params ["_driver"];
	{
		private _unit = _x select 0;
		private _turPos = _x select 2;
		if (_turPos >= 0) then {
			if (isPlayer _unit ) then {
				if (vehicle _unit != _unit) then {
					[_unit] remoteExec ["fnc_para", _unit];
					sleep 0.25;
				};
			} else {
				[_unit] spawn fnc_para;
				sleep 0.25;
			};
		};
	} forEach (fullCrew [vehicle player, "turret", false]);
	{
		private _unit = _x select 0;
		if (isPlayer _unit ) then {
			if (vehicle _unit != _unit) then {
				[_unit] remoteExec ["fnc_para", _unit];
				sleep 0.25;
			};
		} else {
			[_unit] spawn fnc_para;
			sleep 0.25;
		};
	} forEach (fullCrew [vehicle player, "cargo", false]);
};

PAVLIN_fnc_vigruzka = {
	params ["_driver"];
	{
		private _unit = _x select 0;
		private _unitPos = _x select 2;
		if (_unitPos >= 0) then {
			if (isPlayer _unit ) then {
				if (vehicle _unit != _unit) then {
					[_unit] remoteExec ["moveOut", _unit];
					sleep 0.25;
				};
			} else {
				[_unit] spawn fnc_para;
				sleep 0.25;
			};
		};
	} forEach (fullCrew [vehicle player, "", false]);
};

PGSHKA_fnc_tros = {
	params ["_caller"];
	_helicopter = vehicle _caller;				
	if !(_helicopter getVariable["_Rope", false]) then {
		ropeCreate [_helicopter, [0, 0, -1], 45];
		_helicopter setVariable["_Rope", true, true];
		_helicopter setVariable["_RopeBlocked", false, true];
	} else {		
		{ropeDestroy _x} forEach ropes _helicopter;
		_helicopter setVariable["_Rope", false, true];
	};
};

PGSHKA_fnc_spysk = {
    params ["_caller"];
    _helicopter = vehicle _caller; 
    if !(_helicopter getVariable["_RopeBlocked", false]) then {
        _rope = (ropes _helicopter) select 0;
        _helicopter setVariable["_RopeBlocked", true, true];
        moveOut _caller;
        {
            if (_forEachIndex > 5 && (getPos _caller select 2) > 0.25) then {
                _caller setPosASL (getPosASL _x);
                _caller setVelocity [((velocity caller) select 0), ((velocity caller) select 1), 0];
                sleep 0.05;
                if (_forEachIndex == count (ropeSegments _rope) / 2) then { _helicopter setVariable["_RopeBlocked", false, true]; };
            };
        } forEach ropeSegments _rope;

        if (_helicopter getVariable "_RopeBlocked" == true) then {
             _helicopter setVariable["_RopeBlocked", false, true]; 
        };
    } else { hint "Трос заблокирован, ожидайте"; };
};


_player addEventHandler ["GetInMan", {
	params ["_player","_role","_vehicle"];


	private _level = _player getVariable ["LEVEL",1];
	private _className = typeOf _vehicle;
	private _avia_t_1 = missionNamespace getVariable ["AVIA_T_1",[]];
	private _avia_t_2 = missionNamespace getVariable ["AVIA_T_2",[]];
	private _avia_b_1 = missionNamespace getVariable ["AVIA_B_1",[]];
	private _avia_b_2 = missionNamespace getVariable ["AVIA_B_2",[]];
	private _avia_b_storm = missionNamespace getVariable ["AVIA_B_STORM",[]];
	private _allowed_world_wasp = ["Altis","Stratis","Malden","altis","malden","stratis"];
	private _tank_1 = missionNamespace getVariable ["TANK_1",[]];
	private _tank_2 = missionNamespace getVariable ["TANK_2",[]];
	private _tank_3 = missionNamespace getVariable ["TANK_3",[]];
	private _tank_4 = missionNamespace getVariable ["TANK_4",[]];
	private _dopusk = 0;	
	private _dopusk2 = 0;
	
	//Parachute check. Add button check
	if (_className != "Steerable_Parachute_F") then {
		private _para_hn_id = player addAction [
			"<t color='#ffa200'>Выпрыгнуть с парашютом</t>",
			{[player] spawn fnc_para;}, 
			0, 100, false, true, "", 
			"(getpos player select 2 > 70) and (vehicle player != player)"
		];

		player setvariable ["_para_hn_id", _para_hn_id];

		//PGSHKA спуск по троссу
		if (_vehicle isKindOf "Helicopter") then {
			private _spysk_hn_id = [player,                                           
				"Спустится по тросу",                                        
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa", 
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
				toString {
					(vehicle _target getVariable "_Rope") AND {(getPos (vehicle _target) select 2) > 2} AND {driver vehicle _target != _this}
				},
				toString {
					(vehicle _target getVariable "_Rope") AND {(getPos (vehicle _target) select 2) > 2} AND {driver vehicle _target != _caller}
				},
				{}, {},
				{ params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] spawn PGSHKA_fnc_spysk; }, {}, [], 0.5, 100, false, false                                                
			] call BIS_fnc_holdActionAdd;
			player setvariable ["_spysk_hn_id", _spysk_hn_id];
		};

		// Выбросить десантом и Выгрузка
		if ("driver" in assignedVehicleRole _player ) then {
			
			//PGSHKA Показать\спрятать трос на транспорте
			/*
			if (_vehicle isKindOf "Helicopter") then {
				private _droptros_hn_id = [_player,                                           
					"Показать\спрятать трос",                                        
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
					toString { true },
					toString { true },
					{}, {},
					{ params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] spawn PGSHKA_fnc_tros; }, {}, [], 0.5, 100, false, false                                                
				] call BIS_fnc_holdActionAdd;
				_player setVariable["_droptros_hn_id", _droptros_hn_id];
			};
			*/
			//=====================================================

			// Высадить пассажиров с парашутом
			private _para_desant_cargo = _player addAction [
				"<t color='#ffa200'>Выбросить десантом</t>",
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[_caller] spawn PAVLIN_fnc_paraDesant;
				},
				0, -1, false, true, "", 
				"(getpos _this select 2 > 70) and (vehicle _this != _this) and ('driver' in assignedVehicleRole _this)"
			];
			_player setVariable ["_para_desant_cargo", _para_desant_cargo ];
			//	Срочно покинуть технику
			private _vigruzka = _player addAction [
				"<t color='#ffa200'>Выгрузка</t>",
				{
					params ["_target", "_caller", "_actionId", "_arguments"];
					[_caller] spawn PAVLIN_fnc_vigruzka;
				},
				0, 99, false, true, "", 
				"(getpos _this select 2 < 3.5) and (speed _target < 5) and (vehicle _this != _this) and ('driver' in assignedVehicleRole _this)"
			];
			_player setVariable ["_vigruzka", _vigruzka ];
		} else {
			private _player_para_desant_cargo = _player getvariable ["_para_desant_cargo", false];
			if (_player_para_desant_cargo isNotEqualTo false) then {
				_player removeAction _player_para_desant_cargo;
			};
			private _player_vigruzka = _player getvariable ["_vigruzka", false];
			if (_player_vigruzka isNotEqualTo false) then {
				_player removeAction _player_vigruzka;
			};
			private _player_droptros = _player getvariable ["_droptros_hn_id", false];
			if (_player_droptros isNotEqualTo false) then {
				_player removeAction _player_droptros;
			};
		





		// Синим нельзя в технику
		if (PlayerSide == west) then {
			if (_className != "Steerable_Parachute_F") exitWith {
				"Вы не можете занимать технику" remoteExec ["hint",_player];
				moveOut _player;
			};
		};


		//Круиз контроль/пониженная передача
		if (_role isEqualto "driver") then {
			[] call fnc_cruisecontrol;
		};
	};
}];






_player addEventHandler ["SeatSwitchedMan", {
	params ["_unit1","_unit2","_vehicle"];
	private _level = _unit1 getVariable ["LEVEL",1];
	private _className = typeOf _vehicle;
	private _avia_t_1 = missionNamespace getVariable ["AVIA_T_1",[]];
	private _avia_t_2 = missionNamespace getVariable ["AVIA_T_2",[]];
	private _avia_b_1 = missionNamespace getVariable ["AVIA_B_1",[]];
	private _avia_b_2 = missionNamespace getVariable ["AVIA_B_2",[]];
	private _tank_1 = missionNamespace getVariable ["TANK_1",[]];
	private _tank_2 = missionNamespace getVariable ["TANK_2",[]];
	private _tank_3 = missionNamespace getVariable ["TANK_3",[]];
	private _tank_4 = missionNamespace getVariable ["TANK_4",[]];
	private _dopusk = 0;
    _role = assignedVehicleRole player;	
	//OPFOR vehicle checker
	if ((_className != "Steerable_Parachute_F") and ( "driver" in assignedVehicleRole _unit1 )) then {

		//PGSHKA Показать\спрятать трос на транспорте
		/*
		if (_vehicle isKindOf "Helicopter") then {
			private _droptros_hn_id = [_unit1,                                           
				"Показать\спрятать трос",                                        
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
				toString { true },
				toString { true },
				{}, {},
				{ params ["_target", "_caller", "_actionId", "_arguments"]; [_caller] spawn PGSHKA_fnc_tros; }, {}, [], 0.5, 100, false, false                                                
			] call BIS_fnc_holdActionAdd;
			_unit1 setVariable["_droptros_hn_id", _droptros_hn_id];
		};
		*/
		//=====================================================

		// Высадить пассажиров с парашутом
		private _para_desant_cargo = _unit1 addAction [
			"<t color='#ffa200'>Выбросить десантом</t>",
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_caller] spawn PAVLIN_fnc_paraDesant;
			},
			0, -1, false, true, "", 
			"(getpos _this select 2 > 70) and (vehicle _this != _this) and ('driver' in assignedVehicleRole _this)"
		];
		_unit1 setVariable ["_para_desant_cargo", _para_desant_cargo ];
		//	Срочно покинуть технику
		private _vigruzka = _unit1 addAction [
			"<t color='#ffa200'>Выгрузка</t>",
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_caller] spawn PAVLIN_fnc_vigruzka;
			},
			0, 99, false, true, "", 
			"(getpos _this select 2 < 3.5) and (speed _target < 5) and (vehicle _this != _this) and ('driver' in assignedVehicleRole _this)"
		];
		_unit1 setVariable ["_vigruzka", _vigruzka ];
	} else {
		private _player_para_desant_cargo = _unit1 getvariable ["_para_desant_cargo", false];
		if (_player_para_desant_cargo isNotEqualTo false) then {
			_unit1 removeAction _player_para_desant_cargo;
		};
		private _player_vigruzka = _unit1 getvariable ["_vigruzka", false];
		if (_player_vigruzka isNotEqualTo false) then {
			_unit1 removeAction _player_vigruzka;
		};
		private _player_droptros_hn_id = _unit1 getvariable ["_droptros_hn_id", false];
		if (_player_droptros_hn_id isNotEqualTo false) then {
			_unit1 removeAction _player_droptros_hn_id;
		};




	// синие
	if (PlayerSide == west) exitWith {
		"Вы не можете занимать технику" remoteExec ["hint",_unit1];
		moveOut _unit1;
	}; 
	//=====================================================================================

	//Круиз контроль/пониженная передача при пересадки на водителя или удалить, если пересадка на пассажира
	private _cruisecontrol_hn_displayEH = player getvariable "_cruisecontrol_hn_displayEH";
	private _cruisecontrol_hn_id = player getvariable "_cruisecontrol_hn_id";
	if ("driver" in _role) then {
		[] call fnc_cruisecontrol;
	} else {
		if !(isNil "_cruisecontrol_hn_id") then {
			(findDisplay 46) displayremoveEventHandler ["keyDown",_cruisecontrol_hn_displayEH];
			player removeAction _cruisecontrol_hn_id;

			player setvariable ["_cruisecontrol_hn_id", nil];
			player setvariable ["_cruisecontrol_hn_displayEH", nil];
		};

		private _downShiftOn_hn_id = player getvariable "_downShiftOn_hn_id";
		private _downShiftOffn_hn_id = player getvariable "_downShiftOffn_hn_id";
		if !(isNil "_downShiftOn_hn_id") then {
			player removeAction _downShiftOn_hn_id;
			player removeAction _downShiftOffn_hn_id;
			player setvariable ["_downShiftOn_hn_id", nil];
			player setvariable ["_downShiftOffn_hn_id", nil];
		};
	};
	//=====================================================================================
}];



_player addEventHandler ["GetOutMan", {
	params ["_player","_role","_vehicle"];
	_player setVariable ["INSKY",false];
	_player setVariable ["INVEH",false];

	//Убрать кнопку парашют
	player removeAction  (player getvariable "_para_hn_id");
	player removeAction  (player getvariable "_spysk_hn_id");
	private _player_para_desant_cargo = player getvariable ["_para_desant_cargo", false];
	if (_player_para_desant_cargo isNotEqualTo false) then {
		player removeAction _player_para_desant_cargo;
	};
	private _player_vigruzka = player getvariable ["_vigruzka", false];
	if (_player_vigruzka isNotEqualTo false) then {
		player removeAction _player_vigruzka;
	};
	private _player_droptros = player getvariable ["_droptros_hn_id", false];
	if (_player_droptros isNotEqualTo false) then {
		player removeAction _player_droptros;
	};
	//убрать круиз-контроль
	private _cruisecontrol_hn_displayEH = player getvariable "_cruisecontrol_hn_displayEH";
	private _cruisecontrol_hn_id = player getvariable "_cruisecontrol_hn_id";
	if !(isNil "_cruisecontrol_hn_id") then {
		(findDisplay 46) displayremoveEventHandler ["keyDown",_cruisecontrol_hn_displayEH];
		player removeAction _cruisecontrol_hn_id;

		player setvariable ["_cruisecontrol_hn_id", nil];
		player setvariable ["_cruisecontrol_hn_displayEH", nil];
	};

	private _downShiftOn_hn_id = player getvariable "_downShiftOn_hn_id";
	private _downShiftOffn_hn_id = player getvariable "_downShiftOffn_hn_id";
	if !(isNil "_downShiftOn_hn_id") then {
		player removeAction _downShiftOn_hn_id;
		player removeAction _downShiftOffn_hn_id;
		player setvariable ["_downShiftOn_hn_id", nil];
		player setvariable ["_downShiftOffn_hn_id", nil];
	};

	//====================================================================================
}];


