waitUntil {
	player == player;
};

player remoteExecCall ["bt_db_fnc_selectPlayer",2];

waitUntil {
	uiSleep 0.2;
	!((player getVariable ["player_data",[]]) isEqualTo [])
};

private _data = player getVariable "player_data";

private _id = _data # 0;
private _name = _data # 1;
private _anotherName = call compile (_data # 2);
private _level = _data # 4;
private _exp = _data # 5;

private _actualName = name player;

if (_actualName != _name) then {
	if !(_actualName in _anotherName) then {
		_anotherName pushBack _anotherName;
		[_id,"anotherName",_anotherName]; remoteExecCall ["bt_db_fnc_changePlayer",2];
	};
};

private _zvanie = _level call bt_client_fnc_getZvanie;
private _expNeed = [_level,_exp] call bt_client_fnc_getExpNeed;
private _percents = ((_expNeed # 0) / ((_expNeed # 1) / 100));
