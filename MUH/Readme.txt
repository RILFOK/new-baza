1. Скопировать папку в папку 
2. Добавить в initserver.sqf строки:
    MUH_fnc_spawnCraft = compileFinal preprocessFile "MUH\MUH_fnc_spawnCraft.sqf";
    MUH_fnc_cleanup = compileFinal preprocessFile "MUH\MUH_fnc_cleanup.sqf";
    MUH_fnc_mrProper = compileFinal preprocessFile "MUH\MUH_fnc_mrProper.sqf";
    MUH_fnc_despawnCraft = compileFinal preprocessFile "MUH\MUH_fnc_despawnCraft.sqf";
    #include "MUH\MUH_array.sqf"

3. Добавить строки в description.ext
    #include "MUH\dialogs\muh_dialogs.hpp"

4. Отредактировать файл MUH_array.sqf согласно описанию и требованию к массивам

5. Создаем объект на котором будет появляться меню и в его инициализацию вставляем текст ниже ("a_green_base" - имя массива из п.4):

this addAction ["Вызвать технику","MUH\muh_script.sqf",["a_green_base"],1.5,true,true,"","side _this == independent",50,false,"",""];
ИЛИ
this addAction ["Вызвать технику","MUH\muh_script.sqf",["a_green_base"],1.5,true,true,"","side _this == resistance",50,false,"",""];

//Вызывает технику
// Отзывает только поврежденную
// Отзывает всю технику, а пасажиров высаживает

/*
a_green_base
    mrk_car_greenbase
    mrk_air_greenbase
a_club_air
    mrk_car_club_air
    mrk_air_club_air
a_idap_air
    mrk_car_idap_air
    mrk_air_idap_air
a_selikano_air
    mrk_car_selikano_air
    mrk_air_selikano_air
*/
