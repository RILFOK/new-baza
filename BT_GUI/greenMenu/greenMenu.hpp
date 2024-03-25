#define green_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define green_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define green_W (safezoneH / 2)
#define green_H (safezoneH / 2)

#define green_otstup (green_H / 60)

#define green_width_control ((green_W / 3) - (green_otstup * 4))
#define green_height_control (green_H / 20)



class bt_green_menu
{
	idd = 53000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class green_group: BTRscControlsGroup
		{
			idc = 53001;
			x = green_X;
			y = green_Y;
			w = green_W;
			h = green_H;

			class Controls
			{
				class green_bg: BTRscPicture
				{
					idc = 53002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = green_W;
					h = green_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class green_chang: BTRscCombo
				{
					idc = 53003;
					text = "";
					x = green_otstup;
					y = green_otstup;
					w = green_width_control;
					h = green_height_control;

					onLBSelChanged = "_this spawn bt_green_fnc_comboChange";
				};
				class green_list: BTRscListBox
				{
					idc = 53004;
					text = "";
					x = green_otstup;
					y = green_otstup * 2 + green_height_control;
					w = green_width_control;
					h = green_H - green_height_control - (green_otstup * 3);

					onLBSelChanged = "_this spawn bt_green_fnc_listChange";
				};
				class green_kick_text: BTRscText
				{
					idc = 53005;
					text = "Доступ на зеленую сторону";
					x = green_otstup * 3 + green_width_control * 1.2 ;
					y = green_otstup;
					w = green_width_control;
					h = green_height_control;
					style = ST_RIGHT;
				};
				class green_kick_check: BTRscCheckBox
				{
					idc = 53006;
					text = "";
					x = green_otstup * 6 + green_width_control * 2;
					y = green_otstup;
					w = green_height_control;
					h = green_height_control;

					onCheckedChanged = "[_this,""green""] spawn bt_green_fnc_checkChange";
				};
			};
		};
	};
};
