if(!isServer) exitWith {};
//подкрепление
//if(ReinforPointprocces) exitWith {};
missionNameSpace setVariable ["ReinforPointprocces",true,true];
params ["_Point"];


//"Подкрепление" remoteexeccall ["hint",[0,-2] select isDedicated];


private ["_REINFORCEMENT","_RadioTower"];
_REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";



if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_Point,_REINFORCEMENT] remoteExec ["srv_fnc_spawnAIreinfor",(serverNamespace getVariable "hn_headlessClients") select 0];
    //["упралвение подкрепа у HC"] remoteExec ["systemChat",0];
    
} else {
    [_Point,_REINFORCEMENT] spawn srv_fnc_spawnAIreinfor;
   // ["упралвение подкрепа у сервера"] remoteExec ["systemChat",0];
    //ждать, пока все не заспавнится
};


sleep 1;
missionNameSpace setVariable ["ReinforPointprocces",false,true];