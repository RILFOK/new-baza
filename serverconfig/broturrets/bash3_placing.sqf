/*
Чтобы включить укреп для передатчика, уберите комментарий с кода и поменяйте вызовы на нужные вам объекты. Сами функции не меняйте
                                                                                         						Haron

АЛТИС

*/





/* // это не менять 
private _radioBashnya = _this;

private _grp = createGroup west; 
 
private _BRO_fnc_placing = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _obj = _class createVehicle getPosWorld _radioBashnya; 
 _obj setDir _az+_angle; 
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"];  
}; 
 
private _BRO_fnc_placing_turret = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _obj = _class createVehicle getPosWorld _radioBashnya; 
 _obj setDir _az+_angle; 
 _obj setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _obj setVehiclePosition [[getPosATL _obj select 0, getPosATL _obj select 1, _offset], [], 0, "CAN_COLLIDE"]; 
 _man = _grp createUnit ["rhsgref_cdf_b_reg_engineer", position _obj,[],10,"FORM"]; 
 _man setSkill 1; 
 _man allowFleeing 0; 
 [_man] join _grp; 
 _man moveInGunner _obj;    
}; 
 
private _BRO_fnc_placing_trooper = { 
 params ["_class","_X","_Y","_angle","_offset"]; 
 if (isNil "_offset") then {_offset = 0}; 
 _az = getDir _radioBashnya; 
 _man = _grp createUnit [_class, getPosWorld _radioBashnya,[],0,"NONE"]; 
 _man setDir _az+_angle; 
 _man setPos (_radioBashnya modelToWorld [_X,_Y]); 
 _man setVehiclePosition [[getPosATL _man select 0, getPosATL _man select 1, _offset], [], 0, "CAN_COLLIDE"]; 
 _man setSkill 1; 
 _man allowFleeing 0; 
 [_man] join _grp; 
 doStop _man;    
}; 



// менять отсюда 

*/