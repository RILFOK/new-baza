removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

//Add weapons
player addWeapon "srifle_EBR_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_DMS";
player addPrimaryWeaponItem "20Rnd_762x51_Mag";
player addPrimaryWeaponItem "bipod_03_F_blk";
player addWeapon "hgun_ACPC2_F";
player addHandgunItem "9Rnd_45ACP_Mag";

//Add containers
player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierIA1_dgtl";


player addWeapon "Binocular";

//Add items to containers
player addItemToUniform "FirstAidKit";
player addItemToUniform "MineDetector";
player addItemToUniform "Chemlight_green";
player addItemToUniform "MiniGrenade";
player addItemToUniform "SmokeShell";
for "_i" from 1 to 2 do {player addItemToVest "9Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "Chemlight_green";
player addItemToVest "20Rnd_762x51_Mag";
player addHeadgear "H_HelmetIA";

//Add items
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";

