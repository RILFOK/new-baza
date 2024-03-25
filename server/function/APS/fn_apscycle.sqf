params["_veh"];

/*
	APS by pgshka

	Active Protection System *

	радиус работы 360

	если дистанция к снаряду выше чем _safeRange но меньше _range то APS уничтожит его 
*/

_veh setVariable["_safety", [], true];
private _workRange = _veh getVariable["_workRange", 26];
private _safeRange = _veh getVariable["_safeRange", 9];
private _vectorMagnitude = _veh getVariable["_vectorMagnitude", 25];
// _safeRange = 14;
// _safeRocket = objNull;
//systemChat format["APS - enabled for: %1", typeOf _veh];

while {alive _veh} do {

	//Проверяем количество снарядов APS если меньше 1 то вырубаем
	if (_veh getVariable "_APS_CURRENT" < 1) then {
		_veh vehicleChat "APS: Отсутствуют снаряды, выключение.";
		_veh setVariable["_APS_ENABLED", false, true];
		Break;
	};
	//Выключаем APS выключил его сам
	if (_veh getVariable "_APS_ENABLED" isEqualTo false
	|| count fullCrew _veh == 0 ) then {
		_veh setVariable["_APS_ENABLED", false, true];
		_veh vehicleChat "APS: Выключено.";
		Break;
	};


	_incoming = (_veh nearObjects["RocketBase", _workRange]) select { (vectorMagnitude velocity _x) > _vectorMagnitude};                       
	if (_incoming isEqualTo []) then {
  		_incoming append (_veh nearObjects["MissileBase",_workRange]) select { (vectorMagnitude velocity _x) > _vectorMagnitude};
	};

	private _apsCD = _veh getVariable["_APS_CD", false];
	if (_incoming isNotEqualTo [] && !(_apsCD)) then {
		private _rocket = _incoming#0;
		private _0Range = _rocket distance _veh;
		private _safety = _veh getVariable["_safety", []];
		if (_0Range < _safeRange) then {
			if !(_rocket in _safety) then {
				_safety pushBack _rocket; 	
				_veh setVariable["_safety", _safety, true];
			};	
		} else {
			if !(_rocket in _safety) then {
				_veh setVariable["_APS_CD", true, true];
				_aps = _veh getVariable["_APS_CURRENT", 0];
				_veh setVariable["_APS_CURRENT", _aps - 1, true];

				deleteVehicle _rocket;
				createVehicle ["SmallSecondary", position _rocket, [], 0, "CAN_COLLIDE"];
	
				sleep 0.5;
				_veh setVariable["_APS_CD", false, true];
			};
		};
	};	

	sleep 0.01;
};