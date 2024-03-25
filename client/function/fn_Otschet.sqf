private ["_veh","_uidpl","_title","_text","_titleout","_textout"];
_veh = _this select 0;
_uidpl = _this select 1;

if(getPlayerUID player != _uidpl) exitWith {};

_title = localize "STR_CONF_MINEVEH";
_text = localize "STR_CONF_MINEVEH2";
_titleout = Format ["<t color='#A50924' size='2' align='center'>%1</t><br/><br/>", _title];
_textout = Format ["<t color='#00ff00' size='1.2' align='center'>%1</t><br/><br/>", _text];

hint "";
playSound "Alarm_OPFOR";
hint parseText (_titleout + _textout);
sleep 5;
hint "";

for "_i" from 0 to 10 do
{
  hint parseText Format ["<t color='#A50924' size='4' align='center'>%1</t><br/><br/>", 10 - _i];
  playSound "addTime";
  sleep 1;
};

["M_Titan_AA_long",position _veh] remoteExecCall ["createvehicle",2];
[_veh,1] remoteExecCall ["setDamage",2];
[_veh] remoteExec ["srv_fnc_DeleteWreckVehicle",2];

hint "";
