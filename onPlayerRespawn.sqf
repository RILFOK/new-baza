params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
removeAllActions _oldUnit;

[	// Постановка маркера на объекты через бинокль
	_newUnit, 
	"<t color='#ff0000'>Отметить объект на карте</t>", 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", 
	"(typeOf cursorObject != '') AND (_target == _this) AND {typeOf cursorObject != 'GroundWeaponHolder'} AND {!(isNull cursorObject)} AND {cameraView == 'GUNNER'} AND {currentWeapon _this isKindOf ['Binocular', configFile >> 'CfgWeapons']}", 
	"(typeOf cursorObject != '') AND (_target == _caller) AND {typeOf cursorObject != 'GroundWeaponHolder'} AND {!(isNull cursorObject)} AND {cameraView == 'GUNNER'} AND {currentWeapon _caller isKindOf ['Binocular', configFile >> 'CfgWeapons']}", 
	{
		params ["_target", "_caller", "_actionId"];
		private _cursorObject = cursorObject;
		if (!(isNull cursorObject)) then {
			hint "Определяем координаты цели."
		} else {
			hint "Объект не определён!";
		};
		
	}, 
	{
		params ["_target", "_caller", "_actionId"];
		private _cursorObject = cursorObject;
		if (!(isNull cursorObject)) then {
			hint "Определяем координаты цели."
		} else {
			hint "Вы упустили объект!";
		}
		
	},
	{
		params ["_target", "_caller", "_actionId"];
		private _cursorObject = cursorObject;
		if (!(isNull cursorObject)) then {
			private _distance = round ((_caller distance cursorTarget)/50);
			_distance = [1, _distance] call BIS_fnc_randomInt;
			private _direction = random 360;
			private _markpos = getPosASL cursorTarget;
			private _spawnpos = [(_markpos select 0) + ((sin _direction) * _distance), (_markpos select 1) + ((cos _direction) * _distance), _markpos select 2];
			private _text = format ["%1: Внимание!!!",name _caller];
			private _mrk = format ["_USER_DEFINED_%1", getPosATL cursorObject];
			private _marker = createMarker [_mrk, _spawnpos, 1, _caller];
			_marker setMarkerType "hd_objective";
			_marker setMarkerColor "ColorRed";
			_marker setMarkerText _text;
			private _mrk_live_time = 20;
			private _hnt_text = format ["Объект отмечен на карте! Метка пропадет через %1 секунд!!!", _mrk_live_time ];
			hint _hnt_text;
			sleep _mrk_live_time;
			deleteMarker _marker;
		} else {hint "Вы упустили объект!";}

	}, 
	{ hint "Вы упустили объект!"; }, 
	[], 
	5, -1000, false, false, false
] call BIS_fnc_holdActionAdd;


[	// Обезоружить бойца
	_newUnit, // Объект на который навешивается событие
	"<t color='#ff0000'>Обезоружить</t>", // Описание события
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", // Иконка события
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", // Иконка прогресса события
	"(alive _target) AND {isPlayer _this} AND {alive _this} AND {_target distance _this <= 5} AND  {isPlayer _target} AND {_target == vehicle _target} AND {_this == vehicle _this} AND {side group _target != side group _this}",// условия при котором будет показано действие
	"(alive _target) AND {isPlayer _caller} AND {alive _caller} AND {_target distance _caller <= 5} AND  {isPlayer _target} AND {_target == vehicle _target} AND {_caller == vehicle _caller} AND {side group _target != side group _caller}", // Усдлвие проверки в процессе выполнения
	{}, // Код выполняемый при старте
	{hint "Отбираю оружие"}, // коды выполняемый в процессе прогресса
	{[_target] spawn fnc_rearm;}, // код по окончании прогресса
	{ hint "Вам неудалось обезоружить цель" }, // код выполняемы при прерывании
	[], // Аргументы, передаваемые в скрипты как _this select 3
	5, // длительность в секундах
	-1000, // приоритет
	false,	// удалить при завершении
	false	// в бессознательном состоянии
] remoteExec ["BIS_fnc_holdActionAdd", 0, _newUnit];
_id = player addAction ["Запросить арт. удар","server\function\blue\fn_artyblu.sqf",nil,1,false,true,"","(typeOf cursorObject != '') AND (_target == _this) AND {typeOf cursorObject != 'GroundWeaponHolder'} AND {!(isNull cursorObject)} AND {cameraView == 'GUNNER'} && {typeOf player == 'B_HeavyGunner_F'} AND {currentWeapon player == 'Laserdesignator'}"];