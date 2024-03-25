fnc_iconDrawveh_map = compilefinal
"
	_color = [0.5,0,0,0.7];
	_iconSize = 26;
	_text = '';
	_shadow = 1;
	_textSize = 0.05;
	_textFont = 'puristaMedium';
	_textOffset = 'right';
	{
		_val_veh = call compile format['%1', _x];
		_iconType = getText (configFile >> 'CfgVehicles' >> typeOf _val_veh >> 'icon');
		if ({alive _val_veh} count crew _val_veh == 0) then
		{
			_pos = getPosASL _val_veh;
			_dir = getDir _val_veh;
			(_this select 0) drawIcon [
								_iconType,
								_color,
								_pos,
								_iconSize,
								_iconSize,
								_dir,
								_text,
								_shadow,
								_textSize,
								_textFont,
								_textOffset
							]
		};
	}count allveh;
";
[] spawn {

	waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
	clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_iconDrawveh_map];
		
	disableSerialization;
	_gps = controlNull;
	while {isNull _gps} do {
		{
			if (['311',(str _x),FALSE] call BIS_fnc_inString) then {
				if !(isNil {_x displayctrl 101}) then {
					_gps = _x displayctrl 101;
				};
			};
		} foreach (uiNamespace getVariable "IGUI_Displays");
		sleep 1;
	};
	clientEhDrawGps = _gps ctrlAddEventHandler ["Draw",fnc_iconDrawveh_map];
};