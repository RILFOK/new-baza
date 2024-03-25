params ["_player","_vehicle","_dopusk"];
private ["_enemyAA_mode4","_enemyAA_mode5"];
private _exp = 0.25;

waitUntil {
	sleep 8;
	((((getPos _player) # 2) > 10) || (_player == (vehicle _player)));
};

//закончить скрипт, если вышел из техники
if (_player == (vehicle _player)) exitwith {};

while {!(isTouchingGround _vehicle) && (_player in _vehicle)} do {
	sleep 30;
	if (_dopusk in [1,2,3]) then {
		[_player,_exp] spawn bt_fnc_addExp;
		_leader = leader (group _player);
		if (_leader != _player) then {
			[_leader,0.1] spawn bt_fnc_addExp;
		};
	} else {
		_enemyAA_mode4 = missionNameSpace getvariable ["_enemyAA_mode4", []];
		_enemyAA_mode5 = missionNameSpace getvariable ["_enemyAA_mode5", []];
		switch _dopusk do {
			case 4: { 
				if !(_vehicle in _enemyAA_mode4) then {
					
					_enemyAA_mode4 pushBackUnique _vehicle;
					missionNameSpace setvariable ["_enemyAA_mode4",_enemyAA_mode4];
				};
				
				if (_vehicle in _enemyAA_mode4) then {
					
					if (random 1 < 0.2 ) then {
						[_enemyAA_mode4,[]] spawn srv_fnc_enemyairCycleAA;
					};
				};
		
			};
			case 5: { 
				if !(_vehicle in _enemyAA_mode5) then {
					
					_enemyAA_mode5 pushBackUnique _vehicle;
					missionNameSpace setvariable ["_enemyAA_mode5",_enemyAA_mode5];
				};
				
				if (_vehicle in _enemyAA_mode5) then {

					if (random 1 < 0.2 ) then {
						[[],_enemyAA_mode5] spawn srv_fnc_enemyairCycleAA;
					};
				};

			};
		};
	};	
};



_enemyAA_mode4 = missionNameSpace getvariable ["_enemyAA_mode4", []];
_enemyAA_mode5 = missionNameSpace getvariable ["_enemyAA_mode5", []];

switch _dopusk do {
	case 4: { 
		_enemyAA_mode4 = _enemyAA_mode4 - [_vehicle];
		missionNameSpace setvariable ["_enemyAA_mode4", _enemyAA_mode4];
	};
	case 5: { 
		_enemyAA_mode5 = _enemyAA_mode5 - [_vehicle];
		missionNameSpace setvariable ["_enemyAA_mode5", _enemyAA_mode5];
	};
	default {};
};

// если игрок все еще в технике, запустить скрипт заново

if ((_player in _vehicle) && (isTouchingGround _vehicle) && (alive _vehicle) && (alive _player)) then {
	[_player,_vehicle,_dopusk] spawn BT_fnc_time_in_sky;
};