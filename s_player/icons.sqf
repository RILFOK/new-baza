bt_medicine_fnc_iconDrawMap = {
	private ["_shadow","_textSize","_textFont","_textOffset","_drawOptions"];

	_drawOptions = player getVariable ["drawOptions",0];
    _shadow = 1;
    _textSize = 0.04;
    _textFont = 'puristaMedium';
    _textOffset = 'right';
    {
        private ["_unit","_iconType","_color","_pos","_iconSize","_dir","_text","_pos_lead","_capx"];
        _unit = vehicle _x;
        if (side (group _x) == playerSide) then
        {
            _iconType = [_unit] call bt_medicine_fnc_icontype;
            _color = [_x] call bt_medicine_fnc_iconcolor;
            _pos = getPosASL _unit;
            _iconSize = [_unit] call bt_medicine_fnc_iconsize;
            _dir = getDir _unit;
            _text = [_unit] call bt_medicine_fnc_icontext;
            _pos_lead = position (leader _unit);

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
			];
			(_this select 0) drawLine [
				_pos,
				_pos_lead,
				_color
			];
        };
    } count (allplayers + allUnitsUav)
};

bt_medicine_fnc_icontype = {
	private ["_unit","_icon"];
	_unit = _this select 0;
	_icon = _unit getVariable ["icontype",""];
	if (_icon == "") then {
		_icon = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "icon");
		_unit setVariable ["icontype",_icon];
	};
	_icon;
};

bt_medicine_fnc_iconcolor = {
	private ["_unit","_color","_alpha","_xz","_yz","_col1","_colorX","_colorZ","_players"];
	_unit = _this select 0;
	_alpha = 0.9;

	/*
	_unitGroup = true;
	{
	_unitGroup = group _x;
	} forEach allUnits;
	*/
	
	_groupP = group _unit;
	
	if (_unit getVariable "isUnconscious" && {_unit getVariable "isBleeding" && {_unit getVariable "isHostage"}}) exitWith {_color = [0,0,0.5,_alpha];_color};
	if (_unit getVariable "isUnconscious" && {(_unit getVariable "isBleeding")}) exitWith {_color = [1,1,0,_alpha];_color};
	if (_unit getVariable "isUnconscious" && {!(_unit getVariable "isBleeding")}) exitWith {_color = [1,0.4,0,_alpha];_color};
	
	_color = _groupP getVariable ["groupColor", []];

	if (_color isEqualTo []) then {
		_color = 
			[0.5,
			[0, 1] call BIS_fnc_randomNum,
			[0, 1] call BIS_fnc_randomNum,
			1];
	_groupP setVariable ["groupColor", _color];
	};	
	_color;
};

bt_medicine_fnc_iconsize = {
	private ["_unit","_size"];
	_unit = _this select 0;
	if (_unit isKindOf "Man" && {isFormationLeader _unit}) exitWith {_size = 26;_size;};
	if (_unit isKindOf "Man") exitWith {_size = 22;_size;};
	if (_unit isKindOf "LandVehicle") exitWith {_size = 28;_size;};
	if (_unit isKindOf "Air") exitWith {_size = 28;_size;};
	if (_unit isKindOf "Ship") exitWith {_size = 26;_size;};
};

bt_medicine_fnc_icontext = {
	private ["_count_crew","_unit","_unit_uav","_unit_type","_text","_unit_name"];
	_unit = _this select 0;
	_unit_type = _unit getVariable ["unit_type",""];

	if (_unit_type == "") then {
		_unit_type = roleDescription _unit;
		_unit setVariable ["unit_type",_unit_type];
	};
	_unit_name = name (crew _unit select 0);
	_text = "";

	if ((ctrlMapScale ((findDisplay 12) displayCtrl 51)) < 0.01) then 
	{
		_text = format ["%1",_unit_name];
	};
	if (isFormationLeader _unit) then 
	{
		_text = _text + "("+groupId (group _unit)+")";
	};
	if (_unit isKindOf "LandVehicle" || _unit isKindOf "Air" || _unit isKindOf "Ship") then {
		_text = "";
		if ((ctrlMapScale ((findDisplay 12) displayCtrl 51)) < 0.01) then 
			{
			_count_crew = 0;
			_count_crew = ((count crew _unit) - 1);
			
			if (_count_crew > 0) then {
				if (!isNull driver _unit) then {
					_text = format ["%1 [%2] +%3",_unit_name,_unit_type,_count_crew];
				} else {
					_text = format ["[%1] %2 +%3",_unit_type,_unit_name,_count_crew];
				};
			} else {
				if (!isNull driver _unit) then {
					_text = format ["%1 [%2]",_unit_name,_unit_type];
				} else {
					_text = format ["[%1] %2",_unit_type,_unit_name];
				};
			};
			if (!isPlayer _unit) then {
				//_au = ["I_UAV_01_F","B_UAV_01_F","O_UAV_01_F","I_UAV_02_F","O_UAV_02_F","I_UAV_02_CAS_F","O_UAV_02_CAS_F","B_UAV_02_F","B_UAV_02_CAS_F","O_UAV_01_F","O_UGV_01_F","O_UGV_01_rcws_F","I_UGV_01_F","B_UGV_01_F","I_UGV_01_rcws_F","B_UGV_01_rcws_F","B_GMG_01_A_F","B_HMG_01_A_F","O_GMG_01_A_F","O_HMG_01_A_F","I_GMG_01_A_F","I_HMG_01_A_F"];
				//_iau = ({typeOf _unit == _x} count _au) > 0;

				if (isUavConnected _unit) then {	
					_unit_uav = (UAVControl _unit) select 0;	
					_text = format ["%1 [%2]",name _unit_uav,_unit_type]; _text;
				} else {
					_text = format ["[AI] [%1]",_unit_type]; _text;
				};
				
			};
		};
		if (!isNil {_unit getVariable "veh_group"}) then
		{
			_text = _text + "(" + groupid (_unit getVariable "veh_group") + ")";
		}else 
		{
			if (isFormationLeader _unit) then 
			{
				_text = _text + "("+ groupId (group _unit)+")";
			};
		};
	};
	_text;
};

if (missionNamespace getVariable "MapNV") then {
	disableMapIndicators [true,true,false,true];
	((finddisplay 12) displayctrl 51) ctrlremovealleventhandlers "draw";
    } else {
		[] spawn {
			sleep 0.1;
			waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
			clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",bt_medicine_fnc_iconDrawMap];
		};
};