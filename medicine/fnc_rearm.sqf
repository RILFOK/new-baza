/*_patient = _this select 0;

sleep 0.5;
_patient remoteExec ["removeAllWeapons"];
_patient remoteExec ["removeAllItems"];
_patient remoteExec ["removeVest"];
_patient remoteExec ["removeBackpack"];
_patient remoteExec ["removeHeadgear"];
_patient remoteExec ["removeGoggles"];
[_patient] joinSilent (group player);*/

_patient = _this select 0;

sleep 0.5;
_patVest = vest _patient;
_patBackpack = backpack _patient;
_backCont = backpackContainer _patient;

_patWeap = primaryWeapon _patient;
_secWeap = secondaryWeapon _patient;
_hgWep = handgunWeapon _patient;
_prWpIt = primaryWeaponItems _patient;
_hgear = headgear _patient;
_ggles = goggles _patient;
_pWmag = primaryWeaponMagazine _patient;
_secWmag = secondaryWeaponMagazine _patient;
_hWmag = handgunMagazine _patient;
_itms = itemsWithMagazines _patient;
_nvgs = hmd _patient;
_prWepAc = _patient weaponAccessories primaryWeapon _patient;


_patient remoteExecCall ["removeAllWeapons"];
_patient remoteExecCall ["removeAllItems"];
_patient unassignItem _nvgs;
_patient removeItem _nvgs;
removeVest _patient;
removeBackpackGlobal _patient;
removeHeadgear _patient;
removeGoggles _patient;
_patient setVariable ["nevid",false,true];

_veh = createVehicle ["Box_Syndicate_Ammo_F", position _patient, [], 1, "CAN_COLLIDE"];
_veh setMaxLoad 5000;	//	Обязательно добавить вместительности
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearItemCargoGlobal _veh;

_veh addItemCargoGlobal [_patVest, 1];
_veh addItemCargoGlobal [_patWeap,1];
_veh addItemCargoGlobal [_secWeap,1];
_veh addItemCargoGlobal [_hgWep,1];
_veh addItemCargoGlobal [_nvgs,1];
_veh addBackpackCargoGlobal [_patBackpack,1];
_veh addItemCargoGlobal [_hgear,1];
_veh addItemCargoGlobal [_ggles,1];
_veh addItemCargoGlobal [(_pWmag select 0),1];
_veh addItemCargoGlobal [(_secWmag select 0),1];
_veh addItemCargoGlobal [(_hWmag select 0),1];
{
	_veh addItemCargoGlobal [_x ,1];
} forEach _prWepAc;

{
	_veh addItemCargoGlobal [_x ,1];
} forEach _itms;
sleep 120;
[_veh] remoteExecCall ["deleteVehicle"];