/*
Author: ToxaBes
Description: jump on V while running
*/
private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl    = _this select 0;
_dikCode = _this select 1;
_shift   = _this select 2;
_ctrlKey = _this select 3;
_alt     = _this select 4;  
_handled = false;
if (_shift && _dikCode == 47) then {         
    _jumping = player getVariable ["is_jumping", false];
    if (speed player >= 2 && {stance player == "STAND"} && {vehicle player == player} && {!_jumping}) then {
        player setVariable ["is_jumping", true, true];
        [] spawn {
            _speed = 0.8;
            _height = 3.5;
            _vel = velocity player;
            _dir = direction player;                
            player setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2) + _height];
            [player, "AovrPercMrunSrasWrflDf"] remoteExecCall ["switchMove"];
            player spawn {
                sleep 2;
                _this setVariable ["is_jumping", false, true];
            };
        };
        _handled = true;
    };
};
_handled