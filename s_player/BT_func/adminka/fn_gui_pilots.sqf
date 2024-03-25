disableSerialization;

BT_pilot_spisokunits = [];
BT_pilot_spisokName = [];
BT_pilot_spisokUID = [];

{
	BT_spisokunits pushBack _x;
	BT_spisokName pushBack (name _x);
	BT_spisokUID pushBack (getPlayerUID _x);
} forEach allPlayers;

createDialog "gui_pilots";

_ctrlhelinalet = (findDisplay 123456789) displayCtrl 1020;
_ctrlhelivzlet = (findDisplay 123456789) displayCtrl 1012;
_ctrlheliudpos = (findDisplay 123456789) displayCtrl 1013;
_ctrlhelineudpos = (findDisplay 123456789) displayCtrl 1014;

_ctrlplanenalet = (findDisplay 123456789) displayCtrl 1015;
_ctrlplanevzlet = (findDisplay 123456789) displayCtrl 1016;
_ctrlplaneudpos = (findDisplay 123456789) displayCtrl 1017;
_ctrlplaneneudpos = (findDisplay 123456789) displayCtrl 1018;

_id = lbCurSel 1123123500;
missionNamespace setVariable ["IDDDPILOTS",_id,true];

_heli1 = ((missionNamespace getVariable [format["HELIPILOTSNALET_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0]) / 360);
_heli2 = missionNamespace getVariable [format["HELIPILOTSVZLET_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];
_heli3 = missionNamespace getVariable [format["HELIPILOTSUDPOS_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];
_heli4 = missionNamespace getVariable [format["HELIPILOTSNEUDPOS_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];

_plane1 = ((missionNamespace getVariable [format["PLANEPILOTSNALET_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0]) / 360);
_plane2 = missionNamespace getVariable [format["PLANEPILOTSVZLET_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];
_plane3 = missionNamespace getVariable [format["PLANEPILOTSUDPOS_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];
_plane4 = missionNamespace getVariable [format["PLANEPILOTSNEUDPOS_%1",getPlayerUID (BT_pilot_spisokUID # _id)],0];

_ctrlhelinalet ctrlSetText format["%1 часов",missionNamespace getVariable [format["HELIPILOTSNALET_%1",(BT_spisokUID # _id)],"0"]];
_ctrlhelinalet ctrlSetTextColor [1,1,1,1];
_ctrlhelivzlet ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSVZLET_%1",(BT_spisokUID # _id)],"0"]];
_ctrlhelivzlet ctrlSetTextColor [1,1,1,1];
_ctrlheliudpos ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSUDPOS_%1",(BT_spisokUID # _id)],"0"]];
_ctrlheliudpos ctrlSetTextColor [0,1,0,1];
_ctrlhelineudpos ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSNEUDPOS_%1",(BT_spisokUID # _id)],"0"]];
_ctrlhelineudpos ctrlSetTextColor [1,0,0,1];

_ctrlplanenalet ctrlSetText format["%1 часов",missionNamespace getVariable [format["HELIPILOTSNALET_%1",(BT_spisokUID # _id)],"0"]];
_ctrlplanenalet ctrlSetTextColor [1,1,1,1];
_ctrlplanevzlet ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSVZLET_%1",(BT_spisokUID # _id)],"0"]];
_ctrlplanevzlet ctrlSetTextColor [1,1,1,1];
_ctrlplaneudpos ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSUDPOS_%1",(BT_spisokUID # _id)],"0"]];
_ctrlplaneudpos ctrlSetTextColor [0,1,0,1];
_ctrlplaneneudpos ctrlSetText format["%1",missionNamespace getVariable [format["HELIPILOTSNEUDPOS_%1",(BT_spisokUID # _id)],"0"]];
_ctrlplaneneudpos ctrlSetTextColor [1,0,0,1];