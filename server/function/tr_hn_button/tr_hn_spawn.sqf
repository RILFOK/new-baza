/*---------------------------------------------------
Скрипт для вызова техники при пустом ангаре (из 8 единиц техники) через addAction

Haron

Как пользоваться:  
Пример в init кнопки для вызова:
this addAction ["<t color='#00FFFF'>Вызвать Квилин</t>", {["O_LSV_02_unarmed_F",2] execVM "server\function\tr_hn_button\tr_hn_spawn.sqf"},[],1,false,true,"",'_this distance _target < 7'];
this addAction ["<t color='#00FFFF'>Вызать Замак</t>", {["O_Truck_02_transport_F",1] execVM "server\function\tr_hn_button\tr_hn_spawn.sqf"},[],1,false,true,"",'_this distance _target < 7'];

["O_LSV_02_unarmed_F",2] Первый параметр - класс техники, второй - допустимое количество такой техники на карте

Помимо кнопки требуется поставить маркер для спавна и прописать в init:
missionNameSpace setvariable ["_tr_hn_pad1",[getposATL this,getDir this], true];

-----------------------------------------------*/
params ["_veh_type","_veh_type_number"];
private ["_tr_hn_array","_tr_hn_cpos_array","_tr_hn_ipos_array","_veh_id_array","_veh_id_array_help","_tr_hn_distance_array",
		"_tr_hn_array_count","_tr_hn_pad","_veh","_tr_hn_veh_number_allow"]; 

_tr_hn_array = [];
{_tr_hn_array pushback (missionNamespace getvariable [_x,Objnull])}forEach ((allVariables missionNamespace) select {"tr_hn_veh" in _x});


_tr_hn_pad = missionNameSpace getvariable ["_tr_hn_pad1",[]];

_tr_hn_cpos_array = []; 
{_tr_hn_cpos_array pushBack (getPos _x)} forEach _tr_hn_array;

//systemchat str _tr_hn_array;
_veh_id_array = [];
{_veh_id_array pushback (_x getvariable ["_veh_netid",""])} forEach _tr_hn_array;
//systemchat str _veh_id_array;
_veh_id_array_help = [];
{_veh_id_array_help pushBack (missionNameSpace getvariable [_x,[]]) } forEach _veh_id_array;
//systemchat str _veh_id_array_help;
_tr_hn_ipos_array = []; 
{_tr_hn_ipos_array pushBack (_x select 3) } forEach _veh_id_array_help;

_tr_hn_distance_array = [];
_tr_hn_array_count = (count _tr_hn_array) -1;
for "_i" from 0 to _tr_hn_array_count do { 
	_tr_hn_distance_array pushback ((_tr_hn_cpos_array select _i) distance (_tr_hn_ipos_array select _i));
};


if (count (_tr_hn_distance_array select {_x < 150 }) == 0) then {
	_tr_hn_veh_number_allow = missionNameSpace getvariable [format ["_tr_hn_number_allow_veh%1",_veh_type],0];
	if ( _tr_hn_veh_number_allow < _veh_type_number) then {
		_tr_hn_safepos = (_tr_hn_pad # 0) findEmptyPosition [0, 0, _veh_type];
		if (count (_tr_hn_safepos) == 0) exitWith {hint "Освободите площадку для спавна";};
		_veh = createVehicle [ _veh_type, _tr_hn_pad # 0, [], 0, "CAN_COLLIDE" ];
		_veh setdir (_tr_hn_pad # 1);

		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearItemCargoGlobal _veh;

		_tr_hn_veh_number_allow = _tr_hn_veh_number_allow + 1;


		missionNameSpace setvariable [format ["_tr_hn_number_allow_veh%1",_veh_type],_tr_hn_veh_number_allow,true];

		[_veh,_veh_type] spawn srv_fnc_tr_hn_handle; 
		
	} else {
		hint "Все единицы данной техники сейчас заняты. Ожидайте.";
	};

} else {
	hint "В выдаче отказано. На базе все еще есть транспортная техника.";
};
