params [ ["_caller", objNull, [objNull]], ["_type","ALL",[""]] ];
if (_caller isEqualTo objNull) exitWith {}; // Если не передали игрока - выходим отсюда
private _objVehicle = vehicle _caller;

if (_objVehicle isEqualTo objNull) exitWith {}; // Если игрок не в технике - выходим отсюда

private _arrTypes = ["ALL","Repair","Refuel","Rearm"];
if !(_type in _arrTypes) exitWith {};


private _fnc_local_serviceRepair = { 	// ремонт
	params[["_curLocalVehicle", objNull, [objNull]], ["_curCaller", objNull, [objNull]]];
	private _isEngineer = false;
	_isEngineer = _curCaller getUnitTrait "engineer";

	_type = typeOf _curLocalVehicle;
	private _curFuel = fuel _curLocalVehicle; // запоминаем показатель топлива
	private _curDamage = damage _curLocalVehicle; // запоминаем текущий урон
	if (_curDamage != 0 ) then {
		_curLocalVehicle vehicleChat format ["Приступаем к ремонту %1...", _type];
		_curLocalVehicle setFuel 0; // сливаем топливо чтобы остановить технику
		if (_isEngineer) then {
			sleep 10;
			// Далее накидывание опыта
			private _amount = _curDamage toFixed 2;
			["engineer_veh", ["reapir", _curCaller, _amount ]] spawn bt_fnc_eventScore;
		} else {
			sleep 30;
		}; // Пауза. Инженер 10 сек. Остальные 30 сек.
		_curLocalVehicle setDamage 0; // ремонтируем
		_curLocalVehicle setFuel _curFuel; // возвращаем топливо на прежний уровень
		_curLocalVehicle vehicleChat format ["%1: Отремонтирован", _type];
	}else{
		_curLocalVehicle setDamage 0; // На всякий случай чиним польностью. Заплатка RHS
		_curLocalVehicle vehicleChat format ["%1: ремонт не требуется", _type];
	};
};
private _fnc_local_serviceRefuel = { 	// заправка
	params[["_curLocalVehicle", objNull, [objNull]], ["_curCaller", objNull, [objNull]]];
	private _isEngineer = false;
	_isEngineer = _curCaller getUnitTrait "engineer";

	_type = typeOf _curLocalVehicle;
	private _curFuel = fuel _curLocalVehicle; // запоминаем показатель топлива
	if (_curFuel != 1 ) then {
		_curLocalVehicle vehicleChat format ["Приступаем к заправке %1...", _type];
		_curLocalVehicle setFuel 0;
		if (_isEngineer) then {
			sleep 10;
			// Далее накидывание опыта
			private _amount = (1 - _curFuel) toFixed 2 ;
			["engineer_veh", ["refuel", _curCaller, _amount ]] spawn bt_fnc_eventScore;
		} else {
			sleep 30;
		}; // Пауза. Инженер 10 сек. Остальные 30 сек.
		_curLocalVehicle setFuel 1;
		_curLocalVehicle vehicleChat format ["%1: Заправлен", _type];
	} else {
		_curLocalVehicle setFuel 1; // На всякий случай заливаем польностью.
		_curLocalVehicle vehicleChat format ["%1: бак полон топлива", _type];
	};
};
private _fnc_local_serviceRearm = { 	// пополнение БК
	params[["_curLocalVehicle", objNull, [objNull]], ["_curCaller", objNull, [objNull]]];
	private _isEngineer = false;
	_isEngineer = _curCaller getUnitTrait "engineer";

	_aps = _curLocalVehicle getVariable ["_APS_CURRENT", false];
	_apsmax = _curLocalVehicle getVariable ["_APS_MAX", false];
	if (_aps isNotEqualTo false) then {
		_curLocalVehicle setVariable ["_APS_CURRENT", _apsmax, true];
	};

	_type = typeOf _curLocalVehicle;
	_curLocalVehicle vehicleChat format ["Приступаем к пополнению боекомплекта %1...", _type];
	private _curFuel = fuel _curLocalVehicle; // запоминаем показатель топлива
	_curLocalVehicle setFuel 0; // сливаем топливо чтобы остановить технику
	if (_isEngineer) then {
		sleep 10;
		// Далее накидывание опыта
		["engineer_veh", ["rearm", _curCaller, 1 ]] spawn bt_fnc_eventScore;
	} else {
		sleep 30;
	}; // Пауза. Инженер 10 сек. Остальные 30 сек.

	[_curLocalVehicle] remoteExec ["custom_service_fnc_vehservicerearm", (fullCrew _curLocalVehicle apply {_x select 0} select {isPlayer _x})];
	sleep 1;
	_curLocalVehicle setFuel _curFuel; // возвращаем топливо на прежний уровень
	_curLocalVehicle vehicleChat format ["%1: Боекомплект пополнен", _type];
};

switch (_type) do
{
	case "ALL": {
		[_objVehicle, _caller] call _fnc_local_serviceRepair;
		sleep 1;
		[_objVehicle, _caller] call _fnc_local_serviceRearm;
		sleep 1;
		[_objVehicle, _caller] call _fnc_local_serviceRefuel;
	};
	case "Repair": {
		[_objVehicle, _caller] call _fnc_local_serviceRepair;
	};
	case "Refuel": {
		[_objVehicle, _caller] call _fnc_local_serviceRefuel;
	};
	case "Rearm": { 
		[_objVehicle, _caller] call _fnc_local_serviceRearm;
	};
	//default { exitWith {}; };
};

if (true) exitWith {};