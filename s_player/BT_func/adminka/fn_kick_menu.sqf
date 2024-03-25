if ((missionNamespace getVariable [format['KICK_%1',getPlayerUID player],0]) != 1) exitWith {};

private _kick_open = player getVariable ["KICK_OPEN", false];

if (_kick_open) exitWith {
	closeDialog 6666789;
	player setVariable ["KICK_OPEN", false];
};

disableSerialization;

createDialog "kick_panel";
player setVariable ["KICK_OPEN", true];

private _ctrl1 = (findDisplay 6666789) displayCtrl 1231500;
private _index = -1;
{
	_index = _ctrl1 lbAdd (name _x);
	_ctrl1 lbSetData [_index,getPlayerUID _x];
} forEach allPlayers;

BT_fnc_click_spisok2 = {
	disableSerialization;

	_id = lbCurSel 1231500;
	missionNamespace setVariable ["IDDD2",_id,true];
};

BT_fnc_kiknut2 = {
	private _ctrl1 = (findDisplay 6666789) displayCtrl 1231500;
	private _index = lbCurSel _ctrl1;
	private _uid = _ctrl1 lbData _index;
	//private _unit = (BT_spisokunits # _id);
	private _name = _ctrl1 lbText _index;
	[
		_uid,
		{
			private _uid = _this;
			"1233123" serverCommand format ["#kick %1",_uid];
		}
	] remoteExec ["bis_fnc_call", 2];
	[
		[name player,_name],
		{
			params ["_kick1","_kick2"];
			"Extdb3" callExtension format["0:%1:saveKick:%2:%3:%4",PROTOCOL,'now()',_kick1,_kick2];
		}
	] remoteExec ["spawn",2];
};
