//// Создаем массив для вызова машин на точке появления 
// Создадим 3 маркера и назовем их (Обязательно маркер) cars_green_base, heli_green_base, air_green_base 
// А массив для нее a_green_base
// 1. класснейм техники
// 2. имя точка появления
// 3. Скрипт при инициализации
// 4. Отображаемое имя в списке
// 5. nil

a_green_base = [
	["C_Heli_Light_01_civil_F", "mrk_air_greenbase", "", "М900", nil],
	["C_IDAP_Heli_Transport_02_F", "mrk_air_greenbase", "", "EH302 IDAP", nil],
	["C_Tractor_01_F", "mrk_car_greenbase", "", "Трактор", nil],
	["C_Truck_02_covered_F", "mrk_car_greenbase", "", "Замак", nil],
	["C_IDAP_Truck_02_F", "mrk_car_greenbase", "", "Замак IDAP", nil],
	["C_IDAP_Van_02_transport_F", "mrk_car_greenbase", "", "Транспортный фургон IDAP", nil],
	["C_Van_01_box_F", "mrk_car_greenbase", "", "Фургон", nil],
	["C_Van_02_transport_F", "mrk_car_greenbase", "", "Транспортный фургон", nil],
	["C_Hatchback_01_sport_F", "mrk_car_greenbase", "", "Хэтчбэк спортивный", nil],
	["C_Offroad_01_comms_F", "mrk_car_greenbase", "", "Внедорожник Связь", nil],
	["C_Offroad_01_comms_F", "mrk_car_greenbase", "", "Внедорожник Связь", nil],
	["C_Truck_02_fuel_F", "mrk_car_greenbase", "", "Топливозаправщик Замак", nil],
	["C_Van_02_service_F", "mrk_car_greenbase", "", "Фургон Служебный", nil],
	["B_GEN_Van_02_transport_F", "mrk_car_greenbase", "", "Фургон Транспортный", nil],
	["I_C_Offroad_02_unarmed_F", "mrk_car_greenbase", "", "MB 4WD", nil],
//	["B_APC_Wheeled_01_cannon_F", "mrk_car_greenbase", "params [""_new""]; clearBackpackCargoGlobal _new; clearItemCargoGlobal _new;clearWeaponCargoGlobal _new;clearMagazineCargoGlobal _new;", "Маршал", nil],
	["C_SUV_01_F", "mrk_car_greenbase", "", "СУВ", nil]
/*
Для очистки инвентаря техники, при спавне, в третий блок добавляем:
"params [""_new""]; clearBackpackCargoGlobal _new; clearItemCargoGlobal _new;clearWeaponCargoGlobal _new;clearMagazineCargoGlobal _new;"
*/
/*
	Пример со сменой раскраски
	["RHS_AN2_B",  "air_green_base", "
params [""_new""];
_new setObjectTextureGlobal [0, ""rhsgref\addons\rhsgref_air\an2\data\an2_1_b_co.paa""];
_new setObjectTextureGlobal [1, ""rhsgref\addons\rhsgref_air\an2\data\an2_2_b_co.paa""];
_new setObjectTextureGlobal [2, ""rhsgref\addons\rhsgref_air\an2\data\an2_wings_b_co.paa""];
	", "АН-2", nil]

copyToClipboard str getObjectTextures vehicle player; - Получить список текстур техники в которой сидит игрок.

*/
	/*
	["B_Heli_Light_01_dynamicLoadout_F", "pawnee_3", 
	"
	params [""_new""]; 
	{_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } 
	forEach getPylonMagazines _new; 
	_new setPylonLoadout [1, ""PylonWeapon_300Rnd_20mm_shells"", true];
	_new setPylonLoadout [2, ""PylonWeapon_300Rnd_20mm_shells"", true];
	", "Pawnee3", nil]
	*/
	//["B_Heli_Light_01_dynamicLoadout_F", "pawnee_3", "params [""_new""]; {_new removeWeaponGlobal getText (configFile >> ""CfgMagazines"" >> _x >> ""pylonWeapon"") } forEach getPylonMagazines _new; _new setPylonLoadout [1, ""PylonWeapon_300Rnd_20mm_shells"", true];_new setPylonLoadout [2, ""PylonWeapon_300Rnd_20mm_shells"", true];", "Pawnee3", nil]
];
a_club_air = [
	["C_Heli_Light_01_civil_F", "mrk_air_club_air", "", "М900", nil],
	["C_IDAP_Heli_Transport_02_F", "mrk_air_club_air", "", "EH302 IDAP", nil],
	["C_Plane_Civil_01_F", "mrk_air_club_air", "", "Цэсна", nil],
	["C_Plane_Civil_01_racing_F", "mrk_air_club_air", "", "Цэсна спорт", nil],
	["C_Van_01_fuel_F", "mrk_car_club_air", "", "Грузовик топливозаправщик", nil],
	["C_Tractor_01_F", "mrk_car_club_air", "", "Трактор", nil],
	["C_Truck_02_covered_F", "mrk_car_club_air", "", "Замак", nil],
	["C_IDAP_Truck_02_F", "mrk_car_club_air", "", "Замак IDAP", nil],
	["C_IDAP_Van_02_transport_F", "mrk_car_club_air", "", "Транспортный фургон IDAP", nil],
	["C_Van_01_box_F", "mrk_car_club_air", "", "Фургон", nil],
	["C_Van_02_transport_F", "mrk_car_club_air", "", "Транспортный фургон", nil],
	["C_Hatchback_01_sport_F", "mrk_car_club_air", "", "Хэтчбэк спортивный", nil],
	["C_Offroad_01_comms_F", "mrk_car_club_air", "", "Внедорожник Связь", nil],
	["C_Offroad_01_comms_F", "mrk_car_club_air", "", "Внедорожник Связь", nil],
	["C_Truck_02_fuel_F", "mrk_car_club_air", "", "Топливозаправщик Замак", nil],
	["C_Van_02_service_F", "mrk_car_club_air", "", "Фургон Служебный", nil],
	["B_GEN_Van_02_transport_F", "mrk_car_club_air", "", "Фургон Транспортный", nil],
	["I_C_Offroad_02_unarmed_F", "mrk_car_club_air", "", "MB 4WD", nil],
	["C_SUV_01_F", "mrk_car_club_air", "", "СУВ", nil]
];
a_idap_air = [
	["C_Heli_Light_01_civil_F", "mrk_air_idap_air", "", "М900", nil],
	["C_IDAP_Heli_Transport_02_F", "mrk_air_idap_air", "", "EH302 IDAP", nil],
	["C_Plane_Civil_01_F", "mrk_air_idap_air", "", "Цэсна", nil],
	["C_Plane_Civil_01_racing_F", "mrk_air_idap_air", "", "Цэсна спорт", nil],
	["C_Van_01_fuel_F", "mrk_car_idap_air", "", "Грузовик топливозаправщик", nil],
	["C_Tractor_01_F", "mrk_car_idap_air", "", "Трактор", nil],
	["C_Truck_02_covered_F", "mrk_car_idap_air", "", "Замак", nil],
	["C_IDAP_Truck_02_F", "mrk_car_idap_air", "", "Замак IDAP", nil],
	["C_IDAP_Van_02_transport_F", "mrk_car_idap_air", "", "Транспортный фургон IDAP", nil],
	["C_Van_01_box_F", "mrk_car_idap_air", "", "Фургон", nil],
	["C_Van_02_transport_F", "mrk_car_idap_air", "", "Транспортный фургон", nil],
	["C_Hatchback_01_sport_F", "mrk_car_idap_air", "", "Хэтчбэк спортивный", nil],
	["C_Offroad_01_comms_F", "mrk_car_idap_air", "", "Внедорожник Связь", nil],
	["C_Offroad_01_comms_F", "mrk_car_idap_air", "", "Внедорожник Связь", nil],
	["C_Truck_02_fuel_F", "mrk_car_idap_air", "", "Топливозаправщик Замак", nil],
	["C_Van_02_service_F", "mrk_car_idap_air", "", "Фургон Служебный", nil],
	["B_GEN_Van_02_transport_F", "mrk_car_idap_air", "", "Фургон Транспортный", nil],
	["I_C_Offroad_02_unarmed_F", "mrk_car_idap_air", "", "MB 4WD", nil],
	["C_SUV_01_F", "mrk_car_idap_air", "", "СУВ", nil]
];
a_selikano_air = [
	["C_Heli_Light_01_civil_F", "mrk_air_selikano_air", "", "М900", nil],
	["C_IDAP_Heli_Transport_02_F", "mrk_air_selikano_air", "", "EH302 IDAP", nil],
	["C_Plane_Civil_01_F", "mrk_air_selikano_air", "", "Цэсна", nil],
	["C_Plane_Civil_01_racing_F", "mrk_air_selikano_air", "", "Цэсна спорт", nil],
	["C_Van_01_fuel_F", "mrk_car_selikano_air", "", "Грузовик топливозаправщик", nil],
	["C_Tractor_01_F", "mrk_car_selikano_air", "", "Трактор", nil],
	["C_Truck_02_covered_F", "mrk_car_selikano_air", "", "Замак", nil],
	["C_IDAP_Truck_02_F", "mrk_car_selikano_air", "", "Замак IDAP", nil],
	["C_IDAP_Van_02_transport_F", "mrk_car_selikano_air", "", "Транспортный фургон IDAP", nil],
	["C_Van_01_box_F", "mrk_car_selikano_air", "", "Фургон", nil],
	["C_Van_02_transport_F", "mrk_car_selikano_air", "", "Транспортный фургон", nil],
	["C_Hatchback_01_sport_F", "mrk_car_selikano_air", "", "Хэтчбэк спортивный", nil],
	["C_Offroad_01_comms_F", "mrk_car_selikano_air", "", "Внедорожник Связь", nil],
	["C_Offroad_01_comms_F", "mrk_car_selikano_air", "", "Внедорожник Связь", nil],
	["C_Truck_02_fuel_F", "mrk_car_selikano_air", "", "Топливозаправщик Замак", nil],
	["C_Van_02_service_F", "mrk_car_selikano_air", "", "Фургон Служебный", nil],
	["B_GEN_Van_02_transport_F", "mrk_car_selikano_air", "", "Фургон Транспортный", nil],
	["I_C_Offroad_02_unarmed_F", "mrk_car_selikano_air", "", "MB 4WD", nil],
	["C_SUV_01_F", "mrk_car_selikano_air", "", "СУВ", nil]
];
