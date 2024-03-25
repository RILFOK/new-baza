//=============стамина
if (missionNamespace getVariable "stamina") then {
	{
		_x enableStamina true;
		_x enableFatigue true;
	} forEach (playableUnits);
    } else {
    {
		_x enableStamina false;
		_x enableFatigue false;
	} forEach (playableUnits);
};

//=============Триаска
if (missionNamespace getVariable "traska") then {
	{
		_x setCustomAimCoef 1; 
	} forEach (playableUnits);
    } else {
        {
	    	_x setCustomAimCoef 0; 
	    } forEach (playableUnits);
};	


//=============Маркер на карте
if (missionNamespace getVariable "MapNV") then {
	disableMapIndicators [true,true,false,true];
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "draw";
    };


//=============первое лицо
while {missionNamespace getVariable "3pw"} do {
player switchCamera "INTERNAL";
(vehicle player) switchCamera "Internal";
waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};
};