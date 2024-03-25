//techieslove <3

(_this select 1) removeAction (_this select 2); // убираем кнопочку
player sideChat "Запрашиваем авиа удар . . .";
sleep 3;
[side (_this select 1),"HQ"] sideChat "Бомба в пути. . .";
sleep 7;
_projectile = createVehicle ["Bo_GBU12_LGB", getPosATL (laserTarget (_this select 1)) , [], 0, "FLY"]; // создание бомбы
[side (_this select 1),"HQ"] sideChat "Разрыв. . .";