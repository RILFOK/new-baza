/*_player = param[0];
removeAllWeapons _player;
_player addAction ["Do Damage","(_this select 0) setDamage 0.7;"];
_player addAction ["Gun Shop","[] spawn BT_fnc_showGunShopDialog;"];
while {countDown > -1} do {hint str(countDown);};