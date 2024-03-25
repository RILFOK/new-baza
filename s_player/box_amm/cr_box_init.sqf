if (isServer) then
{
	box_arr = [];
	box_count = 0;
	max_count_box = 5;
};

publicVariable "box_arr";
publicVariable "box_count";
publicVariable "max_count_box";

fnc_iconDrawMap_box = 
{
	_iconType = '\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa';
	_color = [0.5,0,0,0.7];
	_iconSize = 22;
	_text = "Боеприпасы";
	_shadow = 1;
	_textSize = 0.05;
	_textFont = 'puristaMedium';
	_textOffset = 'right';
	{
		_pos = getPosASL _x;
		_dir = getDir _x;
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
	}count box_arr;
};

[] spawn {

	waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
	clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_iconDrawMap_box];
		
	disableSerialization;
	_gps = controlNull;
	while {isNull _gps} do {
		{
			if !(isNil {_x displayctrl 101}) then {
				_gps = _x displayctrl 101
			};
		} count (uiNamespace getVariable "IGUI_Displays");
		sleep 1;
	};
	clientEhDrawGps = _gps ctrlAddEventHandler ["Draw",fnc_iconDrawMap_box];
};
