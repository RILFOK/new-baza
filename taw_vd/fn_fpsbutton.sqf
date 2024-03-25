private _display = finddisplay 2900;
private _ctrl = _display displayCtrl 2923;

if (player getVariable ['DisplayFpsON',true]) then {
	_ctrl ctrlSetText "FPS ON"; 
	player setVariable ['DisplayFpsON',false];
	_ctrl ctrlEnable False; 
	sleep 2;
	_ctrl ctrlEnable true; 
	} else {
	_ctrl ctrlSetText "FPS OFF";
	player setVariable ['DisplayFpsON',true];
	_ctrl ctrlEnable False; 
	sleep 2;
	_ctrl ctrlEnable true; 
	};
