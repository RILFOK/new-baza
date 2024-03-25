params ["_player"];
removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeBackpack _player;
removeGoggles _player;

_player forceAddUniform "U_I_CombatUniform_shortsleeve";

for "_i" from 1 to 5 do {_player addItemToUniform "FirstAidKit"};

_player addWeapon "Binocular";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemRadio";
_player linkItem "ItemGPS";

