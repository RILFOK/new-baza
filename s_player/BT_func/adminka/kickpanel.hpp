class kick_panel
{
    idd = 6666789;
    onLoad = "uiNamespace setVariable ['KICKPANEL',_this select 0]"; //Save the display in the uiNamespace for easier access
    class Controls
    {
        class bgggg: BTIGUIBack
        {
            idc = 2200;
            x = 0.318242 * safezoneW + safezoneX;
            y = 0.192 * safezoneH + safezoneY;
            w = 0.216562 * safezoneW;
            h = 0.341 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class listp: BTRscListbox
        {
            idc = 1231500;
            x = 0.325977 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.0966797 * safezoneW;
            h = 0.264 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
            onMouseButtonClick = "[] spawn BT_fnc_click_spisok2;";
        };
        class spisokp: BTRscText
        {
            idc = 1231000;
            text = "Список игроков"; //--- ToDo: Localize;
            x = 0.325977 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.0734766 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
        };
        class RscFrame_1800: BTRscFrame
        {
            idc = 1231800;
            x = 0.322109 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.104414 * safezoneW;
            h = 0.319 * safezoneH;
            colorText[] = {1,0,0,1};
            colorBackground[] = {1,1,1,1};
            colorActive[] = {1,1,1,1};
        };
        class butkick: BTRscButton
        {
            idc = 1231601;
            text = "КИКНУТЬ"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.0850781 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,0,0,1};
            colorBackground[] = {0,0,0,0.5};
            action = "[] spawn BT_fnc_kiknut2";
        };
        class butclose: BTRscButton
        {
            idc = 1231602;
            text = "ЗАКРЫТЬ"; //--- ToDo: Localize;
            x = 0.438125 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0850781 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.5};
            action = "closeDialog 6666789";
        };
    };
};