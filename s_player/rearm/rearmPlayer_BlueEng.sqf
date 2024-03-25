comment "B_soldier_mine_F";

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
player addWeapon "arifle_MXC_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Holosight";
player addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
player addWeapon "hgun_P07_F";
player addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
player forceAddUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrierGL_rgr";
player addBackpack "B_Carryall_cbr";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
player addItemToUniform "Chemlight_green";
player addItemToVest "MineDetector";
for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 3 do {player addItemToVest "APERSMine_Range_Mag";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "Chemlight_green";
player addItemToBackpack "ToolKit";
for "_i" from 1 to 6 do {player addItemToBackpack "APERSMine_Range_Mag";};
for "_i" from 1 to 4 do {player addItemToBackpack "APERSBoundingMine_Range_Mag";};
//for "_i" from 1 to 1 do {player addItemToBackpack "APERSMineDispenser_Mag";};
for "_i" from 1 to 4 do {player addItemToBackpack "APERSTripMine_Wire_Mag";};
player addHeadgear "H_HelmetB_light_snakeskin";
player addGoggles "G_Bandanna_blk";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles";
