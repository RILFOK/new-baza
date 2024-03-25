comment "B_HeavyGunner_F";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "MMG_02_sand_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Hamr";
player addPrimaryWeaponItem "130Rnd_338_Mag";
player addPrimaryWeaponItem "bipod_01_F_snd";
player addWeapon "hgun_P07_F";
player addHandgunItem "16Rnd_9x21_Mag";
player addWeapon "Laserdesignator";
player addMagazine "Laserbatteries";

comment "Add containers";
player forceAddUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrier1_rgr";
player addBackpack "B_Kitbag_mcamo";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addItemToUniform "MineDetector";
player addItemToUniform "SmokeShell";
player addItemToUniform "SmokeShellGreen";
player addItemToBackpack "Laserbatteries";
for "_i" from 1 to 2 do {player addItemToUniform "Chemlight_green";};
for "_i" from 1 to 2 do {player addItemToVest "130Rnd_338_Mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToBackpack "130Rnd_338_Mag";};
player addHeadgear "H_HelmetB_light_grass";
player addGoggles "G_Bandanna_khk";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles";

comment "Set identity";
[player,"WhiteHead_21","male09eng"] call BIS_fnc_setIdentity;
