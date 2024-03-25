#define avia_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define avia_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define avia_W (safezoneH / 2)
#define avia_H (safezoneH / 2)

#define avia_otstup (avia_H / 60)

#define avia_width_control ((avia_W / 3) - (avia_otstup * 4))
#define avia_height_control (avia_H / 20)



class bt_avia_menu
{
	idd = 51000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class avia_group: BTRscControlsGroup
		{
			idc = 51001;
			x = avia_X;
			y = avia_Y;
			w = avia_W;
			h = avia_H;

			class Controls
			{
				class avia_bg: BTRscPicture
				{
					idc = 51002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = avia_W;
					h = avia_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class avia_chang: BTRscCombo
				{
					idc = 51003;
					text = "";
					x = avia_otstup;
					y = avia_otstup;
					w = avia_width_control;
					h = avia_height_control;

					onLBSelChanged = "_this spawn bt_avia_fnc_comboChange";
				};
				class avia_list: BTRscListBox
				{
					idc = 51004;
					text = "";
					x = avia_otstup;
					y = avia_otstup * 2 + avia_height_control;
					w = avia_width_control;
					h = avia_H - avia_height_control - (avia_otstup * 3);

					onLBSelChanged = "_this spawn bt_avia_fnc_listChange";
				};
				class avia_t_h_text: BTRscText
				{
					idc = 51005;
					text = "Транспортный вертолеты";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup;
					w = avia_width_control;
					h = avia_height_control;
					style = ST_RIGHT;
				};
				class avia_t_h_check: BTRscCheckBox
				{
					idc = 51006;
					text = "";
					x = avia_otstup * 3 + avia_width_control * 2;
					y = avia_otstup;
					w = avia_height_control;
					h = avia_height_control;

					onCheckedChanged = "[_this,""avia_t_h""] spawn bt_avia_fnc_checkChange";
				};
				class avia_t_p_text: BTRscText
				{
					idc = 51007;
					text = "Транспортный самолеты";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup * 2 + avia_height_control;
					w = avia_width_control;
					h = avia_height_control;
					style = ST_RIGHT;
				};
				class avia_t_p_check: BTRscCheckBox
				{
					idc = 51008;
					text = "";
					x = avia_otstup * 3 + avia_width_control * 2;
					y = avia_otstup * 2 + avia_height_control;
					w = avia_height_control;
					h = avia_height_control;

					onCheckedChanged = "[_this,""avia_t_p""] spawn bt_avia_fnc_checkChange";
				};
				class avia_b_h_text: BTRscText
				{
					idc = 51009;
					text = "Боевые вертолеты";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup * 3 + avia_height_control * 2;
					w = avia_width_control;
					h = avia_height_control;
					style = ST_RIGHT;
				};
				class avia_b_h_check: BTRscCheckBox
				{
					idc = 51010;
					text = "";
					x = avia_otstup * 3 + avia_width_control * 2;
					y = avia_otstup * 3 + avia_height_control * 2;
					w = avia_height_control;
					h = avia_height_control;

					onCheckedChanged = "[_this,""avia_b_h""] spawn bt_avia_fnc_checkChange";
				};
				class avia_b_p_text: BTRscText
				{
					idc = 51011;
					text = "Боевые самолеты";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup * 4 + avia_height_control * 3;
					w = avia_width_control;
					h = avia_height_control;
					style = ST_RIGHT;
				};
				class avia_b_p_check: BTRscCheckBox
				{
					idc = 51012;
					text = "";
					x = avia_otstup * 3 + avia_width_control * 2;
					y = avia_otstup * 4 + avia_height_control * 3;
					w = avia_height_control;
					h = avia_height_control;

					onCheckedChanged = "[_this,""avia_b_p""] spawn bt_avia_fnc_checkChange";
				};
				class avia_b_storm_text: BTRscText
				{
					idc = 51013;
					text = "Шторм";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup * 5 + avia_height_control * 4;
					w = avia_width_control;
					h = avia_height_control;
					style = ST_RIGHT;
				};
				class avia_b_storm_check: BTRscCheckBox
				{
					idc = 51014;
					text = "";
					x = avia_otstup * 3 + avia_width_control * 2;
					y = avia_otstup * 5 + avia_height_control * 4;
					w = avia_height_control;
					h = avia_height_control;

					onCheckedChanged = "[_this,""avia_b_storm""] spawn bt_avia_fnc_checkChange";
				};

				class avia_cam_button: BTRscButton1
				{
					idc = 51015;
					text = "КАМЕРА";
					x = avia_otstup * 2 + avia_width_control;
					y = avia_otstup * 6 + avia_height_control * 5;
					w = avia_width_control * 0.7;
					h = avia_height_control;
					action = "[] spawn bt_avia_fnc_cam";
				};
			};
		};
	};
};
