class adminka_specmission
{
    idd = 66667788;
    onLoad = "uiNamespace setVariable ['ADMINKA_SPECMISSION',_this select 0]";
    class Controls
    {
        class bgggspec: BTIGUIBack
        {
            idc = 220088;
            x = 0.356914 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.286172 * safezoneW;
            h = 0.484 * safezoneH;
            colorBackground[] = {0,0,0,0.3};
        };
        class nazv: BTRscText
        {
            idc = 100088;
            text = "Название"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.131484 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class vrem: BTRscText
        {
            idc = 100188;
            text = "Время и дата начала (МСК)"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.131484 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class opis: BTRscText
        {
            idc = 100288;
            text = "Краткое описание"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.131484 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class nazv1: BTRscEdit
        {
            idc = 140088;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.27457 * safezoneW;
            h = 0.033 * safezoneH;
            text = "";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class vrem1: BTRscEdit
        {
            idc = 140188;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.27457 * safezoneW;
            h = 0.033 * safezoneH;
            text = "";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class opis1: BTRscEdit
        {
            idc = 140288;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.27457 * safezoneW;
            h = 0.187 * safezoneH;
            text = "";
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class prim: BTRscButton
        {
            idc = 160088;
            text = "ПРИМЕНИТЬ"; //--- ToDo: Localize;
            x = 0.364648 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.116016 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
            action = "[] spawn BT_fnc_prim_specmission";
        };
        class konec: BTRscButton
        {
            idc = 160188;
            text = "ЗАКРЫТЬ"; //--- ToDo: Localize;
            x = 0.519336 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.116016 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
            action = "closeDialog 66667788";
        };
        class primname: BTRscText
        {
            idc = 100388;
            text = "Пример: Злой Ta66y"; //--- ToDo: Localize;
            x = 0.503867 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.131484 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
        class primvrem: BTRscText
        {
            idc = 100488;
            text = "Пример: 19:30 5.12.18"; //--- ToDo: Localize;
            x = 0.503867 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.131484 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.3};
        };
    };
};