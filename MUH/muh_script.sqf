// g_crafts = [
// 	["B_Heli_Light_01_dynamicLoadout_F", "", "Pawnee", "pawnee_1", player],
// 	["B_Heli_Light_01_dynamicLoadout_F", "{ _new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new;", "Pawnee2", "pawnee_2", nil]
// ];

//private _varname = "g_crafts";

// params ["_varname"];
// systemChat str _varname;

private _varname = _this select 3 select 0;

private _crafts = [missionNamespace, _varname, nil] call BIS_fnc_getServerVariable;
if (isNil "_crafts") exitWith {hint "Can't get crafts array;"}; 

//systemChat str _varname;

createDialog "MUH_dialog_airControls";

private _btn = (finddisplay 2580 displayctrl 1200);
//_btn text "Вызвать";
_btn ctrlAddEventHandler [
	"ButtonClick", 
//	"systemChat str [(finddisplay 2580 displayctrl 1100) lbData 0, lbCurSel (finddisplay 2580 displayctrl 1100)]; 
	"[(finddisplay 2580 displayctrl 1100) lbData 0, lbCurSel (finddisplay 2580 displayctrl 1100)] remoteExec [""MUH_fnc_spawnCraft"", 2]; 
	closeDialog 1;"
];
_btn ctrlSetText "Вызвать технику";
_btn ctrlSetTooltip "Вызвать технику";
_btn ctrlSetTooltipColorBox [1, 0, 0, 1];
_btn ctrlSetTooltipColorShade  [ 0 , 0 , 0 , 1 ] ;
_btn ctrlSetTooltipColorText [1,1, 1, 1];
_btn ctrlEnable false;

//systemChat str _crafts;
//systemChat str _varname;  MUH_fnc_despawnCraft

// Пробуем кнопку вернуть
private _btn_back = (finddisplay 2580 displayctrl 1201);
_btn_back ctrlAddEventHandler [
	"ButtonClick", 
//	"systemChat str [(finddisplay 2580 displayctrl 1100) lbData 0, lbCurSel (finddisplay 2580 displayctrl 1100)]; 
	"[(finddisplay 2580 displayctrl 1100) lbData 0, lbCurSel (finddisplay 2580 displayctrl 1100)] remoteExec [""MUH_fnc_despawnCraft"", 2]; 
	closeDialog 1;"
];
_btn_back ctrlSetText "Вернуть технику";
_btn_back ctrlSetTooltip "Вернуть технику. Внимание!!! Всех высадит и техника исчезнет!!!";
_btn_back ctrlSetTooltipColorBox [1, 0, 0, 1];
_btn_back ctrlSetTooltipColorShade  [ 0 , 0 , 0 , 1 ] ;
_btn_back ctrlSetTooltipColorText [1,1, 1, 1];
_btn_back ctrlEnable false;


// Пробуем кнопку вернуть уничтоженную
private _btn_destroy = (finddisplay 2580 displayctrl 1202);
_btn_destroy ctrlAddEventHandler [
	"ButtonClick", 
	"["+ str _varname + "] remoteExec [""MUH_fnc_cleanup"", 2]; 
	closeDialog 1;"
];
//_btn_destroy ctrlEnable false;
//[""a_green_base""] remoteExec [""MUH_fnc_cleanup"", 2]
_btn_destroy ctrlSetText "Отозвать уничтоженную технику";
_btn_destroy ctrlSetTooltip "Отозвать уничтоженную технику";
_btn_destroy ctrlSetTooltipColorBox [1, 0, 0, 1];
_btn_destroy ctrlSetTooltipColorShade  [ 0 , 0 , 0 , 1 ] ;
_btn_destroy ctrlSetTooltipColorText [1,1, 1, 1];



//systemChat str _crafts;
private _lb = (finddisplay 2580 displayctrl 1100);
{
	//systemChat str _x;
	private ["_class", "_marker", "_init", "_name", "_veh"];
	_class = _x select 0;
	_marker = _x select 1;
	_init = _x select 2;
	_name = _x select 3;
	_veh = _x select 4;

	_lb lbAdd _name;
	// private _color = [1, 0, 0, 1];
	
	private _status = 0; //0 - not spawned, 1 - spawned, 2 - dead
	if (isNil "_veh") then { // not spawned
		_status = 0;
	} else {
		if (alive _veh && {!isNull _veh}) then {
			_status = 1; // alive
		} else {
			_status = 2; // dead
		};
		// if (isNull _veh) then {
		// 	_status = 0; // dead and deleted
		// };
	};
	private _color = [[0,1,0,1], [1,1,0,1], [1,0,0,1]] select _status;
	_lb lbSetValue [_forEachIndex, _status];
	// if (isNil "_veh" || isNull _veh) then 
	// {
	// 	_color = [0, 1, 0, 1];
	// 	_lb lbSetValue [_forEachIndex, 1];
	// } else {
	// 	if (alive _veh) then {
	// 		_color = [1, 1, 0, 1];
	// 	}
	// };
	_lb lbSetColor [_forEachIndex, _color];
} forEach _crafts;
_lb setVariable ["dumbData", _crafts];
_lb lbSetData [0, _varname];

_lb ctrlAddEventHandler ["LBSelChanged", "
	private _lb = (finddisplay 2580 displayctrl 1100);
	private _crafts = _lb getVariable ""dumbData"";
	private _stat = composeText [(_crafts select lbCurSel _lb) select 3, "" "", str (_lb lbValue lbCurSel _lb)];
	private _veh = (_crafts select lbCurSel _lb) select 4;
	if (!isNil ""_veh"" && {!isNull _veh}) then {
		_stat = composeText [""Coords: "", str mapGridPosition _veh, lineBreak, ""Crew: "", lineBreak, ""  "", parseText (crew _veh joinString ""<br/>  "")];
	};
	_st ctrlSetStructuredText _stat;
	if (_lb lbValue lbCurSel _lb == 0) then {
		(finddisplay 2580 displayctrl 1200) ctrlEnable true;
		(finddisplay 2580 displayctrl 1201) ctrlEnable false;
	} else {
		(finddisplay 2580 displayctrl 1200) ctrlEnable false;
		(finddisplay 2580 displayctrl 1201) ctrlEnable true;
	};
"];
//private _st = (finddisplay 2580 displayctrl 1101);