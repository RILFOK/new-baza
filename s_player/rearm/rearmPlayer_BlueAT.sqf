comment "B_soldier_LAT_F";

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
player addWeapon "arifle_MX_F";
player addPrimaryWeaponItem "acc_pointer_IR";
player addPrimaryWeaponItem "optic_Aco";
player addPrimaryWeaponItem "30Rnd_65x39_caseless_mag";
player addWeapon "launch_NLAW_F";
player addSecondaryWeaponItem "NLAW_F";
player addWeapon "hgun_P07_F";
player addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
player forceAddUniform "U_B_CombatUniform_mcam";
player addVest "V_PlateCarrier2_rgr";
player addBackpack "B_Kitbag_mcamo";
player addHeadgear "H_HelmetB_light_desert";
player addGoggles "G_Bandanna_beast";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addItemToUniform "MineDetector";
player addItemToUniform "30Rnd_65x39_caseless_mag";
player addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {player addItemToVest "FirstAidKit";};
for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "Chemlight_green";
for "_i" from 1 to 2 do {player addItemToBackpack "NLAW_F";};

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles";