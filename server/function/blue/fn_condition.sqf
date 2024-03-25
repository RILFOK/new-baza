params ["_player"];
uiSleep 0.1;
private _level = player getVariable ["LEVEL",1];
private _uid = getPlayerUID _player;

//уровни количества красных
private _OPQ1 = 25; // OPFOR Quantyti level 1
private _OPQ2 = 30;	// OPFOR Quantyti level 2
private _OPQ3 = 35;	// OPFOR Quantyti level 3

private _countPlayers = east countSide allPlayers;
private _blueLevel ="";
private _blueCount = west countSide allPlayers;


switch true do {
	case (_countPlayers < _OPQ1):{_blueLevel = "none"};
	case (_countPlayers >= _OPQ1 && {_countPlayers < _OPQ2}):{_blueLevel = "min"};
	case (_countPlayers >= _OPQ2 && {_countPlayers < _OPQ2}):{_blueLevel = "mid"};
	case (_countPlayers >= _OPQ3):{_blueLevel = "max"};
};

if (playerSide == west) then {
	if (_level > 2) then {
		sleep 5;
		hint "Синяя сторона доступна от звания мл. Сержант и выше! Смените слот!";
		"end1" call BIS_fnc_endMission;	
	} else {
		_blueUID = missionNameSpace getVariable "blueUID";
		if !(_uid in _blueUID) then {
			switch (_bluelevel) do {
				case ("none"):{
						hint "Игроков мало для деятельности синей стороны. Смените слот";
						sleep 5;
						"end1" call BIS_fnc_endMission;
				};
				case ("min"):{
					if (_blueCount > 2) then {
						hint "Достигнут предел возможных слотов, требуется больше игроков";
						sleep 5;
						"end1" call BIS_fnc_endMission;
					} else {
					hint format["Приветствую %1! Защити район от UTF!", name player];
					_blueUID pushBackUnique _uid;
					missionNamespace setVariable ["blueUID",_blueUID,true];
					};
				};
				case ("mid"):{
					if (_blueCount > 3) then {
						hint "Достигнут предел возможных слотов, требуется больше игроков";
						sleep 5;
						"end1" call BIS_fnc_endMission;
					} else {
					hint format["Приветствую %1! Защити район от UTF!", name player];
					_blueUID pushBackUnique _uid;
					missionNamespace setVariable ["blueUID",_blueUID,true];
					};
				};
				case ("max"):{
					hint format["Приветствую %1! Защити район от UTF!", name player];
					_blueUID pushBackUnique _uid;
					missionNamespace setVariable ["blueUID",_blueUID,true];
				};
			};
		} else {
			hint "Вы исчерпали количество жизни за синюю сторону, повторите после рестарта";
			sleep 5;
			"end1" call BIS_fnc_endMission;
		};
	};
};


Sleep 5;
//------------------FirstPersonView KeyDisable-----------------
player  spawn fnc_300w;	

//------------------Restricted Items Disable---------------------------
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];

	_restriction = [
		//------------thermovisor----------
		"optic_tws",
		"optic_tws_mg",
		//------------explosives-----------
		"DemoCharge_Remote_Mag",
		"SatchelCharge_Remote_Mag"
	];

	// attachments
	// [silencer, laserpointer/flashlight, optics, bipod]
	_attachments = primaryWeaponItems _unit;
	_optic = format ["%1",  toLower (_attachments select 2)];

		if ((_optic in _restriction) || (_item in _restriction)) then {
			_unit removePrimaryWeaponItem (_attachments select 2);
       		player removeItem _item;
			systemChat "Вы не можете использовать этот предмет!";
		};

}];