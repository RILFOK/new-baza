//if(!isServer) exitWith {};
if(Stage == 5) exitWith {};
params ["_posPoint","_arrayrecon"];

private _recon_amount = missionNameSpace getVariable ["RC",8];

private _spawnrecongroup = missionNameSpace getVariable ["spawnrecongroup",true];
if(!_spawnrecongroup) exitWith {};
missionNameSpace setVariable ["spawnrecongroup",false,true];

_posPoint params ["_posx","_posy"];
private _dir = random 360;
private _shagDir = 360/_recon_amount;
private _arraypos = [];
private _pos = [];
//дистанция спн
private _trig_radius = (srv_sizepoint param [0]);
private _dist = _trig_radius;

//количество спн
for "_i" from 1 to _recon_amount do {
  _dir = _dir + _shagDir;
  _dist = _trig_radius + random [680, 700, 800]; // 400 + немного рандома на дистанцию
  if(_dir > 360) then {_dir = _dir - 360}; 
  _pos = [_posx + ((sin _dir) * _dist),_posy + ((cos _dir) * _dist)];
  _arraypos pushback _pos;
};

//////



//========================== HC HANDLE ====================================
//===========================================================================

if (serverNamespace getVariable ["hn_HC_Active", false])  then {
    [_arraypos,_posPoint,_arrayrecon] remoteExec ["srv_fnc_spawnAIrec",(serverNamespace getVariable "hn_headlessClients") select 0];
    //["спн на HC"] remoteExec ["diag_log",2];
    
} else {
    [_arraypos,_posPoint,_arrayrecon] spawn srv_fnc_spawnAIrec;
    //["спн на сервере"] remoteExec ["diag_log",2];
};

//===========================================================================
