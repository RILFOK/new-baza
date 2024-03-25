if(!isServer) exitWith {};
//подкрепление
if!(ReinforPoint) exitWith {};
missionNamespace setVariable ["ReinforPoint",false,true];
[] spawn {
    switch (true) do {
        case(Stage == 2):{
            missionNamespace setVariable ["Stage",3,true];	  
	        missionNamespace setVariable ["ReinforPoint2",true,true];		  
        };

        case(Stage == 3):{
            missionNamespace setVariable ["Stage",4,true];

            //Направить спн в центр триггера после второго подкрепа
            private ["_Point","_posPoint","_gr","_wp"];
            _Point = (Gamer getVariable "datapoint") param [0];
            _posPoint = getmarkerpos _Point;

            {
                _gr = group _x;

                if (waypointname ((waypoints _gr) select 1) isEqualTo "GOTODEFENCE") then {CONTINUE};

                for "_i" from 0 to (count waypoints _gr - 1) do  { 
                    deleteWaypoint [_gr, 0]; 
                };

                _gr setBehaviour "COMBAT";
			    _gr setSpeedMode "FULL";
                
                _wp = _gr addWaypoint [_posPoint,150,1,"GOTODEFENCE"];
                _wp setWaypointType "MOVE"; 
                _wp setWaypointFormation "LINE"; 
                _wp setWaypointCompletionRadius 50; 
                _wp setWaypointStatements ["true", "null = [this] spawn srv_fnc_ReinforcePatrol"];

            }forEach (missionNameSpace getVariable ["recongrouparry",[]]);
            //================================


            if(Rezhim == 2) then {
		        missionNamespace setVariable ["PerehodPoint",true,true];		  
	        };	  
        };
    };
};

missionNameSpace setVariable ["ReinforPointprocces",true,true];

params ["_Point"];



private _REINFORCEMENT = missionNamespace getVariable "REINFORCEMENT";


if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_Point,_REINFORCEMENT] remoteExec ["srv_fnc_spawnAIreinfor",(serverNamespace getVariable "hn_headlessClients") select 0];
   // ["упралвение подкрепа у HC"] remoteExec ["systemChat",0];
    
} else {
    [_Point,_REINFORCEMENT] spawn srv_fnc_spawnAIreinfor;
   // ["упралвение подкрепа у сервера"] remoteExec ["systemChat",0];
    //ждать, пока все не заспавнится
};


sleep 1;

missionNameSpace setVariable ["ReinforPointprocces",false,true];