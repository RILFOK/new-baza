removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_O_PilotCoveralls";
for "_i" from 1 to 7 do {player addItemToUniform "FirstAidKit";};
player addItemToUniform "SmokeShell";
player addVest "V_TacVest_oli";
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {player addItemToVest "O_IR_Grenade";};
for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
player addBackpack "B_Parachute";
player addHeadgear "H_PilotHelmetFighter_O";

player addWeapon "arifle_MXC_Black_F";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";