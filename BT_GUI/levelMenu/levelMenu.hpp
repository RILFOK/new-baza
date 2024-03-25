#define level_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define level_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define level_W (safezoneH / 2)
#define level_H (safezoneH / 2)

#define level_otstup (level_H / 60)

#define level_width_control ((level_W / 3) - (level_otstup * 4))
#define level_height_control (level_H / 20)



class bt_level_menu
{
	idd = 54000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class level_group: BTRscControlsGroup
		{
			idc = 54001;
			x = level_X;
			y = level_Y;
			w = level_W;
			h = level_H;

			class Controls
			{
				class level_bg: BTRscPicture
				{
					idc = 54002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = level_W;
					h = level_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class level_chang: BTRscCombo
				{
					idc = 54003;
					text = "";
					x = level_otstup;
					y = level_otstup;
					w = level_width_control;
					h = level_height_control;

					onLBSelChanged = "_this spawn bt_level_fnc_comboChange";
				};
				class level_list: BTRscListBox
				{
					idc = 54004;
					text = "";
					x = level_otstup;
					y = level_otstup * 2 + level_height_control;
					w = level_width_control;
					h = level_H - level_height_control - (level_otstup * 3);

					onLBSelChanged = "_this spawn bt_level_fnc_listChange";
				};
				class level_text: BTRscText
				{
					idc = 54005;
					text = "Звание - ";
					x = level_otstup * 2 + level_width_control;
					y = level_otstup;
					w = level_width_control;
					h = level_height_control;
					style = ST_RIGHT;
				};
				class level_percent: BTRscText
				{
					idc = 54006;
					text = "Процент - ";
					x = level_otstup * 2 + level_width_control;
					y = level_otstup * 2 + level_height_control;
					w = level_width_control;
					h = level_height_control;
					style = ST_RIGHT;
				};
				class level_exp_text: BTRscText
				{
					idc = 54007;
					text = "Добавить опыт (%)";
					x = level_otstup * 2 + level_width_control;
					y = level_otstup * 3 + level_height_control * 2;
					w = level_width_control;
					h = level_height_control;
					style = ST_RIGHT;
				};
				class level_enter_text: BTRscEdit
				{
					idc = 54008;
					text = "";
					x = level_otstup * 3 + level_width_control * 2;
					y = level_otstup * 3 + level_height_control * 2;
					w = level_width_control / 3;
					h = level_height_control;
				};
				class level_button_minus_text: BTRscButton1
				{
					idc = 54009;
					text = "-";
					x = level_otstup * 4 + level_width_control * 2 + (level_width_control / 3);
					y = level_otstup * 3 + level_height_control * 2;
					w = level_width_control / 3;
					h = level_height_control;
					action = "[] spawn bt_level_fnc_expButtonMinus";
				};
				class level_button_plus_text: BTRscButton1
				{
					idc = 54013;
					text = "+";
					x = level_otstup * 5 + level_width_control * 2  + ((level_width_control / 3) * 2);
					y = level_otstup * 3 + level_height_control * 2;
					w = level_width_control / 3;
					h = level_height_control;
					action = "[] spawn bt_level_fnc_expButtonPlus";
				};
				class level_chang_text: BTRscText
				{
					idc = 54010;
					text = "Изменить звание";
					x = level_otstup * 2 + level_width_control;
					y = level_otstup * 4 + level_height_control * 3;
					w = level_width_control;
					h = level_height_control;
					style = ST_RIGHT;
				};
				class level_change_combo: BTRscCombo
				{
					idc = 54011;
					text = "";
					x = level_otstup * 3 + level_width_control * 2;
					y = level_otstup * 4 + level_height_control * 3;
					w = level_width_control;
					h = level_height_control;
				};
				class level_change_button: BTRscButton1
				{
					idc = 54012;
					text = "Применить";
					x = level_otstup * 4 + level_width_control * 3;
					y = level_otstup * 4 + level_height_control * 3;
					w = level_width_control / 2;
					h = level_height_control;
					action = "[] spawn bt_level_fnc_changeButton";
				};
			};
		};
	};
};
