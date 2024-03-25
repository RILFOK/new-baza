removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add weapons";
player addWeapon "LMG_Zafir_F";
player addPrimaryWeaponItem "acc_flashlight";
player addPrimaryWeaponItem "150Rnd_762x54_Box";
player addWeapon "hgun_P07_F";
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
for "_i" from 1 to 2 do {player addItemToVest "150Rnd_762x54_Box";};
for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 5 do {player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToBackpack "150Rnd_762x54_Box";};
player addHeadgear "H_HelmetB_light";
player addGoggles "G_Combat";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_OPFOR";