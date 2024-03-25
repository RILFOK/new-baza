removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "U_I_FullGhillie_lsh";
player addVest "V_PlateCarrierIAGL_oli";
player addBackpack "B_Carryall_oli";
for "_i" from 1 to 5 do {player addItemToBackpack "FirstAidKit";};
player addHeadgear "H_HelmetCrew_I";
player addGoggles "G_Bandanna_blk";

player addWeapon "Rangefinder";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";
