if(!isServer) exitWith {};
missionNameSpace setVariable ["Bash111",0,true];
params ["_type","_marker","_index","_radius"];
private ["_markerPos","_radioBashnya","_DirBash","_veh","_mine","_spawnpos","_next"];
_spawnpos = [];
_next = false;
_markerPos = getmarkerpos _marker;
if(isNil {missionNameSpace getVariable "DirBash"}) then { missionNameSpace setVariable ["DirBash",[0,0,0],true]};
_DirBash = missionNameSpace getVariable "DirBash";

if(!nachinaem_zonovo && {!DatabasePointRead}) then {
    private _dbposbash = "";
 	switch (_type) do {
		case "Land_Cargo_HQ_V1_F":{_dbposbash = "PosBash1"};
		case "Land_TTowerBig_2_F":{_dbposbash = "PosBash2"};
		case "Land_TBox_F":{_dbposbash = "PosBash3"};
	};
	_spawnpos = ["read", ["Bash",_dbposbash]];
    if!(_spawnpos IsEqualTo []) then {_next = true};
};

if(nachinaem_zonovo) then { 
    
    if(isNil {missionNameSpace getVariable "clearDeadBash"}) then {
        missionNameSpace setVariable ["clearDeadBash",true,true];
    };
    if(missionNameSpace getVariable "clearDeadBash") then {
        missionNameSpace setVariable ["clearDeadBash",false,true];
        _obj = nearestObjects [_markerPos,["Land_Cargo_Tower_V1_ruins_F"],700];
        if!(_obj isEqualTo []) then {{deletevehicle _x} forEach _obj};
    };
 
    
	scopeName "EPRST";
    
    while {true} do
    {
        _testpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
        _dir_TP = [_markerPos,_testpos] call BIS_fnc_dirTo;
	    _I = _DirBash select 0;
	    _II = _DirBash select 1;
	    _III = _DirBash select 2;
	    switch _index do {
		    case 0:{
		        _spawnpos = [_markerPos,0,300,5,5,_type] call Srv_fnc_findEmptyPos;
				_next = true;
		        breakTo "EPRST";
		    };
		    case 1:{
			    if((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
			    };
		    };
		    case 2:{
			    if(((_dir_TP > _I && {(_dir_TP - _I) > 45}) || {(_I > _dir_TP && {(_I - _dir_TP) > 45})})
			        &&
			        {((_dir_TP > _II && {(_dir_TP - _II) > 45}) || {(_II > _dir_TP && {(_II - _dir_TP) > 45})})}) then {
			        _spawnpos = _testpos;
					_next = true;
			        breakTo "EPRST";
                };
		    };			
	    };
    };
    
};

if(_next) then {
    _spawnpos = [_spawnpos select 0,_spawnpos select 1,0]; 
 
    _radioBashnya = _type createVehicle _spawnpos;
    _radioBashnya setPos _spawnpos;
    _radioBashnya setVectorUp [0,0,1];
    _radioBashnya setDir (random 360);
    _dir_bash = getDir _radioBashnya;
    _DirBash set [_index,([_markerPos,_spawnpos] call BIS_fnc_dirTo)];

    missionNameSpace setVariable ["DirBash",_DirBash,true];

    _radioBashnya setVariable ["gunmam",[],true];
    _radioBashnya setVariable ["Mine",[],true];
    _radioBashnya setVariable ["killed",true]; 
	_radioBashnya addEventHandler ["HandleDamage",
	{
		_it = _this # 0;
		_bomb = _this # 4;
		_instigator = _this # 6;
		if (_bomb == "SatchelCharge_Remote_Ammo") then {
			[_it,_instigator] call srv_fnc_destroyBash;
			
		} else {

			if (_bomb == "DemoCharge_Remote_Ammo") then {
				_bombcheck = _it getVariable ["demoChargesUsed",1];
				if (_bombcheck < 2) then {

					_it setVariable ["demoChargesUsed", _bombcheck + 1, true];
				
				} else {
					[_it,_instigator] call srv_fnc_destroyBash;			
				};
	    	} else {
				_it setDamage 0;
			};
		};
	}];

	_localb = getPosATL _radioBashnya;
	missionNamespace setVariable ["LocalB1", _localb, true];

   
   
   
   
    //--------------------------------укрепы от БРАТА--------------------
 //спавн объектов вокруг точек, скрипт Brother 	
	_radioBashnya call compile preprocessfilelinenumbers "serverconfig\broturrets\bash1_placing.sqf";

    //----------------------------------------------------------------------------
    [_radioBashnya] spawn srv_fnc_defenceBash;
	private _RTST = missionNameSpace getVariable "RTST";
	_RTST = _RTST + 1;
	missionNameSpace setVariable ["RTST",_RTST,true];
	//---------------------------------------------------------------

};

if(_index == 2) then {
    //----------------------спавн охрана города----------------------------------------
    [_marker,_radius] spawn srv_fnc_DefencePoint;
};