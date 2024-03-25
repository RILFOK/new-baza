if !(isServer) exitWith {};
// Допустимые начальные имена:
//// 0 - veh_service - Полное обслуживание техники
//// 1 - veh_repair - Ремонт
//// 2 - veh_refuel - Заправка
//// 3 - veh_rearm - Пополнение боекомплекта
private _tempArrVehicle = [];

// Ищем всю технику veh_service и навешиваем Action
_tempArrVehicle = ((allVariables missionNamespace) select {"veh_service" in _x});
{
	[ missionNamespace getVariable _x , 0 ] remoteExec ["custom_service_fnc_vehserviceadd",2];
} forEach _tempArrVehicle;
sleep 1;

// Ищем всю технику veh_repair и навешиваем Action
_tempArrVehicle = ((allVariables missionNamespace) select {"veh_repair" in _x});
{
	[ missionNamespace getVariable _x , 1 ] remoteExec ["custom_service_fnc_vehserviceadd",2];
} forEach _tempArrVehicle;
sleep 1;

// Ищем всю технику veh_refuel и навешиваем Action
_tempArrVehicle = ((allVariables missionNamespace) select {"veh_refuel" in _x});
{
	[ missionNamespace getVariable _x , 2 ] remoteExec ["custom_service_fnc_vehserviceadd",2];
} forEach _tempArrVehicle;
sleep 1;

// Ищем всю технику veh_rearm и навешиваем Action
_tempArrVehicle = ((allVariables missionNamespace) select {"veh_rearm" in _x});
{
	[ missionNamespace getVariable _x , 3 ] remoteExec ["custom_service_fnc_vehserviceadd",2];
} forEach _tempArrVehicle;
sleep 1;

// ["Завершено переопределение списка кастомной обслуживающей техники..."] remoteExec ["hint"];
if (true) exitWith {};