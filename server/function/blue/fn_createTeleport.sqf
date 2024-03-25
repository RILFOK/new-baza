_spawnPosPorter = getMarkerPos "tptrig";
_tporter = "Land_BriefingRoomScreen_01_F" createVehicle _spawnPosPorter;
_tporter setDir 180;
_tporter enableSimulationGlobal false;


[_tporter, "<t color='#ff0000'>Отправиться на триггер</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa", "_this distance _target < 30", "_caller distance _target < 30", {}, {}, 

{
if (playerSide == west) then {
_MarkerP = missionNameSpace getvariable 'trigPoint';
_spawnP = getMarkerPos _MarkerP;
_spawn = [_spawnP select 0, _spawnP select 1, 1000];

	deleteMarkerLocal "ostrov";
	missionNamespace setVariable ["inIland",false];
  _caller setPos _spawn;
  [player] spawn fnc_para;
	hint format['Удачи %1!', name _caller];
	sleep 1;
	if ( typeOf _caller in ["B_soldier_AA_F","B_soldier_LAT_F","B_HeavyGunner_F","B_soldier_mine_F"] ) then { [_caller] spawn blu_fnc_deadZone};
  switch (typeOf _caller) do {
    case "B_soldier_mine_F":{
      [_caller] spawn {_this call compile preProcessFileLineNumbers "s_player\rearm\rearmPlayer_BlueEng.sqf"};
    };
    case "B_soldier_LAT_F":{
      [_caller] spawn {_this call compile preProcessFileLineNumbers "s_player\rearm\rearmPlayer_BlueAT.sqf"};
    };
    case "B_medic_F":{
      [_caller] spawn {_this call compile preProcessFileLineNumbers "s_player\rearm\rearmPlayer_BlueMedc.sqf"};
    };
    case "B_HeavyGunner_F":{
      [_caller] spawn {_this call compile preProcessFileLineNumbers "s_player\rearm\rearmPlayer_BlueMG.sqf"};
    };
  };
};
If (playerSide != west) then {hint format['Ковёр самолёт не работает %1!', name _caller];};
}, 
{}, [], 1, 0, false, false] remoteExecCall ["BIS_fnc_holdActionAdd", 0, _tporter];

/*
_RMB = getMarkerPos    "rmb_1";
_rearmBox = "Land_PaperBox_open_full_F" createVehicle _RMB;
_rearmBox setDir 180;
_rearmBox enableSimulationGlobal true;
[
  _rearmBox, // передаём коробку в вызываемый код
  {
    params ["_rearmBox"]; // снова присваиваем переданную коробку переменной с тем же названием
    _rearmBox addAction ["<t color='#00FFFF'>Инженер</t>", {player execVM "s_player\rearm\rearmPlayer_BlueEng.sqf"},[],1,false,true,"",'_this distance _target < 5 && typeOf _this in ["B_soldier_mine_F"]']; 
    _rearmBox addAction ["<t color='#00FFFF'>ПТ Боец</t>", {player execVM "s_player\rearm\rearmPlayer_BlueAT.sqf"},[],1,false,true,"",'_this distance _target < 5 && typeOf _this in ["B_soldier_LAT_F"]']; 
    _rearmBox addAction ["<t color='#00FFFF'>ПВО Боец</t>", {player execVM "s_player\rearm\rearmPlayer_BlueAA.sqf"},[],1,false,true,"",'_this distance _target < 5 && typeOf _this in ["B_soldier_AA_F"]']; 
    _rearmBox addAction ["<t color='#00FFFF'>Пулеметчик</t>", {player execVM "s_player\rearm\rearmPlayer_BlueMG.sqf"},[],1,false,true,"",'_this distance _target < 5 && typeOf _this in ["B_HeavyGunner_F"]'];
  }
] remoteExec ["call", 0, _rearmBox]; // "call" - оператор, который будет вызываться, 0 - выполнять везде, _rearmBox - выполнять на вновь подключающихся клиентах, пока существует коробка 
*/

_timer = 1800;

while {missionNameSpace getVariable "blueNoTK"} do {
_timer = _timer - 1;
sleep 1;
if (_timer == 0) then {
missionNameSpace setVariable ["blueNoTK", false, true];
};
};

deleteVehicle _tporter;
deleteVehicle _rearmBox;
