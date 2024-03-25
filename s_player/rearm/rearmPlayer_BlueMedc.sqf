comment "B_medic_F";

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
player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
player addVest "V_PlateCarrier_Kerry";
player addBackpack "B_AssaultPack_Kerry";
player addHeadgear "H_HelmetB_light_desert";

comment "Add items to containers";
player addItemToUniform "FirstAidKit";
player addItemToUniform "MineDetector";
player addItemToUniform "Chemlight_green";
player addItemToUniform "30Rnd_65x39_caseless_mag";
for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellGreen";
player addItemToVest "Chemlight_green";
player addItemToBackpack "Medikit";
for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles";