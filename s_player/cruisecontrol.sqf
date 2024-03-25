/*
Cruise Control by Haron for land vehicles and ships


*/

if !(((vehicle player) iskindof "Ship") || ((vehicle player) iskindof "Car") || ((vehicle player) iskindof "Tank")) exitwith {};

private _cruisecontrol_hn_id = player addAction [
    "Круиз-контроль",
    {   
        private _speed = round (speed (vehicle player));
        (vehicle player) setCruiseControl [_speed, true];
        player setvariable ["_cruisecontrol_hn_speed", _speed];
        hintsilent format ["Включен круиз-контроль со значением \n %1 km/h",_speed];
        }, 
    0, -10, false, false, "", 
    ""
];

player setvariable ["_cruisecontrol_hn_id", _cruisecontrol_hn_id];

private _cruisecontrol_hn_displayEH = (findDisplay 46) displayAddEventHandler ["keyDown", {
    params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
    private ["_cruisecontrol_hn_speed","_vehtype","_maxspeed","_slowspeed"];
    
    if !(_key in [18,16]) exitwith {FALSE};

    _cruisecontrol_hn_speed = player getvariable ["_cruisecontrol_hn_speed", 0];
    _vehtype = typeof (vehicle player);
    _maxspeed = (getNumber (configfile >> "CfgVehicles" >> _vehtype >> "maxSpeed")) + 2;
    //_slowspeed = _maxspeed*(getNumber (configfile >> "CfgVehicles" >> _vehtype >> "slowSpeedForwardCoef"));
    if (_key == 18) then {
        _cruisecontrol_hn_speed = _cruisecontrol_hn_speed + 5;
        if (_cruisecontrol_hn_speed > _maxspeed) then { _cruisecontrol_hn_speed = _maxspeed};
        (vehicle player) setCruiseControl [_cruisecontrol_hn_speed, true];
        hintsilent format ["Значение круиз-контроля увеличено до \n %1 km/h",_cruisecontrol_hn_speed];
        player setvariable ["_cruisecontrol_hn_speed", _cruisecontrol_hn_speed];
    };

    if (_key == 16) then {
        _cruisecontrol_hn_speed = _cruisecontrol_hn_speed - 5;
        if (_cruisecontrol_hn_speed < 0) then { _cruisecontrol_hn_speed = 0};
        (vehicle player) setCruiseControl [_cruisecontrol_hn_speed, true];
        hintsilent format ["Значение круиз-контроля уменьшено до \n %1 km/h",_cruisecontrol_hn_speed];
        player setvariable ["_cruisecontrol_hn_speed", _cruisecontrol_hn_speed];
    };

    true

}];

player setvariable ["_cruisecontrol_hn_displayEH",_cruisecontrol_hn_displayEH];




/*

Пониженная передача
*/
private _title = "Включить пониженную";
private _downShiftOn = player addAction
[
    _title,
    {
        private _direction=
        {
            private _vel = _this select 0;
            private _veh = _this select 1;
            
            private _vdir = (_vel select 0) atan2 (_vel select 1);
            if (_vdir < 0) then {
                _vdir = _vdir + 360
            };

            private _dir = getDir _veh;
            if (_dir < 0) then {
                _dir = _dir + 360
            };
            
            _vdir = _vdir-_dir;
            
            if (abs(_vdir) < 15) then {
                true
            } else {
                false
            };
        };

        player setVariable ["NWG_DownShift_ON", true];
        private _veh = vehicle player;

        private _vehtype = typeof _veh;
        private _maxspeed = (getNumber (configfile >> "CfgVehicles" >> _vehtype >> "maxSpeed")) + 2;
        private _max = _maxspeed*(getNumber (configfile >> "CfgVehicles" >> _vehtype >> "slowSpeedForwardCoef"));

        if (_max > 22) then {
            _max = 22;
        };

        private _min = _max - 2;
        
        vehicle player setVariable ["NWG_DownShift_Off",true];

        while {(player != _veh) && (player getVariable ["NWG_DownShift_ON", false]) && (player isEqualTo (driver _veh)) && (canMove _veh)} do
        {
            private _speed = speed _veh;
            private _vel = velocity _veh;	
            if (_speed < _min) then
            {
                if (((inputAction "MoveForward") isEqualTo 1) || {(inputAction "CarFastForward") isEqualTo 1}) then
                {
                    if (_speed > 0) then
                    {			
                        if ([_vel, _veh] call _direction) then
                        {
                            _vel = [(_vel select 0)*1.1, (_vel select 1)*1.1, (_vel select 2)*1.1];
                            _veh setVelocity _vel;
                        };
                    };		
                };		
            }
            else
            {	
                if (_speed > _max) then{		
                    if ([_vel, _veh] call _direction) then
                    {
                        _vel = [(_vel select 0)*0.7, (_vel select 1)*0.7, (_vel select 2)*0.7];
                        _veh setVelocity _vel;
                    };
                };
            };
            uisleep 0.1;
        };
    },nil,0,false,true, "", "!(vehicle player getVariable ['NWG_DownShift_Off', false]) && !(isNull objectParent player)"
];

private _title = "Выключить пониженную";
private _downShiftOff = player addAction [
    _title, 
    {
        player setVariable ["NWG_DownShift_ON", false];
        vehicle player setVariable ["NWG_DownShift_Off",false];
    },nil,0,false,true, "", "(vehicle player getVariable ['NWG_DownShift_Off', false]) && !(isNull objectParent player)"
];
        
if (!isNil "_downShiftOn") then {player setvariable ["_downShiftOn_hn_id",_downShiftOn];};
if (!isNil "_downShiftOff") then {player setvariable ["_downShiftOffn_hn_id",_downShiftOff];};