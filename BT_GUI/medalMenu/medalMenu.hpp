#define medal_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define medal_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define medal_W (safezoneH / 2)
#define medal_H (safezoneH / 2)

#define medal_otstup (medal_H / 60)

#define medal_width_control ((medal_W / 3) - (medal_otstup * 4))
#define medal_height_control (medal_H / 20)



class bt_medal_menu
{
	idd = 33300;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	onUnload = "player setVariable ['medalMenuOpen',false];";
	
	class Controls
    {
		class medalMenu_group: BTRscControlsGroup
		{
			idc = 33301;
			x = medal_X;
			y = medal_Y;
			w = medal_W;
			h = medal_H;

			class Controls
			{
				/*
				class medalMenu_bg: BTRscPicture
				{
					idc = 33302;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = 0.123399 * safezoneW;
					h = medal_H;
					colorBackground[] = {0,0,0,0.7};
				};
				*/
				class medalMenu_list: BTRscListBox
				{
					idc = 33304;
					text = "";
					x = 0.412344 * safezoneW + safezoneX;
					y = 0.321325 * safezoneH + safezoneY;
					w = 0.1 * safezoneW;
					h = 0.28 * safezoneH;
					colorText[] = { 1,1,1,1 };
					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};
				};

				class medalMenu_button_text: BTRscButton1
				{
					idc = 33305;
					text = "Посмотреть статистику";
					x = 0.412344 * safezoneW + safezoneX;
					y = 0.321325 * safezoneH + safezoneY + 0.3 * safezoneH;
					w = 0.1 * safezoneW;
					h = 0.0376157 * safezoneH;
					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};

					
					colorBackgroundActive[] = {
						0,
						0,
						0,
						0.6
					};

					colorText[] = { 1,1,1,1 };
					action = "[] spawn bt_medal_fnc_medalButton";
				};
			};
		};
	};
};
