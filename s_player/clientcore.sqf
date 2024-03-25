/*


core loop for client


				Haron

*/

if (!hasInterface) exitWith {};

private ["_player","_hn_veh_player","_cursorTarget","_true","_false","_check_channel_func",
		"_hn_canbandage_action","_hn_canbandage_action_id","_hn_canrevive_action","_hn_canrevive_action_id",
		"_hn_candrag_action","_hn_candrag_action_id","_hn_candcarry_action","_hn_candcarry_action_id","_hn_candload_action",
		"_hn_candload_action_id","_hn_canunload_action","_hn_canunload_action_id","_hn_Can_Take_Ropes_action",
		"_hn_Can_Take_Ropes_action_id","_hn_Can_TOW_Ropes_action","_hn_Can_TOW_Ropes_action_id","_hn_Can_Put_away_Ropes_action",
		"_hn_Can_Put_away_Ropes_action_id"];


_player = player;
_hn_veh_player = vehicle _player;
_true = TRUE;
_false = FALSE;

_hn_canrevive_action = _false;
_hn_canbandage_action = _false;
_hn_canrearm_med_action = _false;
_hn_candrag_action = _false;
_hn_candcarry_action = _false;
_hn_candload_action = _false;
_hn_canunload_action = _false;

_hn_Can_Take_Ropes_action = _false;
_hn_Can_TOW_Ropes_action = _false;
_hn_Can_Put_away_Ropes_action = _false;

for "_i" from 0 to 1 step 0 do {
	_cursorTarget = cursorTarget;
	//systemchat str _cursorTarget;
	_hn_veh_player = vehicle _player;
	
	//Handle addaction on cursorobject
		/* -------ВЗАИМОДЕЙСТВИЕ С ДРУГИМ ИГРОКОМ ( МЕДИЦИНА )----------*/
		
	if ( (_cursorTarget isKindOf "Man") && {_cursorTarget distance _player < 2}) then{
		/*
					/* -------Перавя помощь----------*/
		/*			
		if ([_cursorTarget] call fnc_canrevive) then {
			if !(_hn_canrevive_action) then {
				_hn_canrevive_action = _true;
				_hn_canrevive_action_id = [_player, 
				"<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", 
					"true", "((items player) find 'Medikit' != -1)", {}, 
					{hint "Лечение"}, 
					{
						private _cursorTarget = cursorTarget;
						if !(_cursorTarget getVariable 'isUnconscious') then {
							[player,_cursorTarget] spawn fnc_revive;
						};
					}, 
					{ hint "Вам нужна аптечка" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;
			};
		} else {
			if (_hn_canrevive_action) then {
				_hn_canrevive_action = _false;
				[_player, _hn_canrevive_action_id] call BIS_fnc_holdActionRemove;
			};
		};
		*/

			/* -------Остановить кровотечение----------*/
			/*
		if ([_cursorTarget] call fnc_canbandage) then {
			if !(_hn_canbandage_action) then {
				_hn_canbandage_action = _true;
				_hn_canbandage_action_id = [_player, "<t color='#ff0000'>Остановить кровотечение</t>", 
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
					"true", "(items player) find 'FirstAidKit' != -1",
					{}, {hint "Перевязка"}, {[player,cursorTarget] spawn fnc_bandage;}, 
					{ hint "Вам нужен перевязочный пакет" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;
			};

		} else {
			if (_hn_canbandage_action) then {
				_hn_canbandage_action = _false;
				[_player, _hn_canbandage_action_id] call BIS_fnc_holdActionRemove;
			};
		};

		*/


			/* -------Обезоружить----------*/

		if ([_cursorTarget] call fnc_canrearm) then {
			if !(_hn_canrearm_med_action) then {
				_hn_canrearm_med_action = _true;
				_hn_canrearm_med_action_id = [_player,"<t color='#ff0000'>Обезоружить</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "", 
					"true", {}, {hint "Отбираю оружие"}, {[cursorTarget] spawn fnc_rearm;},
					{ hint "" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;
			};

		} else {
			if (_hn_canrearm_med_action) then {
				_hn_canrearm_med_action = _false;
				[_player, _hn_canrearm_med_action_id] call BIS_fnc_holdActionRemove;
			};
		};



		/* -------Тащить----------*/

		if ([_cursorTarget] call fnc_candrag) then {
			if !(_hn_candrag_action) then {
				_hn_candrag_action = _true;
				_hn_candrag_action_id = _player addAction [ "<t color='#ff0000'>Тащить</t>",{[player,cursorTarget] spawn fnc_drag;}, nil, 1, false, true, "", ""];
			};

		} else {
			if (_hn_candrag_action) then {
				_hn_candrag_action = _false;
				_player removeAction _hn_candrag_action_id;
			};
		};

		/* -------Нести----------*/

		if ([_cursorTarget] call fnc_cancarry) then {
			if !(_hn_candcarry_action) then {
				_hn_candcarry_action = _true;
				_hn_candcarry_action_id = _player addAction [ "<t color='#ff0000'>Нести</t>",{[player,cursorTarget] spawn fnc_carry;}, nil, 1, false, true, "", ""];
			};

		} else {
			if (_hn_candcarry_action) then {
				_hn_candcarry_action = _false;
				_player removeAction _hn_candcarry_action_id;
			};
		};
		
				/* -------Грузить----------*/


		if ([_cursorTarget] call fnc_canload) then {
			if !(_hn_candload_action) then {
				_hn_candload_action = _true;
				_hn_candload_action_id = _player addAction [ "<t color='#ff0000'>Загрузить</t>",{[cursorTarget] spawn fnc_load;}, nil, 1, false, true, "", ""]
			};

		} else {
			if (_hn_candload_action) then {
				_hn_candload_action = _false;
				_player removeAction _hn_candload_action_id;
			};
		};

	} else {
		//Убираем кнопки
		 /*
		if (_hn_canrevive_action) then {
			_hn_canrevive_action = _false;
			[_player, _hn_canrevive_action_id] call BIS_fnc_holdActionRemove;
		};

		if (_hn_canbandage_action) then {
			_hn_canbandage_action = _false;
			[_player, _hn_canbandage_action_id] call BIS_fnc_holdActionRemove;
		};*/

		if (_hn_canrearm_med_action) then {
			_hn_canrearm_med_action = _false;
			[_player, _hn_canrearm_med_action_id] call BIS_fnc_holdActionRemove;
		};
		if (_hn_candrag_action) then {
			_hn_candrag_action = _false;
			_player removeAction _hn_candrag_action_id;
		};

		if (_hn_candcarry_action) then {
			_hn_candcarry_action = _false;
			_player removeAction _hn_candcarry_action_id;
		};
		if (_hn_candload_action) then {
			_hn_candload_action = _false;
			_player removeAction _hn_candload_action_id;
		};

	};







	/* -------ВЗАИМОДЕЙСТВИЕ С ТЕХНИКОЙ----------*/
	if (((_cursorTarget isKindOf 'LandVehicle') || {(_cursorTarget isKindOf 'Air') || {(_cursorTarget isKindOf 'Ship')}}) 
		&&
	{(_cursorTarget distance _player < 6)}) then {

		/* -------Выгрузка 300 из техники----------*/
		if ({(_x getVariable "IsUnconscious") && (alive _x)}count crew _cursorTarget > 0) then {
			if !(_hn_canunload_action) then {
				_hn_canunload_action = _true;
				_hn_canunload_action_id = _player addAction [ "<t color='#ff0000'>Выгрузить</t>",
				{[cursorTarget] spawn fnc_unload;}, nil, 1, false, true, "", ""];
			};

		} else {
			if (_hn_canunload_action) then {
				_hn_canunload_action = _false;
				_player removeAction _hn_canunload_action_id;
			};
		};

		
		/* -------Тросы----------*/
		// достать трос
		if ([_cursorTarget] call SA_Can_Take_Tow_Ropes) then {
			
			if !(_hn_Can_Take_Ropes_action) then {
				_hn_Can_Take_Ropes_action = _true;
				_hn_Can_Take_Ropes_action_id = _player addAction [
					"<t color='#7FDA0B'><img image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_config_ca.paa' size='1.0'/> Достать новый трос</t>", 
					{[] call SA_Take_Tow_Ropes_Action; }, nil, 0, false, true, "", "", 10
				];
			};

		} else {
			if (_hn_Can_Take_Ropes_action) then {
				_hn_Can_Take_Ropes_action = _false;
				_player removeAction _hn_Can_Take_Ropes_action_id;
			};

		};
		
		//прикрепить трос
		if ([player getVariable ["SA_Tow_Ropes_Vehicle", objNull],_cursorTarget] call SA_Can_Attach_Tow_Ropes) then {
			
			if !(_hn_Can_TOW_Ropes_action) then {
				_hn_Can_TOW_Ropes_action = _true;
				_hn_Can_TOW_Ropes_action_id = _player addAction [
					"<t color='#900C3F'><img image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_debug_ca.paa' size='1.0'/> Прикрепить трос</t>",
					{
						[] call SA_Attach_Tow_Ropes_Action;
					}, nil, 0, false, true, "", "", 10
				];
			};

		} else {
			if (_hn_Can_TOW_Ropes_action) then {
				_hn_Can_TOW_Ropes_action = _false;
				_player removeAction _hn_Can_TOW_Ropes_action_id;
			};

		};


		//убрать трос
		if ([_cursorTarget] call SA_Can_Put_Away_Tow_Ropes) then {
			
			if !(_hn_Can_Put_away_Ropes_action) then {
				_hn_Can_Put_away_Ropes_action = _true;
				_hn_Can_Put_away_Ropes_action_id = _player addAction [
					"<t color='#FF5733'><img image='\a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_config_ca.paa' size='1.0'/> Убрать трос</t>", 
					{
					[] call SA_Put_Away_Tow_Ropes_Action;
					}, nil, 0, false, true, "", "", 10
				];
			};

		} else {
			if (_hn_Can_Put_away_Ropes_action) then {
				_hn_Can_Put_away_Ropes_action = _false;
				_player removeAction _hn_Can_Put_away_Ropes_action_id;
			};

		};
	} else {
	
		//Убираем кнопки, если уводим взгляд
		if (_hn_canunload_action) then {
			_hn_canunload_action = _false;
			_player removeAction _hn_canunload_action_id;
		};

		if (_hn_Can_Take_Ropes_action) then {
			_hn_Can_Take_Ropes_action = _false;
			_player removeAction _hn_Can_Take_Ropes_action_id;
		};

		if (_hn_Can_TOW_Ropes_action) then {
			_hn_Can_TOW_Ropes_action = _false;
			_player removeAction _hn_Can_TOW_Ropes_action_id;
		};

		if (_hn_Can_Put_away_Ropes_action) then {
			_hn_Can_Put_away_Ropes_action = _false;
			_player removeAction _hn_Can_Put_away_Ropes_action_id;
		};
	};

	sleep 0.1;
};

