params ["_marker"];
private ["_markerPos", "_ukrep", "_spawnpos", "_obj", "_grp", "_center_pos", "_count", "_maxdist", "_place", "_list"];

_centerPos = getMarkerPos _marker;
_centerPos params ["_centerPosX", "_centerPosY"];
//PGSHKA
/*
	  CREATED BY PGSHKA
	
	_distance -- радиус создания точек от центра триггера
	_angle -- угол (60 = 6 точек) если уменьшить это число то будет больше точек для спавна укрепов
	
	Как делать новые укрепы?
	1. Ставим на координаты 0 0 любой малый обьект
	например: "Land_HBarrier_1_F"
	2. Вокруг малого обьекта ставим любые обьекты
	крч, делаем укреп НОРМАЛЬНЫЙ
	3. Дальше прописываем укрепы в самом скрипте после выбора
	результата (_result), первым обьектом ставим наш центральный
	через функцию "_PGS_fnc_setDirPos" далее ставим через "_BRO_fnc_placing"
	и не забыть добавить индекс обьекта в _list

	_list = [1, 2, 3, 4];

	Допустим в конце 4 добавляем 5

	_list = [1, 2, 3, 4, 5];
	
	и так для всех новых укрепов
*/

_distance = 200;
_angle = 60;

_worldpos = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
_list = [1, 2, 3, 4];

_noDim = ["Land_Cargo_House_V2_F"];

_BRO_fnc_placing = {
	params ["_class", "_X", "_Y", "_angle", "_offset"];
	if (isNil "_offset") then {
		_offset = 0
	};
	_az = getDir _ukrep;
	_obj = _class createVehicle getPosWorld _ukrep;
	_obj setDir _az+_angle;
	_obj setPos (_ukrep modelToWorld [_X, _Y]);
	_obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];

	if !(_class in _noDim) then {
		_obj enableSimulation false;
		_obj allowdamage false;
	};
};

_PGS_fnc_setDirPos = {
    params ["_object"];
    _ukrep = _object createVehicle _spawnpos;
	_ukrep setVectorUp surfaceNormal position _ukrep;
	_ukrep setDir (random 360);
	_ukrep setPos _spawnpos;
	_ukrep setPos (getPos _ukrep vectorAdd [0, 0, 0]);

	if !(_object in _noDim) then {
		_ukrep enableSimulation false;
		_ukrep allowdamage false;
	};
};

for "_i" from 0 to (360-_angle) step _angle do {
	_point = [(_distance*cos(_i) + _centerPosX), (_distance*sin(_i) + _centerPosY)];

	// Ставит башню на поинт
	// "Land_GuardTower_02_F" createVehicle _point;
	_spawnpos = _worldpos;

	_maxdist = 50;
	_count = 1;
    _place = FALSE;

	//Поиск безопасной позиции для установки укрепа
	while { _spawnpos isEqualTo _worldpos } do {
		_spawnpos = [_point, 0, _maxdist, 20, 0, 0.20, 0] call Srv_fnc_findSafePos;
		if (_spawnpos isEqualTo _worldpos) then {
			_count = _count + 1;
			_maxdist = 50 * _count;
			_spawnpos = _worldpos;
			//systemChat format["%1", _maxdist];
			if (_count > 8) then { _place = FALSE; Break; };
		} else { _place = TRUE; Break; };
        sleep 0.025;
	};

    if (count _list == 0) then { _list = [1,2,3,4]; };
	if (_place) then {
		
		//Рандомим список укрепов
		_list = _list call BIS_fnc_arrayShuffle;
        _result = _list select 0;
        _list deleteAt 0;

		//Ставим укреп
		switch (_result) do {
			case 1: {
				["Land_HBarrier_1_F"] call _PGS_fnc_setDirPos;
				sleep 0.1;
            	["Land_Bunker_01_small_F", 8, -9, 315.942] call _BRO_fnc_placing;
				["Land_Cargo_Patrol_V1_F", -4.5, -5, 34.019] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -7.5, 0.5, 125.908] call _BRO_fnc_placing;
                ["Land_HBarrier_Big_F", -6.5, -5.5, 44.538] call _BRO_fnc_placing;
                ["Land_HBarrier_Big_F", 0.5, -10, 202.592] call _BRO_fnc_placing;
                ["Land_HBarrier_Big_F", 9, -2.5, 63.647] call _BRO_fnc_placing;
                ["Land_HBarrier_Big_F", 11.5, 2.5, 63.647] call _BRO_fnc_placing;
                ["Land_HBarrierTower_F", 2.5, 9.5, 120.111] call _BRO_fnc_placing;
                ["Land_HBarrierWall4_F", 7, 9.5, 29.695] call _BRO_fnc_placing;
                ["Land_HBarrierWall4_F", 8.5, 8, 122.149] call _BRO_fnc_placing;
                ["Land_HBarrier_5_F", 9.5, -6, 332.521] call _BRO_fnc_placing;
                ["Land_HBarrier_5_F", -7.5, 7.5, 125.742] call _BRO_fnc_placing;
                ["Land_HBarrier_5_F", -1.5, 16.5, 121.137] call _BRO_fnc_placing;
				sleep 0.1;
				[_ukrep] spawn srv_fnc_defenceBash;
			};
			case 2: {
				["Land_HBarrier_1_F"] call _PGS_fnc_setDirPos;
				sleep 0.1;
				["Land_BagBunker_Large_F", 4.5, 8.5, 211.380] call _BRO_fnc_placing;
				["Land_HBarrierTower_F", -10, 2.5, 114.027] call _BRO_fnc_placing;
				["Land_HBarrierTower_F", 8.5, -4.5, 289.963] call _BRO_fnc_placing;
				["Land_Cargo_Patrol_V1_F", 1.5, -10, 27.704] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -10.5, -4.5, 81.160] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -3, -6, 81.160] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 1, -11.5, 30.494] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 7.5, -11, 145.740] call _BRO_fnc_placing;
				["Land_HBarrierWall_corner_F", -6, 7, 298.558] call _BRO_fnc_placing;
				["Land_HBarrierWall_corner_F", 7.5, 1, 54.491] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", -3.5, -3, 168.591] call _BRO_fnc_placing;
				["Land_HBarrier_5_F", -4, -4, 317.054] call _BRO_fnc_placing;
				["Land_HBarrier_5_F", 1.5, -0.5, 224.016] call _BRO_fnc_placing;
				["Land_HBarrier_5_F", 4, -4.5, 24.880] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", -5, 8, 0] call _BRO_fnc_placing;
				sleep 0.1;
				[_ukrep] spawn srv_fnc_defenceBash;
			};
			case 3: {
				["Land_HBarrier_1_F"] call _PGS_fnc_setDirPos;
				sleep 0.1;
				["Land_Bunker_01_small_F", 0, 15, 178.296] call _BRO_fnc_placing;		
				["Land_HBarrierTower_F", 9.5, -4, 237.871] call _BRO_fnc_placing;
				["Land_Cargo_Patrol_V1_F", -7.5, -7.5, 57.574] call _BRO_fnc_placing;
				["Land_Cargo_House_V2_F", 8.5, 5, 147.419] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 6.5, 12, 41.354] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 12, 6, 59.669] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 9.5, 0.5, 150.026] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 2.5, -7.5, 59.717] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -0.5, -11.5, 3.830] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -7, -8.5, 56.432] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -10, -1, 84.685] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -10.5, 7.5, 91.251] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", -3.5, 9, 91.251] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", -3.5, 5.5, 358.271] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", 0.5, -5, 329.042] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", 4.5, -6, 329.042] call _BRO_fnc_placing;								
				sleep 0.1;
				[_ukrep] spawn srv_fnc_defenceBash;
			};
			case 4: {
				["Land_HBarrier_1_F"] call _PGS_fnc_setDirPos;
				sleep 0.1;
				["Land_BagBunker_Large_F", -3, -6.25, 0] call _BRO_fnc_placing;
				["Land_HBarrierTower_F", -3, 6, 180] call _BRO_fnc_placing;
				["Land_Cargo_House_V2_F", 6.5, -1, 180] call _BRO_fnc_placing;
				["Land_HBarrierWall4_F", -5.5, 1.5, 270] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 2, 11.5, 180] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 10, 11, 191] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 6, -5.5, 180] call _BRO_fnc_placing;
				["Land_HBarrier_Big_F", 11, -2, 90] call _BRO_fnc_placing;
				["Land_HBarrier_3_F", 12.5, 5, 110.465] call _BRO_fnc_placing;
				sleep 0.1;
				[_ukrep] spawn srv_fnc_defenceBash;
			};
		};
	};
};