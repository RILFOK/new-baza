removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_I_pilotCoveralls";
for "_i" from 1 to 7 do {player addItemToUniform "FirstAidKit";};
player addItemToUniform "SmokeShell";
player addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {player addItemToVest "O_IR_Grenade";};
for "_i" from 1 to 7 do {player addItemToVest "50Rnd_570x28_SMG_03";};

player addWeapon "SMG_03C_black";
//player addPrimaryWeaponItem "optic_ACO_grn";
player addWeapon "Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "O_UavTerminal";
