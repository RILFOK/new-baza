removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_B_CombatUniform_mcam";
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
player addItemToUniform "MineDetector";
player addItemToUniform "SmokeShell";
player addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {player addItemToVest "30Rnd_556x45_Stanag";};
player addItemToVest "SmokeShellOrange";
player addItemToVest "SmokeShell";

player addHeadgear "H_HelmetCrew_B";
player addGoggles "G_Combat";

player addWeapon "arifle_Mk20C_F";
player addPrimaryWeaponItem "optic_ACO_grn";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
player linkItem "NVGoggles_INDEP";
