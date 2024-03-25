class gui_pilots
{
    idd = 123456789;
    onLoad = "uiNamespace setVariable ['PILOTS',_this select 0]"; //Save the display in the uiNamespace for easier access
    class Controls
    {       
        class bgg: BTIGUIBack
        {
            idc = 2200;
            x = -0.025;
            y = -0.02;
            w = 1.05;
            h = 1.06;
            colorBackground[] = {0,0,0,0.6};
        };
        class frame1: BTRscFrame
        {
            idc = 1800;
            x = -0.0125;
            y = 0;
            w = 0.3875;
            h = 1.02;
            colorText[] = {0,1,0,1};
        };
        class RscFrame_1801: BTRscFrame
        {
            idc = 1801;
            x = 0.3875;
            y = 0;
            w = 0.625;
            h = 0.32;
            colorText[] = {0,1,0,1};
        };
        class listp: BTRscListbox
        {
            idc = 1123123500;
            x = 0;
            y = 0.08;
            w = 0.3625;
            h = 0.92;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.6};
            onMouseButtonClick = "[] spawn BT_fnc_click_spisok_pilots;";
        };
        class spisok: BTRscText
        {
            idc = 1000;
            text = "Список игроков"; //--- ToDo: Localize;
            x = 0;
            y = 0.02;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli: BTRscText
        {
            idc = 1001;
            text = "Вертолеты"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.02;
            w = 0.5;
            h = 0.04;
            colorText[] = {1,1,1,1};
            sizeEx = 1.3 * GUI_GRID_H;
        };
        class heli1: BTRscText
        {
            idc = 1002;
            text = "Налет:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.08;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli2: BTRscText
        {
            idc = 1003;
            text = "Кол-во взлетов:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.14;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli3: BTRscText
        {
            idc = 1004;
            text = "Удачные посадки:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.2;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli4: BTRscText
        {
            idc = 1005;
            text = "Неудачные посадки:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.26;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane: BTRscText
        {
            idc = 1006;
            text = "Самолеты"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.36;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
            sizeEx = 1.3 * GUI_GRID_H;
        };
        class plane1: BTRscText
        {
            idc = 1007;
            text = "Налет:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.42;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane2: BTRscText
        {
            idc = 1008;
            text = "Кол-во взлетов:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.48;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane3: BTRscText
        {
            idc = 1009;
            text = "Удачные посадки:"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.54;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane4: BTRscText
        {
            idc = 1010;
            text = "Неудачные посадки"; //--- ToDo: Localize;
            x = 0.4;
            y = 0.6;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class RscFrame_1802: BTRscFrame
        {
            idc = 1802;
            x = 0.3875;
            y = 0.34;
            w = 0.625;
            h = 0.32;
            colorText[] = {0,1,0,1};
        };
        class heli5: BTRscText
        {
            idc = 1020;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.08;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli6: BTRscText
        {
            idc = 1012;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.14;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli7: BTRscText
        {
            idc = 1013;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.2;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class heli8: BTRscText
        {
            idc = 1014;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.26;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane5: BTRscText
        {
            idc = 1015;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.42;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane6: BTRscText
        {
            idc = 1016;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.48;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane7: BTRscText
        {
            idc = 1017;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.54;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class plane8: BTRscText
        {
            idc = 1018;
            text = ""; //--- ToDo: Localize;
            x = 0.7625;
            y = 0.6;
            w = 0.225;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class but: BTRscButton
        {
            idc = 1600;
            text = "ЗАКРЫТЬ"; //--- ToDo: Localize;
            x = 0.8125;
            y = 0.96;
            w = 0.2;
            h = 0.06;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.6};
            action = "closeDialog 123456789";
        };
    };
};