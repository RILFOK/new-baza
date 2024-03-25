if !(isServer) exitWith {};
// 0 = service - Полное обслуживание техники
// 1 = repair - Ремонт
// 2 = refuel - Заправка
// 3 = rearm - Пополнение боекомплекта
params [ ["_objVehicle", objNull, [objNull]], ["_type",0,[0]] ];
if (_objVehicle isEqualTo objNull) exitWith {}; // Если не передали объект - выходим отсюда
if !( (_type >= 0) AND (_type <= 3) ) exitWith {};

private _actions = [
	[0, "Обслуживание","ALL","\a3\ui_f\data\igui\cfg\holdactions\holdaction_loaddevice_ca.paa"],
	[1, "Ремонт","Repair","\a3\ui_f_oldman\data\igui\cfg\holdactions\repair_ca.paa"],
	[2, "Заправка","Refuel","\a3\ui_f_oldman\data\igui\cfg\holdactions\refuel_ca.paa"],
	[3, "Пополнение","Rearm","\a3\ui_f\data\igui\cfg\holdactions\holdaction_loaddevice_ca.paa"]
];
private _action = _actions#_type;
_objVehicle allowService 0; // Отключаем "штатное" обслуживание.

[	// Добавление HoldAction на технику
	_objVehicle,
	_action#1, // Описание события
	_action#3, // Иконка события
	_action#3, // Иконка прогресса события
	toString {
		(alive _target) AND {alive _this} AND {isPlayer _this} AND {_target distance _this <= 35} AND {vehicle _this != _this} AND { (driver vehicle _this isEqualTo _this) OR {gunner vehicle _this isEqualTo _this} OR {commander vehicle _this isEqualTo _this} } AND {_target != vehicle _this}
	},// условия при котором будет показано действие
	toString {
		(alive _target) AND {alive _caller} AND {isPlayer _caller} AND {_target distance _caller <= 35} AND {vehicle _caller != _caller} AND { (driver vehicle _caller isEqualTo _caller) OR {gunner vehicle _caller isEqualTo _caller} OR {commander vehicle _caller isEqualTo _caller}} AND {_target != vehicle _caller}
	}, // Усдлвие проверки в процессе выполнения
	{}, // Код выполняемый при старте
	{}, // коды выполняемый в процессе прогресса
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_caller, _arguments#0] spawn custom_service_fnc_vehservicescript; // Вызов функции 
	}, // код по окончании прогресса
	{}, // код выполняемы при прерывании
	[_action#2], // Аргументы, передаваемые в скрипты как _this select 3
	3, // длительность в секундах
	-1000, // приоритет
	false,	// удалить при завершении
	false	// в бессознательном состоянии
] remoteExec ["BIS_fnc_holdActionAdd", 0, _objVehicle];

if (true) exitWith {};