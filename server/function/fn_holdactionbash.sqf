//create ENEMY vehicles	

params ["_obj"];	

if (side player != east) exitWith {};

switch (typeOf _obj) do {
  case "Land_TBox_F":{
    [
      _obj,											// Object the action is attached to
      "Взломать передатчик",										// Title of the action
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
      "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
      "(_this distance _target < 4) && {(_this getvariable ['slot','rifleman'] == 'engineer') && ('ToolKit' in ((vestItems player) + (backpackItems player)))}",						// Condition for the action to be shown
      "_caller distance _target < 4",						// Condition for the action to progress
      {},													// Code executed when action starts
      {},													// Code executed on every progress tick
      {missionNameSpace setvariable ["_notallow_revengecobra1",true,true];
      private _message = format ["Инженер %1 взломал передатчик. Вражеские вертолеты не смогут отправить сигнал бедствия", name _caller];
      [_message] remoteExec ["hint", east];
      ["task",["transmitter", _caller ]] spawn bt_fnc_eventScore;

      },				// Code executed on completion
      {},													// Code executed on interrupted
      [],													// Arguments passed to the scripts as _this select 3
      160,													// Action duration in seconds
      10000,													// Priority
      true,												// Remove on completion
      false												// Show in unconscious state
    ] call BIS_fnc_holdActionAdd;	// MP compatible implementatio
  };

  case "Land_Radar_Small_F": {

    [
        _obj,
        "Отключить радар",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "(_this distance _target < 10) && {( (taskState (missionNameSpace getvariable ['_dop_task4',''])) isNotEqualTo 'Succeeded') && (_this getvariable ['slot','rifleman'] != 'pilot') && ('ToolKit' in ((vestItems player) + (backpackItems player)))}",
        "(_caller distance _target < 15) && (count (missionNameSpace getvariable ['_action_noradio1',[]]) > 1 )",					
        {
        private _array = [];
        _array = missionNameSpace getvariable ["_action_noradio1",[]];
        if ((count _array < 2) && !(_caller in _array)) then {
            _array pushback _caller;
            missionNameSpace setvariable ["_action_noradio1",_array,true];
        };
        sleep 2;
        },											
        
        {  
        },											
        {
        missionNameSpace setvariable ["_enemy_aircycle_AA",false,true];
        missionNameSpace setvariable ['_action_noradio1',[],true];
        // Экспа за отключение радара 
        private _slot = _caller getVariable ["slot","null"];
        if (_slot == "engineer") then {
          ["task",["radar_engineer", _caller ]] spawn bt_fnc_eventScore; 
        } else {
          ["task",["radar", _caller ]] spawn bt_fnc_eventScore; 
        };
        
        {["TaskSucceeded", ["", "Вражеский радар отключен"]] call BIS_fnc_showNotification} remoteexec ["call",east]; 
        {(missionnamespace getVariable "_dop_task4") setTaskState "Succeeded"} remoteExecCall ["call", east];
        
        sleep 300;
        _ship = missionNamespace getVariable["_RADAR_SHIP", []];
        { deleteVehicle _x; } forEach _ship;

        },		
        {
        private _array = missionNameSpace getvariable ["_action_noradio1",[]];
        _array =  _array - [_caller];

        missionNameSpace setvariable ['_action_noradio1',_array,true];
        },												
        [],													
        5,												
        10000,												
        true,												
        false												
    ] call BIS_fnc_holdActionAdd;

  };
};

//["Противник потерял связь с авиабазой. Истребителей последнего поколения в подкрепе не ожидается"] remoteExec ["systemChat", allplayers select {side _x == east}];