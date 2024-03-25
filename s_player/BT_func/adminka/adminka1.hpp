////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [UTF] moroz, v1.063, #Wivufi)
////////////////////////////////////////////////////////
class adminka
{
    idd = 6666;
    onLoad = "uiNamespace setVariable ['ADMINKA',_this select 0]"; //Save the display in the uiNamespace for easier access
    class Controls
    {
class fonbg: BTIGUIBack
{
	idc = 222200;
	x = 0.345312 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.55 * safezoneH;
	colorBackground[] = {0,0,0,0.5};
};
class p_list: BTRscListbox
{
	idc = 122500;
	x = 0.34918 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.127617 * safezoneW;
	h = 0.484 * safezoneH;
	colorBackground[] = {0,0,0,0.5};
	onMouseButtonClick = "[] spawn BT_fnc_click_spisok;";
};
class spisok: BTRscText
{
	idc = 122000;
	text = "Список игроков"; //--- ToDo: Localize;
	x = 0.34918 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.100547 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class name: BTRscText
{
	idc = 122001;
	text = ""; //--- ToDo: Localize;
	x = 0.488398 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.100547 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class zvanie: BTRscText
{
	idc = 122002;
	text = "Звание:"; //--- ToDo: Localize;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0232031 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class dostup1: BTRscText
{
	idc = 122003;
	text = "Доступ на зеленых:"; //--- ToDo: Localize;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0541406 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class dopusk: BTRscText
{
	idc = 122004;
	text = "Допуск на авиа:"; //--- ToDo: Localize;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0541406 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class zvanie1: BTRscText
{
	idc = 122005;
	text = ""; //--- ToDo: Localize;
	x = 0.507734 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class dostup2: BTRscText
{
	idc = 122006;
	text = ""; //--- ToDo: Localize;
	x = 0.542539 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0193359 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class dopusk2: BTRscText
{
	idc = 122007;
	text = ""; //--- ToDo: Localize;
	x = 0.532517 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0193359 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class combozvanie: BTRscCombo
{
	idc = 222100;
	text = ""; //--- ToDo: Localize;
	x = 0.573477 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	onMouseButtonClick = "[] spawn BT_fnc_id_1";
};
class combodostup: BTRscCombo
{
	idc = 222101;
	text = ""; //--- ToDo: Localize;
	x = 0.573477 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	onMouseButtonClick = "[] spawn BT_fnc_id_2";
};
class combodopusk: BTRscCombo
{
	idc = 222102;
	text = ""; //--- ToDo: Localize;
	x = 0.573477 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	onMouseButtonClick = "[] spawn BT_fnc_id_3";
};
class primenit: BTRscButton
{
	idc = 122600;
	text = "ПРИМЕНИТЬ"; //--- ToDo: Localize;
	x = 0.565742 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	action = "[] spawn BT_fnc_primenit";
};
class kiknut: BTRscButton
{
	idc = 122602;
	text = "КИКНУТЬ"; //--- ToDo: Localize;
	x = 0.565742 * safezoneW + safezoneX;
	y = 0.615 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	action = "[] spawn BT_fnc_kiknut";
};
class zakrit: BTRscButton
{
	idc = 122601;
	text = "ЗАКРЫТЬ"; //--- ToDo: Localize;
	x = 0.565742 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0734766 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.5};
	action = "closeDialog 6666";
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
