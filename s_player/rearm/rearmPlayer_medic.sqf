removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "arifle_TRG21_F";
player addPrimaryWeaponItem "muzzle_snds_M";
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "optic_Yorris";
player addPrimaryWeaponItem "30Rnd_556x45_Stanag";
player addWeapon "hgun_Rook40_F";
player addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierIAGL_dgtl";
player addBackpack "B_Carryall_oli";

comment "Add binoculars";
player addWeapon "Binocular";

comment "Add items to containers";
player addItemToUniform "MineDetector";
for "_i" from 1 to 3 do {player addItemToUniform "16Rnd_9x21_Mag";};
player addItemToUniform "30Rnd_556x45_Stanag";
player addItemToVest "Medikit";
player addItemToVest "FirstAidKit";
for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 7 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToBackpack "MRAWS_HEAT_F";};
for "_i" from 1 to 5 do {player addItemToBackpack "30Rnd_556x45_Stanag";};
player addHeadgear "H_HelmetB_light";
player addGoggles "G_Combat";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_INDEP";