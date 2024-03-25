private _earplugsctrl = player getVariable "EARS_text";
if (soundVolume == 1) then {
	1 fadeSound 0.1;
	player setVariable ["EARS",true];
	_earplugsctrl ctrlShow true;
} else {
	1 fadeSound 1;
	player setVariable ["EARS",false];
	_earplugsctrl ctrlShow false;
};
