[missionNamespace, "arsenalOpened", {
  disableSerialization;
  params ["_disp"];
  // random
  (_disp displayCtrl 44150) ctrlEnable false;
  (_disp displayCtrl 44150) ctrlShow  false;
  // export						
  (_disp displayCtrl 44148) ctrlEnable false;
  (_disp displayCtrl 44148) ctrlShow  false;
  // import
  (_disp displayCtrl 44149) ctrlEnable false;
  (_disp displayCtrl 44149) ctrlShow  false;	
  // hide
  (_disp displayCtrl 44151) ctrlEnable false;
  (_disp displayCtrl 44151) ctrlShow  false;	
  // Load
  (_disp displayCtrl 44147) ctrlEnable false;
  (_disp displayCtrl 44147) ctrlShow  false;
  // Save
  (_disp displayCtrl 44146) ctrlEnable false;
  (_disp displayCtrl 44146) ctrlShow  false;	

  //_disp displayaddeventhandler ["keydown","if((_this select 1) in [0x2E,0x2F,0x1F,0x18,0x13]) then {};"];
  _disp displayAddEventHandler ["KeyDown", {(_this select 1) in [19, 29,24]}];
}] call BIS_fnc_addScriptedEventHandler;