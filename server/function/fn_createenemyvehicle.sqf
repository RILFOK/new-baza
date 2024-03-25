//create ENEMY vehicles	

params ["_group","_spawnpos","_type","_radius"];	

private _veh=createVehicle [_type, _spawnpos, [], _radius, "FLY"];
_veh setVariable ["UIDPlayerDam",[]];
_veh setVariable ["NumberOneDamage",[]];
_veh setVariable ["killed",true];
_veh addEventHandler ["HandleDamage",{_this spawn srv_fnc_HandleDamage;_this select 2}];
_veh addMPEventhandler ["MPKilled",{_this spawn srv_fnc_DeleteWreckVehicle;}];
_veh addItemCargoGlobal ["toolkit",5];
_veh setVariable ["dnt_remove_me",true,2];
[_veh,""] call srv_fnc_setVehicleName;
createVehicleCrew _veh;
private _crew = crew _veh;
_crew joinsilent _group;
_group addVehicle _veh;

{
  [_x] call srv_fnc_fset_AISkill;
  _x setVariable ["killed",true];
  _x addMPEventHandler ["mpkilled",{_this spawn srv_fnc_deletedeadman;}];
  _x addEventhandler ["killed",{
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;
  }];
} forEach _crew;

if(( damage _veh)>0.1) then {_veh setDamage 0};
 

 //опыт за выбивание ( срабатывает в том числе, если уничтожить с 1 попадания)
 
switch true do {
    case (_type in Car):{
		  _veh addEventHandler ["Hit", {
          params ["_unit", "_source", "_damage", "_instigator"];
          if (canMove _unit == true) exitwith {};
          _unit removeAllEventHandlers "Hit";
          ["kill",[_unit,_source,_instigator, 1]] spawn bt_fnc_eventScore;
      }];
    };
    case (_type in Tank):{
		  _veh addEventHandler ["Hit", {
          params ["_unit", "_source", "_damage", "_instigator"];
          if (canMove _unit == true) exitwith {};
          _unit removeAllEventHandlers "Hit";
          ["kill",[_unit,_source,_instigator, 1]] spawn bt_fnc_eventScore;
      }];
    };			
};

_veh