/*private _time = _this;
private _timeGame = serverTime;
private _timeNeed = 20;
private _timeInGame = 0;
private _uid = getPlayerUID player;

player setVariable ["TIMEINGAME",[_time,_timeGame],true];

while {player == player} do {
	uiSleep 3;
	_timeInGame = ceil(_time + (serverTime - _timeGame));

	if (_timeInGame >= _timeNeed) exitWith {
		[_uid,"time",_timeInGame] remoteExecCall ["bt_db_fnc_changePlayer",2];
		[_uid,"level",1] remoteExecCall ["bt_db_fnc_changePlayer",2];
		hint "Обновился";
	};
};
