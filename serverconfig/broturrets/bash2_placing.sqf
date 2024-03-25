/*
Чтобы включить укреп для вышки, уберите комментарий с кода и поменяйте вызовы на нужные вам объекты. Сами функции не меняйте
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


["Land_Cargo_Patrol_V1_F" , 12 ,  20 ,  180  ] call _BRO_fnc_placing; 
 
["B_HMG_01_high_F" , 13 ,  19 ,  0 ,5 ] call _BRO_fnc_placing_turret;  
 
["Land_HBarrier_Big_F" , 13 ,  22 ,  180 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 8 ,  18.6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  18.6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  10 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 , 2 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , 16 ,  -6 ,  90 ] call _BRO_fnc_placing;  
 
["Land_HBarrier_Big_F" , 16 ,  -14 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -0.4 ,  -16 ,  90 ] call _BRO_fnc_placing; 
 
["Land_Cargo_Patrol_V1_F" , 11 ,  -13 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , 11 ,  -16.8 ,  180 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 2.4 ,  -20.6 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , -3.2 ,  -20.6 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 7.2 , -8.6 ,  90 ] call _BRO_fnc_placing; 
 
["Land_BagBunker_Large_F" , -6 , -18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -15 , -13 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , -8 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , 0 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -18.6 , 8 ,  90 ] call _BRO_fnc_placing; 
 
["Land_BagBunker_Tower_F" , -15 , 14 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -13.6 , 18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrier_Big_F" , -5 , 18 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall_corner_F" , 6 , 10 ,  0 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall6_F" , 9 , 5 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall6_F" , 9 , -3 ,  90 ] call _BRO_fnc_placing; 
 
["Land_HBarrierWall_corner_F" , 6 , -5.2 ,  90 ] call _BRO_fnc_placing; 
 
["Land_CzechHedgehog_01_new_F" , 6 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , 3 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , 0 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , -3 , 23 ,  180 ] call _BRO_fnc_placing;

["Land_CzechHedgehog_01_new_F" , -6 , 23 ,  180 ] call _BRO_fnc_placing;

*/

//["Box_NATO_AmmoOrd_F" , 10 ,  -14 ,  90,2 ] call _BRO_fnc_placing;

//["Box_NATO_Grenades_F" , 12 ,  -14 ,  90,2 ] call _BRO_fnc_placing;


/*["Land_HBarrier_5_F" , -11 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -11 ,  23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -5.6 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , -5.6 ,  23 ,  0  ] call _BRO_fnc_placing; 
 
["Land_HBarrier_5_F" , 0 ,  -23 ,  0  ] call _BRO_fnc_placing; 

["Land_HBarrier_5_F" , 0 ,  23 ,  0  ] call _BRO_fnc_placing; 

["Land_HBarrier_5_F" , 5.6 ,  -23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" , 5.6 ,  23 ,  0  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -15 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  24 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  18.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  13 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  7.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  2 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -3.6 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,12 ,  -9.2 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9,  -15 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  24 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  18.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9,  13 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  7.4 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  -3.6 ,  90  ] call _BRO_fnc_placing;

["Land_HBarrier_5_F" ,-9 ,  -9.2 ,  90  ] call _BRO_fnc_placing;

["Land_Cargo_House_V1_F" ,-5 ,  -19 ,  180  ] call _BRO_fnc_placing;

["Land_Cargo_Patrol_V1_F" ,6 ,  -20 ,  0  ] call _BRO_fnc_placing;

["Land_Cargo_Tower_V1_F" ,10 ,  16 ,  90  ] call _BRO_fnc_placing;

["B_HMG_01_high_F" ,6 ,  12 ,  180 ,40 ] call _BRO_fnc_placing_turret;

["B_static_AA_F" ,3 ,  18 ,  -70 ,40 ] call _BRO_fnc_placing_turret;

["Land_BagBunker_Tower_F" ,-4 ,  19 ,  90  ] call _BRO_fnc_placing;

["B_GMG_01_high_F"  ,-5 ,  19 ,  270 ,3 ] call _BRO_fnc_placing_turret;

["Land_BagBunker_Large_F" ,-16 ,  -3 ,  90  ] call _BRO_fnc_placing;

["B_HMG_01_high_F" ,-18 ,  -3 ,  180,1  ] call _BRO_fnc_placing_turret;

["B_HMG_01_high_F" ,-16 ,  -5 ,  270,1  ] call _BRO_fnc_placing_turret; */

