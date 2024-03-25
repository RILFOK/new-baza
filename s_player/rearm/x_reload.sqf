_object = _this;

_type = typeOf _object;

_object vehicleChat format ["Приступаем к обслуживанию %1... Оставайтесь на месте...", _type];

sleep 1;
_object setFuel 0;
sleep 3;

_object setVehicleAmmo 1;

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
if (count _magazines > 0) then {
	// _object vehicleChat "Пополняем боекомплект...";
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		_object addMagazine _x;
	} forEach _magazines;
	// sleep 3;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
if (_count > 0) then {
	// _object vehicleChat "Пополняем боекомплект ...";
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;	// берем все турели
		_magazines = getArray(_config >> "magazines");	//	в массив все магазины турели
		_removed = [];	// массив для чистки 
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;	//	удалить магазин
				_removed = _removed + [_x];	//	Добавить в массив снесенный магазин
			};
		} forEach _magazines;
		{
			// _object vehicleChat format ["Пополняем %1", _x];
			// sleep 3;
			_object addMagazine _x;
			// sleep 3;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					// _object vehicleChat format ["Пополняем %1", _x]; 
					// sleep 3;
					_object addMagazine _x;
					// sleep 3;
				} forEach _magazines;
			};
		};
	};
	
};
// sleep 5;
_object setVehicleAmmo 1;	// Reload turrets / drivers magazine
_object vehicleChat format ["%1: Боекомплект пополнен", _type];

sleep 5;
_object setDamage 0;
_object vehicleChat format ["%1: Отремонтирован", _type];
sleep 5;

while {fuel _object < 0.99} do {
	
	// sleep 3;
	//_object setFuel ((fuel _vehicle + 0.1) min 1);
	_object setFuel 1;
	// sleep 0.01;
};
_object vehicleChat format ["%1: Заправлен", _type];
sleep 3;
_object vehicleChat format ["Обслуживание %1 завершено. Счастливого пути.", _type];

if (true) exitWith {};