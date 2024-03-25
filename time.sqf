/*
Author:	ToxaBes
Description: Change in-game time speed depends of daytime
*/
private ["_dayK", "_nightK", "_delay", "_null"];
_dayK   = 1;
_nightK = 2;
_delay  = 10;
if (isServer) then {
    lastWeatherTime = 0; publicVariable "lastWeatherTime";        
    while {true} do {
        if ((dayTime >= 4 && dayTime <= 5) || (dayTime >= 19 && dayTime <= 20)) then {
            setTimeMultiplier _dayK;
        } else {
            if (dayTime > 20 || dayTime < 4) then {
                setTimeMultiplier _nightK;            
            } else {
                setTimeMultiplier _dayK;
            };
        };        
        sleep _delay;
    };
};