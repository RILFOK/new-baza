if (!hasInterface && !isServer) exitwith {};

enableSaving [false,false];

// Попытка отключить радио переговоры ботов
enableSentences false;
enableRadio false;

//---------------------------ускорение времени ночью
_time = [] spawn {_this call compile preProcessFileLineNumbers "time.sqf"};
[] spawn {_this call compile preProcessFileLineNumbers "medicine\heal.sqf"};

//спрятанные объекты 
[] execVM "serverconfig\hiddenobjects.sqf";

if (isServer) then {
	
	fnc_cleanup = compileFinal preprocessFileLineNumbers "s_player\cleanup.sqf";
	_null1 = [
		[worldSize/2,worldSize/2,0],
		worldSize/2,
		0,
		0.1,
		false,
		600
	] spawn fnc_cleanup;
	// Заглушка от флуда предупреждениями
	CBA_display_ingame_warnings = false;
	publicVariable "CBA_display_ingame_warnings";

	CBA_display_ingame_warnings_local = false;
	publicVariable "CBA_display_ingame_warnings_local";
};
/*
	fnc_cleanupbase = compileFinal preprocessFileLineNumbers "s_player\cleanupbase.sqf";
	_null2 = [
		"delallbase",
		((getMarkerSize "delallbase") call BIS_fnc_greatestNum),
		0,
		0.1,
		false,
		120
	] spawn fnc_cleanupbase;
};
*/
/* Реклама платёжки
_reklama = [] spawn {
	while {true} do {
		uiSleep 600;
		[east,"HQ"] sideChat "Наши контакты и реквизиты для помощи проекту Вы найдете на карте";
	};
};
*/
west setFriend [resistance, 0];

{
    _x params [["_chan",-1,[0]], ["_noText","true",[""]], ["_noVoice","true",[""]]];
    _chan enableChannel [(_noText != "true"), (_noVoice != "true")];
} forEach getArray (missionConfigFile >> "disableChannels");
[] call TB_fnc_createChannels;

{
	_x addEventHandler ["CuratorObjectPlaced", {
		params ["_curator", "_entity"];
		private _crewEntity = crew _entity;
		if (_crewEntity isEqualTo [] && {_entity emptyPositions "" == 0}) exitWith {};
		_crewEntity pushBackUnique _entity;
		{
			_x addEventHandler ["Killed",{
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				// Выбрать в зависимости от версии
				// [_unit,_killer,_instigator,0.2] spawn bt_fnc_addScore;
				["kill",[_unit,_killer,_instigator, 0.2]] spawn bt_fnc_eventScore;
			}];
		} forEach (_crewEntity);
	}];	
} forEach allCurators;
del = false;

[] execVM "spectrum_device.sqf";
[] execVM "sa_ewar.sqf";