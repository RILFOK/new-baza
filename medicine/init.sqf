fnc_handledamage = compile preprocessFile "medicine\fnc_handledamage.sqf";
//fnc_setunconscious = compile preprocessFile "medicine\fnc_setunconscious.sqf";
fnc_revive = compile preprocessFile "medicine\fnc_revive.sqf";
fnc_canrevive = compile preprocessFile "medicine\fnc_canrevive.sqf";
fnc_canreviveveh = compile preprocessFile "medicine\fnc_canreviveveh.sqf";
fnc_candrag = compile preprocessFile "medicine\fnc_candrag.sqf";
fnc_isMedic = compile preprocessFile "medicine\fnc_isMedic.sqf";
fnc_drag = compile preprocessFile "medicine\fnc_drag.sqf";
fnc_canunload = compile preprocessFile "medicine\fnc_canunload.sqf";
fnc_unload = compile preprocessFile "medicine\fnc_unload.sqf";
fnc_canload = compile preprocessFile "medicine\fnc_canload.sqf";
fnc_load = compile preprocessFile "medicine\fnc_load.sqf";
fnc_cancarry = compile preprocessFile "medicine\fnc_cancarry.sqf";
fnc_carry = compile preprocessFile "medicine\fnc_carry.sqf";
fnc_canbandage= compile preprocessFile "medicine\fnc_canbandage.sqf";
fnc_bandage= compile preprocessFile "medicine\fnc_bandage.sqf";
block_key = compile preprocessFile "medicine\fnc_blockkey.sqf";
fnc_rearm = compile preprocessFile "medicine\fnc_rearm.sqf";
fnc_canrearm = compile preprocessFile "medicine\fnc_canrearm.sqf";
fnc_300w = compile preprocessFile "medicine\fnc_300w.sqf";

unc_work = false;
injury_work = false;
//-----------------------под замену----------------
//icw_work = false;

player setCaptive 0;
//(findDisplay 46) displayRemoveAllEventHandlers "keyDown";
inGameUISetEventHandler ["Action",""];
player removeAllEventHandlers "HandleDamage";
player setVariable ["isUnconscious", false, true];
player setVariable ["isBleeding", false, true];
player setVariable ["Blood", 1000, true];
player setVariable ["isDragged", false, true];
player setVariable ["isCarryed", false, true];
player setVariable ["isHostage",false,true];
player setVariable ["isDrag",false,true];
player setVariable ["KillHitPoint", 1000, true];
player setVariable ["injury", false, true]; 



player enableAI "ALL";
id_down = "none";
id_up = "none";
player addEventHandler["HandleDamage",
{
	_this call fnc_handledamage;
}];

	//Перевязать, поднять. отсальные кнопки в client core
[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canrevive", "(items player) find 'Medikit' != -1", {}, {hint "Лечение"},
	{
	private _cursorTarget = cursorTarget;
	if (_cursorTarget getVariable 'isUnconscious') then {
		[player,_cursorTarget] spawn fnc_revive;
	};

}, { hint "Вам нужна аптечка" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;

[player, "<t color='#ff0000'>Остановить кровотечение</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "[cursorTarget] call fnc_canbandage", "(items player) find 'FirstAidKit' != -1", {}, {hint "Перевязка"}, 
{
	[player,cursorTarget] spawn fnc_bandage;
}, { hint "Вам нужен перевязочный пакет" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;




//------------------Установки НШ--------------------
missionNamespace getVariable ["stamina", []];
missionNamespace getVariable ["traska", []];
missionNamespace getVariable ["3pw", []];
[] remoteExec ["srv_fnc_stamina"];

addMissionEventHandler ["Draw3D", {
	
	{	
		_distance = _x distance player;

		if ((_distance < 200) && {_x getVariable "isUnconscious" && {side (group _x) == playerSide}}) then {
			
			if (_x getVariable "isBleeding") then {

				drawIcon3D["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",[1,0,0,1],_x,1,1,0,format["%1 (%2м)", name _x, floor _distance],1,0.04];

			} else {

				drawIcon3D["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",[1,0.4,0,1],_x,1,1,0,format["%1 (%2м)", name _x, floor _distance],1,0.04];

			};
		};	
	}foreach allplayers;
}];

player addEventHandler ["Respawn",
{
	unc_work = false;
	injury_work = false;
	//-----------------------под замену----------------
	//icw_work = false;
	player setCaptive 0;
	player setVariable ["isUnconscious", false, true];
	player setVariable ["isBleeding", false, true];
	player setVariable ["isDragged", false, true];
	player setVariable ["isCarryed", false, true];
	player setVariable ["Blood", 1000, true];
	player setVariable ["isHostage", false, true];
	player setVariable ["isDrag",false,true];
	player setVariable ["KillHitPoint", 1000, true];
	player setvariable ["UCW", false, true];
	player setVariable ["injury", false, true]; 
	

	//Вернуть кнопки после респавна
	[player, "<t color='#ff0000'>Первая помощь</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa", "[cursorTarget] call fnc_canrevive", "(items player) find 'Medikit' != -1", {}, {hint "Лечение"},
		{
		private _cursorTarget = cursorTarget;
		if (_cursorTarget getVariable 'isUnconscious') then {
			[player,_cursorTarget] spawn fnc_revive;
		};

	}, { hint "Вам нужна аптечка" }, [], 10, nil, false, false] call BIS_fnc_holdActionAdd;

	[player, "<t color='#ff0000'>Остановить кровотечение</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa", "[cursorTarget] call fnc_canbandage", "(items player) find 'FirstAidKit' != -1", {}, {hint "Перевязка"}, 
	{
		[player,cursorTarget] spawn fnc_bandage;
	}, { hint "Вам нужен перевязочный пакет" }, [], 5, nil, false, false] call BIS_fnc_holdActionAdd;



	//синии настройки
	if (side player == west) then {
		[player] spawn blu_fnc_condition;
		player enableFatigue true;
		player enableStamina true; 
		player setCustomAimCoef 1;
		player addRating -1999;
		[] spawn blu_fnc_dzoneil;
	};

	//базовая экипировка для красных
	if (side player == east) then {
	[player] spawn AVO_basicEQP;
	};

	(findDisplay 46) displayRemoveAllEventHandlers "keyDown";

	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call bt_fnc_deh_keDown"];
	
	
	if (!(id_up isEqualTo "none")) then
	{	
		(findDisplay 46) displayRemoveEventHandler ["keyUp",id_up];
	};
	
	[] spawn {_this call compile preProcessFileLineNumbers "s_player\outlw_magRepack\MagRepack_init_sv.sqf"}; 	// Magazines repack 
	[] spawn {_this call compile preProcessFileLineNumbers "s_player\heliRearRamp.sqf";}; 						// Block rear ramp actions for non-pilots

	id_up = "none";
	player addEventHandler["HandleDamage",
	{
		_this call fnc_handledamage;
	}];
	
	inGameUISetEventHandler ["Action",""];
	
	//------------------Установки НШ--------------------
	missionNamespace getVariable ["stamina", []];
	missionNamespace getVariable ["traska", []];
	missionNamespace getVariable ["3pw", []];
	[] remoteExec ["srv_fnc_stamina"];
}];