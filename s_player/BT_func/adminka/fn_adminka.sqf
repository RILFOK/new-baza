disableSerialization;

BT_spisokunits = [];
BT_spisokName = [];
BT_spisokUID = [];
BT_zvanieList = ["рядовой","мл.сержант","сержант","мл.лейтенант","лейтенант","ст.лейтенант","капитан","майор","подполковник","полковник"];
BT_green_dostup = ["нет","есть"];
BT_avia_dopusk = ["нет","1","2","3","4"];
BT_pravo_kick = ["нет","есть"];

{
	BT_spisokunits pushBack _x;
	BT_spisokName pushBack (name _x);
	BT_spisokUID pushBack (getPlayerUID _x);
} forEach allPlayers;

createDialog "adminka";

_ctrl1 = (findDisplay 6666) displayCtrl 122500;
{
	_ctrl1 lbAdd _x;
} forEach BT_spisokName;

_ctrl6 = (findDisplay 6666) displayCtrl 222100;
_ctrl7 = (findDisplay 6666) displayCtrl 222101;
_ctrl8 = (findDisplay 6666) displayCtrl 222102;
_ctrl9 = (findDisplay 6666) displayCtrl 222103;

{
	_ctrl6 lbAdd _x;
} forEach BT_zvanieList;
{
	_ctrl7 lbAdd _x;
} forEach BT_green_dostup;
{
	_ctrl8 lbAdd _x;
} forEach BT_avia_dopusk;
{
	_ctrl9 lbAdd _x;
} forEach BT_pravo_kick;

BT_fnc_click_spisok = {
	disableSerialization;

	_ctrl6 = (findDisplay 6666) displayCtrl 222100;
	_ctrl7 = (findDisplay 6666) displayCtrl 222101;
	_ctrl8 = (findDisplay 6666) displayCtrl 222102;
	_ctrl9 = (findDisplay 6666) displayCtrl 222103;
	
	_ctrl2 = (findDisplay 6666) displayCtrl 122005;
	_ctrl3 = (findDisplay 6666) displayCtrl 122006;
	_ctrl4 = (findDisplay 6666) displayCtrl 122007;
	_ctrl5 = (findDisplay 6666) displayCtrl 122008;

	_id = lbCurSel 122500;
	missionNamespace setVariable ["IDDD",_id,true];

	_zvanieCursel = missionNamespace getVariable [format["ZVANIE_%1",(BT_spisokUID # _id)],1];
	_dostupCursel = missionNamespace getVariable [format["GREEN_%1",(BT_spisokUID # _id)],0];
	_dopuskCursel = missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0];
	_kickCursel = missionNamespace getVariable [format["KICK_%1",(BT_spisokUID # _id)],0];

	_ctrl6 lbSetCurSel (_zvanieCursel - 1);
	_ctrl7 lbSetCurSel _dostupCursel;
	_ctrl8 lbSetCurSel _dopuskCursel;
	_ctrl9 lbSetCurSel _kickCursel;

	_cursel1 = lbCurSel 222100;
	missionNamespace setVariable ["BT_ID_1",_cursel1];
	_cursel2 = lbCurSel 222101;
	missionNamespace setVariable ["BT_ID_2",_cursel2];
	_cursel3 = lbCurSel 222102;
	missionNamespace setVariable ["BT_ID_3",_cursel3];
	_cursel4 = lbCurSel 222103;
	missionNamespace setVariable ["BT_ID_4",_cursel4];

	//звание
	_ctrl2 ctrlSetText format["%1",missionNamespace getVariable [format["BTZVANIE_%1",(BT_spisokUID # _id)],"рядовой"]];
	_ctrl2 ctrlSetTextColor [0,1,0,1];
	//доступ на зеленых
	_zelen = if (missionNamespace getVariable [format["GREEN_%1",(BT_spisokUID # _id)],0] == 0) then {"Нет"} else {"есть"};
	_zelenColor = if (missionNamespace getVariable [format["GREEN_%1",(BT_spisokUID # _id)],0] == 0) then {[1,0,0,1]} else {[0,1,0,1]};
	_ctrl3 ctrlSetText format["%1",_zelen];
	_ctrl3 ctrlSetTextColor _zelenColor;
	//допуск на авиа
	_dopusk = if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 0) then {"Нет"} else {
		if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 1) then {1} else {
			if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 2) then {2} else {
				if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 3) then {3} else {4};};};};
	_dopuskColor = if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 0) then {[1,0,0,1]} else {
		if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 1) then {[1,0.5,0,1]} else {
			if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 2) then {[1,1,0,1]} else {
				if (missionNamespace getVariable [format["PILOT_%1",(BT_spisokUID # _id)],0] == 3) then {[0.5,1,0,1]} else {[0,1,0,1]};};};};
	_ctrl4 ctrlSetText format["%1",_dopusk];
	_ctrl4 ctrlSetTextColor _dopuskColor;
	//право на КИК
	_kick = if (missionNamespace getVariable [format["KICK_%1",(BT_spisokUID # _id)],0] == 0) then {"Нет"} else {"есть"};
	_kickColor = if (missionNamespace getVariable [format["KICK_%1",(BT_spisokUID # _id)],0] == 0) then {[1,0,0,1]} else {[0,1,0,1]};
	_ctrl5 ctrlSetText format["%1",_kick];
	_ctrl5 ctrlSetTextColor _kickColor;
	sleep 1;
	
};

BT_fnc_id_1 = {
	_cursel = lbCurSel 222100;
	missionNamespace setVariable ["BT_ID_1",_cursel];
};

BT_fnc_id_2 = {
	_cursel = lbCurSel 222101;
	missionNamespace setVariable ["BT_ID_2",_cursel];
};

BT_fnc_id_3 = {
	_cursel = lbCurSel 222102;
	missionNamespace setVariable ["BT_ID_3",_cursel];
};

BT_fnc_id_4 = {
	_cursel = lbCurSel 222103;
	missionNamespace setVariable ["BT_ID_4",_cursel];
};

BT_fnc_primenit = {
	_id = missionNamespace getVariable ["IDDD",-1];
	_zvanie = missionNamespace getVariable format["ZVANIE_%1",(BT_spisokUID # _id)];
	_zelen = missionNamespace getVariable format["GREEN_%1",(BT_spisokUID # _id)];
	_dopusk = missionNamespace getVariable format["PILOT_%1",(BT_spisokUID # _id)];
	_kick = missionNamespace getVariable format["KICK_%1",(BT_spisokUID # _id)];
	_zvanieNew = missionNamespace getVariable ["BT_ID_1",_zvanie];
	_zelenNew = missionNamespace getVariable ["BT_ID_2",_zelen];
	_dopuskNew = missionNamespace getVariable ["BT_ID_3",_dopusk];
	_kickNew = missionNamespace getVariable ["BT_ID_4",_dopusk];
	if (_zvanieNew >= 0) then {_zvanieNew = (_zvanieNew + 1)} else {_zvanieNew = _zvanie};
	if (_zelenNew >= 0) then {_zelenNew = _zelenNew} else {_zelenNew = _zelen};
	if (_dopuskNew >= 0) then {_dopuskNew = _dopuskNew} else {_dopuskNew = _dopusk};
	if (_kick >= 0) then {_kickNew = _kickNew} else {_kickNew = _kick};
	missionNamespace setVariable [format["ZVANIE_%1",(BT_spisokUID # _id)],_zvanieNew,true];
	missionNamespace setVariable [format["GREEN_%1",(BT_spisokUID # _id)],_zelenNew,true];
	missionNamespace setVariable [format["PILOT_%1",(BT_spisokUID # _id)],_dopuskNew,true];
	missionNamespace setVariable [format["KICK_%1",(BT_spisokUID # _id)],_kickNew,true];
	sleep 0.2;
	_unit = (BT_spisokunits # _id);
	//[_unit] spawn BT_fnc_level_up;
	if (_zelenNew > _zelen) then {[_unit] spawn BT_fnc_hint_zelen;};
	if (_dopuskNew > _dopusk) then {[_unit] spawn BT_fnc_hint_dostup_plus;};
	if (_dopuskNew < _dopusk) then {[_unit] spawn BT_fnc_hint_dostup_minus;};
	if (_zvanieNew > _zvanie) then {[_unit] spawn BT_fnc_hint_zvanie_plus;};
	uiSleep 1;
	[] spawn BT_fnc_click_spisok;
};

BT_fnc_kiknut = {
	_id = missionNamespace getVariable ["IDDD",-1];
	_unit = (BT_spisokunits # _id);
	[[_unit],{"1233123" serverCommand format ["#kick %1",name (_this select 0)];}] remoteExec ["bis_fnc_call", 2];
};

BT_fnc_plus25 = {
	_id = missionNamespace getVariable ["IDDD",-1];
	_procent = missionNamespace getVariable format["PARAMETR_%1",(BT_spisokUID # _id)];
	_procent = _procent + 25;
	missionNamespace setVariable [format["PARAMETR_%1",(BT_spisokUID # _id)],_procent,true];
	sleep 0.2;
	_unit = (BT_spisokunits # _id);
	//[_unit] spawn BT_fnc_level_up;
	uiSleep 1;
	[] spawn BT_fnc_click_spisok;
};

BT_fnc_minus25 = {
	_id = missionNamespace getVariable ["IDDD",-1];
	_procent = missionNamespace getVariable format["PARAMETR_%1",(BT_spisokUID # _id)];
	_procent = _procent - 25;
	missionNamespace setVariable [format["PARAMETR_%1",(BT_spisokUID # _id)],_procent,true];
	sleep 0.2;
	_unit = (BT_spisokunits # _id);
	//[_unit] spawn BT_fnc_level_up;
	uiSleep 1;
	[] spawn BT_fnc_click_spisok;
};