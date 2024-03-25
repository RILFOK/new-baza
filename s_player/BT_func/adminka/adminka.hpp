class adminka
{
    idd = 6666;
    onLoad = "uiNamespace setVariable ['ADMINKA',_this select 0]"; //Save the display in the uiNamespace for easier access
    class Controls
    {
        class dfsdfsf: BTIGUIBack
        {
            idc = 2200;
            x = -0.0625;
            y = -0.04;
            w = 1.125;
            h = 1.1;
            colorText[] = {0,0,0,0.6};
            colorBackground[] = {0,0,0,0.6};
        };
        class hjkhjkhjk: BTRscFrame
        {
            idc = 1800;
            x = -0.0375;
            y = 0;
            w = 0.3625;
            h = 1.02;
            colorText[] = {0,1,0,1};
        };
        class RscFrame_1801: BTRscFrame
        {
            idc = 1801;
            x = 0.3375;
            y = 0;
            w = 0.7;
            h = 0.56;
            colorText[] = {0,1,0,1};
        };
        class RscFrame_1802: BTRscFrame
        {
            idc = 1802;
            x = 0.3375;
            y = 0.58;
            w = 0.7;
            h = 0.44;
            colorText[] = {0,1,0,1};
        };
        class text1: BTRscText
        {
            idc = 1000;
            text = "Список игроков"; //--- ToDo: Localize;
            x = -0.025;
            y = 0.02;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text2: BTRscText
        {
            idc = 1001;
            text = "Звание:"; //--- ToDo: Localize;
            x = 0.35;
            y = 0.02;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text3: BTRscText
        {
            idc = 1002;
            text = "Доступ на зеленых:"; //--- ToDo: Localize;
            x = 0.725;
            y = 0.02;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text4: BTRscText
        {
            idc = 1003;
            text = "Допуск на авиа:"; //--- ToDo: Localize;
            x = 0.35;
            y = 0.28;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text5: BTRscText
        {
            idc = 1004;
            text = "Право на КИК:"; //--- ToDo: Localize;
            x = 0.725;
            y = 0.28;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text6: BTRscText
        {
            idc = 122005;
            text = ""; //--- ToDo: Localize;
            x = 0.35;
            y = 0.08;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text7: BTRscText
        {
            idc = 122006;
            text = ""; //--- ToDo: Localize;
            x = 0.725;
            y = 0.08;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text8: BTRscText
        {
            idc = 122007;
            text = ""; //--- ToDo: Localize;
            x = 0.35;
            y = 0.34;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class text9: BTRscText
        {
            idc = 122008;
            text = ""; //--- ToDo: Localize;
            x = 0.725;
            y = 0.34;
            w = 0.2875;
            h = 0.04;
            colorText[] = {1,1,1,1};
        };
        class zvanie3: BTRscCombo
        {
            idc = 222100;
            x = 0.35;
            y = 0.14;
            w = 0.25;
            h = 0.04;
            onMouseButtonClick = "[] spawn BT_fnc_id_1";
        };
        class dostup3: BTRscCombo
        {
            idc = 222101;
            x = 0.725;
            y = 0.14;
            w = 0.25;
            h = 0.04;
            onMouseButtonClick = "[] spawn BT_fnc_id_2";
        };
        class dopusk3: BTRscCombo
        {
            idc = 222102;
            x = 0.35;
            y = 0.4;
            w = 0.25;
            h = 0.04;
            onMouseButtonClick = "[] spawn BT_fnc_id_3";
        };
        class pravo3: BTRscCombo
        {
            idc = 222103;
            x = 0.725;
            y = 0.4;
            w = 0.25;
            h = 0.04;
            onMouseButtonClick = "[] spawn BT_fnc_id_4";
        };
        class but1: BTRscButton
        {
            idc = 1600;
            text = "ПРИМЕНИТЬ"; //--- ToDo: Localize;
            x = 0.3625;
            y = 0.62;
            w = 0.225;
            h = 0.06;
            colorText[] = {0,1,0,1};
            colorBackground[] = {0,0,0,0.6};
            action = "[] spawn BT_fnc_primenit";
        };
        class but2: BTRscButton
        {
            idc = 1601;
            text = "+ 25%"; //--- ToDo: Localize;
            x = 0.775;
            y = 0.62;
            w = 0.225;
            h = 0.06;
            colorText[] = {0,1,0,1};
            colorBackground[] = {0,0,0,0.6};
            action = "[] spawn BT_fnc_plus25";
        };
        class but3: BTRscButton
        {
            idc = 1602;
            text = "- 25%"; //--- ToDo: Localize;
            x = 0.775;
            y = 0.7;
            w = 0.225;
            h = 0.06;
            colorText[] = {1,0,0,1};
            colorBackground[] = {0,0,0,0.6};
            action = "[] spawn BT_fnc_minus25";
        };
        class but4: BTRscButton
        {
            idc = 1603;
            text = "КИКНУТЬ"; //--- ToDo: Localize;
            x = 0.3625;
            y = 0.92;
            w = 0.225;
            h = 0.06;
            colorText[] = {1,0,0,1};
            colorBackground[] = {0,0,0,0.6};
            action = "[] spawn BT_fnc_kiknut";
        };
        class but5: BTRscButton
        {
            idc = 1604;
            text = "ЗАКРЫТЬ"; //--- ToDo: Localize;
            x = 0.775;
            y = 0.92;
            w = 0.225;
            h = 0.06;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.6};
            action = "closeDialog 6666";
        };
        class list: BTRscListbox
        {
            idc = 122500;
            x = -0.0125;
            y = 0.1;
            w = 0.3125;
            h = 0.88;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.6};
            onMouseButtonClick = "[] spawn BT_fnc_click_spisok;";
        };
    };
};
