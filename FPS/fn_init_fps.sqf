
/*if(!isServer) exitWith {};

for "_i" from 0 to 1 step 0 do
{
  sleep 2;
  [round diag_fps] remoteexeccall ["Srv_fnc_missionfps"];
};*/


//ФПС клиента
if (!hasInterface) exitWith {};
disableSerialization;

for "_i" from 0 to 1 step 0 do {
  if (player getVariable ["DisplayFpsON",true]) then {

    //if(!clientstart) exitWith {};

    private _disp = uiNamespace getVariable "DisplayFps";

    if (isNil "_disp" || {isNull _disp}) then {
      "DisplayFps" cutRsc ["DisplayFps", "PLAIN"];
      _disp = uiNamespace getVariable "DisplayFps";
    };

    //клиент
    (_disp displayCtrl 51) ctrlSetText str (round (diag_fps));

    sleep 3;
  
  } else {
    "DisplayFps" cutText ["","PLAIN"];
  };
};