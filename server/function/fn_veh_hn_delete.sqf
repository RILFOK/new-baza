
//-------------------------Haron
// deletewreck

if !(isServer) exitwith {};

(_this # 0) removeAllMPEventHandlers "MPKilled";

private _delay = 120;
if (((_this # 1) # 0) <= 130) then {_delay = ((_this # 1) # 0) - 10;};

if (((_this # 1) # 1) == True) then {_delay = 120};

sleep _delay; 
deleteVehicle (_this # 0);

