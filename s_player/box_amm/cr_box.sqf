private ["_box","_safe_pos","_pos","_posis"];
_posis = _this select 0;

_safe_pos = [_posis, 1, 2, 3, 0, 0, 0] call BIS_fnc_findSafePos;
_box = "O_CargoNet_01_ammo_F" createVehicle _safe_pos;
0 = ["AmmoboxInit",[_box,true]] spawn BIS_fnc_arsenal;

if (!isNull _box) then {hint "Боеприпасы созданы";};

if (count box_arr == max_count_box) then
{
	deleteVehicle (box_arr select box_count);
	box_arr set [box_count, _box];
	box_count = box_count + 1;
	if (box_count == max_count_box) then 
	{
		box_count = 0;
	};
}else{
	box_arr pushBack _box;
};
publicVariable "box_arr";
publicVariable "box_count";
publicVariable "max_count_box";