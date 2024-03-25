class adminka_main_menu
{
    idd = 666677;
    onLoad = "uiNamespace setVariable ['ADMINKA_MAIN_MENU',_this select 0]";
    class Controls
    {
        class backg: BTIGUIBack
        {
            idc = 220077;
            x = 0.3125;
            y = 0.04;
            w = 0.3125;
            h = 0.64;
            colorBackground[] = {0,0,0,0.3};
        };
        class igroki: BTRscButton
        {
            idc = 160077;
            text = "Список игроков"; //--- ToDo: Localize;
            x = 0.3375;
            y = 0.08;
            w = 0.2625;
            h = 0.08;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
            action = "closeDialog 666677, [] spawn BT_fnc_adminka";
        };
        class pilot: BTRscButton
        {
            idc = 160177;
            text = "Меню пилотов"; //--- ToDo: Localize;
            x = 0.3375;
            y = 0.2;
            w = 0.2625;
            h = 0.08;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class specmission: BTRscButton
        {
            idc = 160277;
            text = "Спецмиссия"; //--- ToDo: Localize;
            x = 0.3375;
            y = 0.32;
            w = 0.2625;
            h = 0.08;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
            action = "closeDialog 666677, [] spawn BT_fnc_adm_specmission";
        };
    };
};
