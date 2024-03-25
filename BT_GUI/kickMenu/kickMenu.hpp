#define kick_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define kick_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define kick_W (safezoneH / 2)
#define kick_H (safezoneH / 2)

#define kick_otstup (kick_H / 60)

#define kick_width_control ((kick_W / 3) - (kick_otstup * 4))
#define kick_height_control (kick_H / 20)



class bt_kick_menu
{
	idd = 55000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class kick_group: BTRscControlsGroup
		{
			idc = 55001;
			x = kick_X;
			y = kick_Y;
			w = kick_W;
			h = kick_H;

			class Controls
			{
				class kick_bg: BTRscPicture
				{
					idc = 55002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = kick_W;
					h = kick_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class kick_list: BTRscListBox
				{
					idc = 55004;
					text = "";
					x = kick_otstup;
					y = kick_otstup;
					w = kick_width_control;
					h = kick_H - (kick_otstup * 2);

					//onLBSelChanged = "_this spawn bt_kick_fnc_listChange";
				};
				class kick_text: BTRscText
				{
					idc = 55005;
					text = "Причина:";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup;
					w = kick_width_control;
					h = kick_height_control;
				};
				class kick_check_1: BTRscCheckBox
				{
					idc = 55006;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 2 + kick_height_control;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_1_text: BTRscText
				{
					idc = 51007;
					text = "Тимкилл";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 2 + kick_height_control;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_2: BTRscCheckBox
				{
					idc = 55008;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 3 + kick_height_control * 2;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_2_text: BTRscText
				{
					idc = 51009;
					text = "Правила построения";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 3 + kick_height_control * 2;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_3: BTRscCheckBox
				{
					idc = 55010;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 4 + kick_height_control * 3;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_3_text: BTRscText
				{
					idc = 51011;
					text = "Не выход на связь";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 4 + kick_height_control * 3;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_4: BTRscCheckBox
				{
					idc = 55012;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 5 + kick_height_control * 4;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_4_text: BTRscText
				{
					idc = 51013;
					text = "Плохой Никнейм";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 5 + kick_height_control * 4;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_5: BTRscCheckBox
				{
					idc = 55014;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 6 + kick_height_control * 5;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_5_text: BTRscText
				{
					idc = 51015;
					text = "Возрождение";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 6 + kick_height_control * 5;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_6: BTRscCheckBox
				{
					idc = 55016;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 7 + kick_height_control * 6;
					w = kick_height_control;
					h = kick_height_control;
				};
				class kick_check_6_text: BTRscText
				{
					idc = 51017;
					text = "АФК";
					x = kick_otstup * 3 + kick_width_control + kick_height_control;
					y = kick_otstup * 7 + kick_height_control * 6;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_check_7_text: BTRscText
				{
					idc = 51018;
					text = "Другая причина:";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 7 + kick_height_control * 8;
					w = kick_width_control * 3;
					h = kick_height_control;
				};
				class kick_percent: BTRscEdit
				{
					idc = 55019;
					text = "";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 8 + kick_height_control * 9;
					w = kick_width_control * 3;
					h = kick_height_control * 4;
					style = "16 + 512";
				};
				class kick_button_text: BTRscButton1
				{
					idc = 55020;
					text = "КИК";
					x = kick_otstup * 2 + kick_width_control;
					y = kick_otstup * 10 + kick_height_control * 12;
					w = kick_width_control / 2;
					h = kick_height_control;
					action = "[] spawn bt_kick_fnc_kickButton";
				};
			};
		};
	};
};
