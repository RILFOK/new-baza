private _level = _this # 0;
private _exp = _this # 1;
private _uid = getPlayerUID player;
if (_level == 1) exitWith {[0,1]};

private _vseZvaniya = missionNamespace getVariable ["LEVELS",[]];

private _index = (_vseZvaniya findIf {(_x # 0) == _level});
private _expNeed = _vseZvaniya # _index # 2;

if (_exp >= _expNeed) then {
	[_uid,"level",_level + 1] remoteExecCall ["bt_db_fnc_changePlayer"];
	player setVariable ["LEVEL",_level + 1,true];
};

private _oldExp = _vseZvaniya # (_index - 1) # 2;
private _expReturn = [_oldExp, _expNeed];

_expReturn
