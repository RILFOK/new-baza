if !(isServer) exitWith {};
params [ ["_objVehicle", objNull, [objNull]]];

if (_objVehicle isEqualTo objNull) exitWith {}; // Если не передали объект - выходим отсюда

_objVehicle setVariable["_APS_MAX", 2, true];
_objVehicle setVariable["_APS_CURRENT", 2, true];
_objVehicle setVariable["_APS_ENABLED", false, true];

_objVehicle setVariable["_workRange", 25, true];
_objVehicle setVariable["_safeRange", 10, true];
_objVehicle setVariable["_vectorMagnitude", 130, true];

[	// Добавление HoldAction на технику
	_objVehicle,
	"<t color='#ff9100'>ВКЛ/ВЫКЛ</t> - APS", // Описание события
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_csat_ca.paa", // Иконка события
	"\a3\ui_f_orange\Data\CfgOrange\Missions\action_csat_ca.paa", // Иконка прогресса события
	toString {
		(driver _target == _this || gunner _target == _this) 
	},// условия при котором будет показано действие
	toString {
		(driver _target == _caller || gunner _target == _caller) 
	}, // Усдлвие проверки в процессе выполнения
	{}, // Код выполняемый при старте
	{}, // коды выполняемый в процессе прогресса
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _status = _target getVariable ["_APS_ENABLED", false];
		if !(_status) then {
			_target vehicleChat format["APS: Включено. [%1/%2]", _target getVariable ["_APS_CURRENT", 0], _target getVariable["_APS_MAX", 0]];
			_target setVariable ["_APS_ENABLED", true, true];
			[_target] remoteExec ["aps_fnc_apscycle"];
		} else {
			_target setVariable ["_APS_ENABLED", false, true];
		};
	}, // код по окончании прогресса
	{}, // код выполняемы при прерывании
	[], // Аргументы, передаваемые в скрипты как _this select 3
	0.2, // длительность в секундах
	-1000, // приоритет
	false,	// удалить при завершении
	false	// в бессознательном состоянии
] remoteExec ["BIS_fnc_holdActionAdd", 0, _objVehicle];