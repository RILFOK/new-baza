//Extdb3 simple example by ReXcOr
//For arma3.ru/forums/

private["_type","_info","_packet"];

_type = _this select 0;
_info = _this select 1;
_packet = [_type,_info];
HPAwesomeQuery pushBack _packet;

[] spawn {
	_packet = HPAwesomeQuery deleteAt 0;
	if!(isNil {_packet}) then {
		_act = _packet select 0;
		_info = _packet select 1;
		switch _act do {
			case "save" : {
				"Extdb3" callExtension format ["0:%1:savePlayer:%2:%3:%4:%5", PROTOCOL, _info select 0, _info select 1, _info select 2, _info # 3];
			};
			case "load" : {
				_getData = ((call compile ("Extdb3" callExtension format ["0:%1:loadPlayer:%2", PROTOCOL, _info select 0])) select 1) select 0;
				if !(isNil {_getData}) then {
					_zvanie = _getData select 0;
					_zv = _zvanie # 0;
					_param = _zvanie # 1;
					_bal = _zvanie # 2;
					_admin = _zvanie # 3;
					_kick = _zvanie # 4;
					_dostup = _getData select 1;
					_green = _dostup # 0;
					_avia = _dostup # 1;
					_unit = _info select 1;
					missionNamespace setVariable [format ["ZVANIE_%1",getplayeruid _unit],_zv,true];
					missionNamespace setVariable [format ["PARAMETR_%1",getplayeruid _unit],_param,true];
					missionNamespace setVariable [format ["BAL_%1",getplayeruid _unit],_bal,true];
					missionNamespace setVariable [format ["ADMIN_%1",getplayeruid _unit],_admin,true];
					missionNamespace setVariable [format ["KICK_%1",getplayeruid _unit],_kick,true];
					missionNamespace setVariable [format ["GREEN_%1",getplayeruid _unit],_green,true];
					missionNamespace setVariable [format ["PILOT_%1",getplayeruid _unit],_avia,true];
				} else {
					_unit = _info select 1;
					"Extdb3" callExtension format  ["0:%1:newPlayer:%2:%3:%4:%5",PROTOCOL, getplayeruid _unit, name _unit,[1,0,0,0,0],[0,0]];
				};
			};
		};
	};
};