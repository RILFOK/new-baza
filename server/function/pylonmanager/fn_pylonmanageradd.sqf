// Скрипт навешивания holdAction на объект (самолет/вертолет) с вызовом пилот менеджера
if !(isServer) exitWith {};
params [ ["_objVehicle", objNull, [objNull]] ];
if (_objVehicle isEqualTo objNull) exitWith {}; // Если не передали объект - выходим отсюда
private _type = 0;

private _actions = [
	[0, "Управление пилонами","ALL","\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa"]
];
private _action = _actions#_type;

[	// Добавление HoldAction на технику
	_objVehicle,
	_action#1, // Описание события
	_action#3, // Иконка события
	_action#3, // Иконка прогресса события
	toString {
		( not isEngineOn _target ) AND { [ _target, _this, 1 ] call pylon_manager_fnc_pylonmanagercheck; }
	},// условия при котором будет показано действие
	toString {
		( not isEngineOn _target ) AND { [ _target, _this, 1 ] call pylon_manager_fnc_pylonmanagercheck; }
	}, // Усдлвие проверки в процессе выполнения
	{}, // Код выполняемый при старте
	{}, // коды выполняемый в процессе прогресса
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] spawn pylon_manager_fnc_pylonmanagerscript; // Вызов функции 
	}, // код по окончании прогресса
	{}, // код выполняемы при прерывании
	[], // Аргументы, передаваемые в скрипты как _this select 3
	3, // длительность в секундах
	-1000, // приоритет
	false,	// удалить при завершении
	false	// в бессознательном состоянии
] remoteExec ["BIS_fnc_holdActionAdd", 0, _objVehicle];

if (true) exitWith {};