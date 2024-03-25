uiSleep 10;

_green = player getVariable ["GREEN",0];

if ((playerSide == independent)) then {
	uiSleep 3;
	if (_green == 1) then {
		hint format["Привет %1! Время пакостить ;)", name player];		
	} else {
		hint "У Вас нет доступа к зеленой стороне. Перезайдите за другую сторону или будете кикнуты через 10 секунд";
		uiSleep 10;

		"end1" call BIS_fnc_endMission;
	};
};