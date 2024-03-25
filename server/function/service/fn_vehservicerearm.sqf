params [ ["_curLocalVehicle", objNull, [objNull]] ];
_type = typeOf _curLocalVehicle;

_curLocalVehicle setVehicleAmmo 1;

_aps = _curLocalVehicle getVariable ["_APS_CURRENT", false];
_apsmax = _curLocalVehicle getVariable ["_APS_MAX", false];
if (_aps isNotEqualTo false) then {
	_curLocalVehicle setVariable ["_APS_CURRENT", _apsmax, true];
};

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
if (count _magazines > 0) then {
	// _object vehicleChat "Пополняем боекомплект...";
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_curLocalVehicle removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		_curLocalVehicle addMagazine _x;
	} forEach _magazines;
	// sleep 3;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		//scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;	// берем все турели
		_magazines = getArray(_config >> "magazines");	//	в массив все магазины турели
		_removed = [];	// массив для чистки 

		{
			if (!(_x in _removed)) then {
				_curLocalVehicle removeMagazines _x;	//	удалить магазин
				_removed = _removed + [_x];	//	Добавить в массив снесенный магазин
			};
		} forEach _magazines;
		{
			_curLocalVehicle addMagazine _x;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_curLocalVehicle removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_curLocalVehicle addMagazine _x;
				} forEach _magazines;
			};
		};
	};
	
};
_curLocalVehicle setVehicleAmmo 1;