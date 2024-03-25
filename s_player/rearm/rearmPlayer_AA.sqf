removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "arifle_MX_Black_F";
player addPrimaryWeaponItem "muzzle_snds_H";
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "optic_Yorris";
player addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
player addWeapon "launch_I_Titan_F";
player addSecondaryWeaponItem "Titan_AA";
player addWeapon "hgun_P07_F";
player addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierIAGL_dgtl";
player addBackpack "B_Carryall_oli";

comment "Add binoculars";
player addWeapon "Rangefinder";

comment "Add items to containers";
player addItemToUniform "MineDetector";
for "_i" from 1 to 3 do {player addItemToUniform "16Rnd_9x21_Mag";};
player addItemToVest "30Rnd_65x39_caseless_black_mag";
for "_i" from 1 to 9 do {player addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 2 do {player addItemToBackpack "Titan_AA";};
for "_i" from 1 to 5 do {player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_black_mag_Tracer";};
player addHeadgear "H_HelmetB_light";
player addGoggles "G_Combat";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_OPFOR";