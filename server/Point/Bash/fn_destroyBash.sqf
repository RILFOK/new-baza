params ["_it","_instigator"];

_it removeAllEventHandlers "HandleDamage";
_it setDamage [1,true];
// Экспа подорвавшему
private _slot = _instigator getVariable ["slot","null"];
if (_slot == "engineer") then {
	["task",["main_engineer", _instigator ]] spawn bt_fnc_eventScore; 
} else {
	["task",["main", _instigator ]] spawn bt_fnc_eventScore; 
};
_leader = leader (group _instigator);
if (_leader != _instigator) then {	// Игрок лидер группы?
	// Экспа лидеру за подрыв
	["task",["main_leader", _leader ]] spawn bt_fnc_eventScore; 
};

_this spawn {
	private _radioBashnya = _this select 0;
	if!(_radioBashnya getVariable "killed") exitWith {};
	_radioBashnya setVariable ["killed",false,true];
	private _RTST = missionNameSpace getVariable "RTST";
	_RTST = _RTST - 1;
	missionNameSpace setVariable ["RTST",_RTST,true];

	//мониторинг
	//=========================================================
	[(Gamer getVariable "datapoint") # 1, _RTST, missionNamespace getVariable ["_number_hn_trigger_monitoring","-"], 6] remoteExecCall ["bt_db_fnc_changeMonitoring",2];
	//=========================================================

	_radioBashnya removeAllMPEventHandlers "mpkilled";
	//уничтожена

	_near = nearestObjects [_radioBashnya, [], 5];
	private _n = "";
	private _n1 = "";
	switch (typeof _radioBashnya) do {
		case "Land_Cargo_HQ_V1_F":{
			_n = "Штаб";
			_n1 = "штаб";
			[] remoteexeccall ["srv_fnc_TaskDone1"];
			missionNameSpace setVariable ["Bash111",1,true];
		};
		case "Land_TTowerBig_2_F":{
			_n = "Радиовышка";
			_n1 = "радиовышку";
			
			[] remoteexeccall ["srv_fnc_TaskDone2"];
			missionNameSpace setVariable ["Bash222",1,true];
		};
		case "Land_TBox_F":{
			_n = "Передатчик";
			_n1 = "передатчик";
			[] remoteexeccall ["srv_fnc_TaskDone3"];
			missionNameSpace setVariable ["Bash333",1,true];
		};
	};
	[format ["Боец %1 подорвал %2",name (_this select 1), _n1]] remoteExec ["systemChat",-2];
	[_n] spawn {
		params ["_n"];
		private _text = format [localize "STR_CONF_BASH1",_n];
	};
	
	private _dbbash = "";
	switch (_n) do {
		case 1:{_dbbash = "PosBash1"};
		case 2:{_dbbash = "PosBash2"};
		case 3:{_dbbash = "PosBash3"};
	};		

	switch (true) do {			
		case (_RTST == 2 || {_RTST == 1}):{
			if(HardReinfor != 1) then {
				private _datapoint = Gamer getVariable ["datapoint",[]];
				_datapoint params ["_marker",""];
				private _posPoint = getMarkerPos _marker;
				private _list = _posPoint nearEntities [["Man","Car","Tank"],400];
				if((WEST countSide _list) < (numberOfArmy/2)) then {
					[_marker] spawn srv_fnc_ReinforPointBash;
				};
			};
		};
		case (_RTST == 0):{
			missionNameSpace setVariable ["DirBash",nil];
			missionNameSpace setVariable ["clearDeadBash",nil];
			missionNameSpace setVariable ["StaticWeap",nil];
			[] spawn {
				sleep 3;
				private _text = localize "STR_CONF_BASH2";
				_text  remoteExec ["hint",[0,-2] select isDedicated];
				[[east,"HQ"],_text] remoteExec ["sideChat",[0,-2] select isDedicated];	
			};

			if(HardReinfor == 1) then {
				missionNameSpace setVariable ["Stage",4,true];					
			};			
			missionNameSpace setVariable ["PerehodPoint",true,true];		
		};
	};
};