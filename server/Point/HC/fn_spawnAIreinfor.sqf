

params ["_Point","_REINFORCEMENT"];

private ["_countplayer","_car_number","_tank_number","_second_paras"];
_countplayer = playersNumber east;

_second_paras = FALSE;
_car_number = 2;
_tank_number = 1;

if (_countplayer > 16) then {
    _car_number = 2;
    _tank_number = 2;
};

if (_countplayer > 26) then {
    _car_number = 3;
    _tank_number = 3;
    _second_paras = TRUE;
};

if (_countplayer > 46) then {
    _car_number = 4;
    _tank_number = 4;
};

//хамеры/бронемашины
for "_i" from 1 to _car_number do {
    [_Point,_REINFORCEMENT,Car] call srv_fnc_ReinforVehicle;
    sleep 3;
};
sleep 1;		
//броня
for "_c" from 1 to _tank_number do {
    [_Point,_REINFORCEMENT,Tank] call srv_fnc_ReinforVehicle;
    sleep 5;
};		
// десант на точку
[_Point,6000,random 360,100 + (random 30),usmc_infantry,0] spawn srv_fnc_Paras;
[_Point,6000,random 360,100 + (random 30),usmc_infantry,0] spawn srv_fnc_Parasgosta;

// до десант вне города, если игроков достаточно

if (_second_paras) then {
    sleep 90;
    [_Point,6000,random 360,100 + (random 30),usmc_infantry,800] spawn srv_fnc_Paras;
    [_Point,6000,random 360,100 + (random 30),usmc_infantry,800] spawn srv_fnc_Parasgosta;
};