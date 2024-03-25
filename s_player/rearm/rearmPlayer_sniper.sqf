removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player addWeapon "srifle_DMR_02_F";
player addPrimaryWeaponItem "optic_LRPS";
player addPrimaryWeaponItem "10Rnd_338_Mag";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "11Rnd_45ACP_Mag";

player forceAddUniform "U_I_FullGhillie_lsh";
player addVest "V_HarnessO_brn";
player addBackpack "B_Kitbag_rgr";

player addWeapon "Rangefinder";

player addItemToUniform "NVGoggles_INDEP";
player addItemToUniform "MineDetector";
player addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {player addItemToUniform "SmokeShell";};
for "_i" from 1 to 3 do {player addItemToVest "10Rnd_338_Mag";};
for "_i" from 1 to 3 do {player addItemToBackpack "FirstAidKit";};
for "_i" from 1 to 15 do {player addItemToBackpack "SmokeShell";};
for "_i" from 1 to 3 do {player addItemToBackpack "10Rnd_338_Mag";};
for "_i" from 1 to 3 do {player addItemToBackpack "11Rnd_45ACP_Mag";};
player addHeadgear "H_MilCap_gry";
player addGoggles "G_Balaclava_oli";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
