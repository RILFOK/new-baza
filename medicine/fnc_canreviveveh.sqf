_target = _this select 0;
_return = false;

// Если массив "global_med_vehicles" не объявлен в "init.sqf" то пройтись по всем названиям объектов и создать массив из начинающихся с "veh_med"
if (isNil "global_med_vehicles") then {
  private _temp = ((allVariables missionNamespace) select {"veh_med" in _x});
  missionNamespace setVariable ["global_med_vehicles", _temp];
};

if (_target isKindOf "Man" && (alive _target) && _target getVariable "isUnconscious" &&  !(_target getVariable "isBleeding") &&  !(_target getVariable "isDragged") &&  !(_target getVariable "isCarryed") && _target distance player < 2) then 
{
//	if ((_target distance veh_med < 10) || (_target distance veh_med_1 < 10) || (_target distance veh_med_2 < 10) || (_target distance veh_med_3 < 10) || (_target distance veh_med_4 < 10) || (_target distance veh_med_5 < 10) || (_target distance veh_med_6 < 10) || (_target distance veh_med_7 < 10) || (_target distance veh_med_8 < 10) || (_target distance veh_med_9 < 10)) then
// global_med_vehicles apply {missionNamespace getVariable _x} преобразует массив названий в массив объектов непосредственно при использовании
// Когда в массиве сохранялись объекты - он не обновлялся при возрождении техники
// Влияние на производительность - около микросекунды на объект, не даст заметного снижения fps даже при 100 медичках в поле
	if (count ((global_med_vehicles apply {missionNamespace getVariable _x}) inAreaArray [getPos _target, 10, 10, 0, false, 10]) > 0) then
	{
		_return = true;
	};
};
_return;