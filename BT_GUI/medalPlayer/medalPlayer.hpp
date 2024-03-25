#define medals_X ((safezoneX + (safezoneW / 3.5)) - (safezoneH / 4))
#define medals_Y ((safezoneY + (safezoneH / 3.5)) - (safezoneH / 4))
#define medals_W (safezoneH / 1)
#define medals_H (safezoneH / 1.1)

#define medals_otstup (medals_H / 60)

#define medals_width_control ((medals_W / 3) - (medals_otstup * 4))
#define medals_height_control (medals_H / 20)



class bt_medal_player
{
	idd = 77000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	onUnload = "player setVariable ['medalMenuOpen',false];";
	
	class Controls
    {
		class medals_group: BTRscControlsGroup
		{
			idc = 77001;
			x = medals_X;
			y = medals_Y;
			w = medals_W;
			h = medals_H;

			class Controls
			{
				class medals_bg: BTRscPicture
				{
					idc = 77002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = medals_W;
					h = medals_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class medals_info: BTRscPicture
				{
					idc = 77092;
					text = "BT_GUI\medals\3_2.paa";
					x = medals_otstup * 28 + medals_width_control;
					y = medals_otstup * 6;
					w = medals_height_control * 6;
					h = medals_height_control * 6;
				};
				class medals_text: BTRscText
				{
					idc = 77005;
					text = "Информация о медали:";
					x = medals_otstup * 30 + medals_width_control;
					y = medals_otstup * 23;
					w = medals_width_control / 2;
					h = medals_height_control;
				};
				class medals_text_1: BTRscText
				{
					idc = 77101;
					text = "Другие медали:";
					x = medals_height_control;
					y = medals_otstup * 4;
					w = medals_width_control / 2;
					h = medals_height_control;
				};
				class medals_text_2: BTRscText
				{
					idc = 77102;
					text = "Лучший недели:";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 4;
					w = medals_width_control / 2;
					h = medals_height_control;
				};
				class medals_text_3: BTRscText
				{
					idc = 77103;
					text = "Лучший:";
					x = medals_otstup * 28 + medals_height_control;
				 	y = medals_otstup * 4;
					w = medals_width_control / 2;
					h = medals_height_control;
				};
				class medals_text_11: BTRscText
				{
					idc = 77401;
					text = "Название";
					x = medals_otstup * 30 + medals_width_control;
					y = medals_otstup * 25;
					w = medals_width_control / 2;
					h = medals_height_control;
				};
				/*
				class medals_text_12: BTRscText
				{
					idc = 77402;
					text = "Выдается за";
					x = medals_otstup * 30 + medals_width_control;
					y = medals_otstup * 27;
					w = medals_width_control / 1.25;
					h = medals_height_control * 2;
				};
				*/
				class medals_check_2_text: BTRscText
				{
					idc = 78093;
					text = "Кол-во медалей:";
					x = medals_otstup * 30 + medals_width_control;
					y = medals_otstup * 29 + medals_height_control;
					w = medals_width_control / 3;
					h = medals_height_control;
			    };
				/*
				class medals_check_12_text: BTRscText
				{
					idc = 78094;
					text = "Дата получения первой медали:";
					x = medals_otstup * 30 + medals_width_control;
					y = medals_otstup * 31 + medals_height_control;
					w = medals_width_control;
					h = medals_height_control;
			    };
				
				class medals_check_13_text: BTRscText
				{
					idc = 78095;
					text = "14.03.2023";
					x = medals_otstup * 41 + medals_width_control;
					y = medals_otstup * 31 + medals_height_control;
					w = medals_width_control / 4;
					h = medals_height_control;
			    };
				*/
				class medals_check_3_text: BTRscText
				{
					idc = 78094;
					text = "0";
					x = medals_otstup * 36 + medals_width_control;
					y = medals_otstup * 29 + medals_height_control;
					w = medals_width_control / 4;
					h = medals_height_control;
			    };
				class medals_check_4_text: BTRscText
				{
				    idc = 78009;
				 	text = "Имя игрока";
				 	x = medals_otstup * 7 + medals_width_control;
				 	y = medals_otstup;
				 	w = medals_width_control;
				 	h = medals_height_control;
				};
				// class medals_check_3_text: BTRscText
				// {
				// 	idc = 78011;
				// 	text = "Не выход на связь";
				// 	x = medals_otstup * 3 + medals_width_control + medals_height_control;
				// 	y = medals_otstup * 4 + medals_height_control * 3;
				// 	w = medals_width_control * 3;
				// 	h = medals_height_control;
				// };
				// class medals_check_4_text: BTRscText
				// {
				// 	idc = 78013;
				// 	text = "Плохой Никнейм";
				// 	x = medals_otstup * 3 + medals_width_control + medals_height_control;
				// 	y = medals_otstup * 5 + medals_height_control * 4;
				// 	w = medals_width_control * 3;
				// 	h = medals_height_control;
				// };
				// class medals_check_5_text: BTRscText
				// {
				// 	idc = 78015;
				// 	text = "Возрождение";
				// 	x = medals_otstup * 3 + medals_width_control + medals_height_control;
				// 	y = medals_otstup * 6 + medals_height_control * 5;
				// 	w = medals_width_control * 3;
				// 	h = medals_height_control;
				// };
				// class medals_check_6_text: BTRscText
				// {
				// 	idc = 78017;
				// 	text = "АФК";
				// 	x = medals_otstup * 3 + medals_width_control + medals_height_control;
				// 	y = medals_otstup * 7 + medals_height_control * 6;
				// 	w = medals_width_control * 3;
				// 	h = medals_height_control;
				// };
				// class medals_check_7_text: BTRscText
				// {
				// 	idc = 78018;
				// 	text = "Другая причина:";
				// 	x = medals_otstup * 2 + medals_width_control;
				// 	y = medals_otstup * 7 + medals_height_control * 8;
				// 	w = medals_width_control * 3;
				// 	h = medals_height_control;
				// };

				class medals_button_1_text: BTRscButton1
				{
					idc = 77020;
					text = "Вернуться";
					x = medals_otstup;
					y = medals_otstup * 10 + medals_height_control * 15;
					w = medals_width_control / 2;
					h = medals_height_control;
					action = "[] spawn bt_medalPlayer_fnc_backButton";
				};
				

				class medals_1_1: BTRscPicture
				{
					idc = 77051;
					text = "BT_GUI\medals\1_1.paa";
					x = medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_1_2: BTRscPicture
				{
					idc = 77052;
					text = "BT_GUI\medals\1_2.paa";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_1_3: BTRscPicture
				{
					idc = 77053;
					text = "BT_GUI\medals\1_3.paa";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_1_4: BTRscPicture
				{
				 	idc = 77054;
				 	text = "BT_GUI\medals\1_4.paa";
				 	x = medals_otstup * 21+ medals_height_control;
				 	y = medals_otstup * 7;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_1_5: BTRscPicture
				{
				 	idc = 77055;
				 	text = "BT_GUI\medals\1_5.paa";
				 	x = medals_otstup * 28 + medals_height_control;
				 	y = medals_otstup * 7;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_1_6: BTRscPicture
				{
				 	idc = 77056;
				 	text = "BT_GUI\medals\1_6.paa";
				 	x = medals_otstup * 35 + medals_height_control;
				 	y = medals_otstup * 7;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_2_1: BTRscPicture
				{
					idc = 77057;
					text = "BT_GUI\medals\2_1.paa";
					x = medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_2_2: BTRscPicture
				{
					idc = 77058;
					text = "BT_GUI\medals\2_2.paa";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_2_3: BTRscPicture
				{
					idc = 77059;
					text = "BT_GUI\medals\2_3.paa";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_2_4: BTRscPicture
				{
					idc = 77060;
					text = "BT_GUI\medals\2_4.paa";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_2_5: BTRscPicture
				{
					idc = 77061;
					text = "BT_GUI\medals\2_5.paa";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_2_6: BTRscPicture
				{
				 	idc = 77062;
				 	text = "BT_GUI\medals\2_6.paa";
				 	x = medals_otstup * 35 + medals_height_control;
				 	y = medals_otstup * 14;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_3_1: BTRscPicture
				{
				 	idc = 77063;
				 	text = "BT_GUI\medals\3_1.paa";
				 	x = medals_height_control;
				 	y = medals_otstup * 21;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_3_2: BTRscPicture
				{
				 	idc = 77064;
				 	text = "BT_GUI\medals\3_2.paa";
				 	x = medals_otstup * 7 + medals_height_control;
				 	y = medals_otstup * 21;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_3_3: BTRscPicture
				{
					idc = 77065;
					text = "BT_GUI\medals\3_3.paa";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_3_4: BTRscPicture
				{
					idc = 77066;
					text = "BT_GUI\medals\3_4.paa";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_3_5: BTRscPicture
				{
					idc = 77067;
					text = "BT_GUI\medals\3_5.paa";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_3_6: BTRscPicture
				{
					idc = 77068;
					text = "BT_GUI\medals\3_6.paa";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_4_1: BTRscPicture
				{
					idc = 77069;
					text = "BT_GUI\medals\4_1.paa";
					x = medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_4_2: BTRscPicture
				{
				 	idc = 77070;
				 	text = "BT_GUI\medals\4_2.paa";
				 	x = medals_otstup * 7 + medals_height_control;
				 	y = medals_otstup * 28;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_4_3: BTRscPicture
				{
				 	idc = 77071;
				 	text = "BT_GUI\medals\4_3.paa";
				 	x = medals_otstup * 14 + medals_height_control;
				 	y = medals_otstup * 28;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_4_4: BTRscPicture
				{
				 	idc = 77072;
				 	text = "BT_GUI\medals\4_4.paa";
				 	x = medals_otstup * 21+ medals_height_control;
				 	y = medals_otstup * 28;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_4_5: BTRscPicture
				{
					idc = 77073;
					text = "BT_GUI\medals\4_5.paa";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_4_6: BTRscPicture
				{
					idc = 77074;
					text = "BT_GUI\medals\4_6.paa";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_5_1: BTRscPicture
				{
					idc = 77075;
					text = "BT_GUI\medals\5_1.paa";
					x = medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_5_2: BTRscPicture
				{
					idc = 77076;
					text = "BT_GUI\medals\5_2.paa";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_5_3: BTRscPicture
				{
					idc = 77077;
					text = "BT_GUI\medals\5_3.paa";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_5_4: BTRscPicture
				{
				 	idc = 77078;
				 	text = "BT_GUI\medals\5_4.paa";
				 	x = medals_otstup * 21+ medals_height_control;
				 	y = medals_otstup * 35;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_5_5: BTRscPicture
				{
				 	idc = 77079;
				 	text = "BT_GUI\medals\5_5.paa";
				 	x = medals_otstup * 28 + medals_height_control;
				 	y = medals_otstup * 35;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_5_6: BTRscPicture
				{
				 	idc = 77080;
				 	text = "BT_GUI\medals\5_6.paa";
				 	x = medals_otstup * 35+ medals_height_control;
				 	y = medals_otstup * 35;
				 	w = medals_height_control * 2;
				 	h = medals_height_control * 2;
				};
				class medals_6_1: BTRscPicture
				{
					idc = 77081;
					text = "BT_GUI\medals\6_1.paa";
					x = medals_height_control;
					y = medals_otstup * 42;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};
				class medals_6_2: BTRscPicture
				{
					idc = 77082;
					text = "BT_GUI\medals\6_2.paa";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 42;
					w = medals_height_control * 2;
					h = medals_height_control * 2;
				};

                // кнопки.................................................................
				class medals_button_11_text: BTRscButton1
				{
					idc = 77151;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77151] call bt_medalPlayer_fnc_info";
				};
				class medals_button_12_text: BTRscButton1
				{
					idc = 77152;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77152] call bt_medalPlayer_fnc_info";
				};
				class medals_button_13_text: BTRscButton1
				{
					idc = 77153;
					text = "i";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77153] call bt_medalPlayer_fnc_info";
				};
				class medals_button_14_text: BTRscButton1
				{
					idc = 77154;
					text = "i";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77154] call bt_medalPlayer_fnc_info";
				};
				class medals_button_15_text: BTRscButton1
				{
					idc = 77155;
					text = "i";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77155] call bt_medalPlayer_fnc_info";
				};
				class medals_button_16_text: BTRscButton1
				{
					idc = 77156;
					text = "i";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 7;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77156] call bt_medalPlayer_fnc_info";
				};
				class medals_button_17_text: BTRscButton1
				{
					idc = 77157;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77157] call bt_medalPlayer_fnc_info";
				};
				class medals_button_18_text: BTRscButton1
				{
					idc = 77158;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77158] call bt_medalPlayer_fnc_info";
				};
				class medals_button_19_text: BTRscButton1
				{
					idc = 77159;
					text = "i";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77159] call bt_medalPlayer_fnc_info";
				};
				class medals_button_20_text: BTRscButton1
				{
					idc = 77160;
					text = "i";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77160] call bt_medalPlayer_fnc_info";
				};
				class medals_button_21_text: BTRscButton1
				{
					idc = 77161;
					text = "i";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77161] call bt_medalPlayer_fnc_info";
				};
				class medals_button_22_text: BTRscButton1
				{
					idc = 77162;
					text = "i";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 14;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77162] call bt_medalPlayer_fnc_info";
				};
				class medals_button_23_text: BTRscButton1
				{
					idc = 77163;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77163] call bt_medalPlayer_fnc_info";
				};
				class medals_button_24_text: BTRscButton1
				{
					idc = 77164;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77164] call bt_medalPlayer_fnc_info";
				};
				class medals_button_25_text: BTRscButton1
				{
					idc = 77165;
					text = "i";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77165] call bt_medalPlayer_fnc_info";
				};
				class medals_button_26_text: BTRscButton1
				{
					idc = 77166;
					text = "i";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77166] call bt_medalPlayer_fnc_info";
				};
				class medals_button_27_text: BTRscButton1
				{
					idc = 77167;
					text = "i";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77167] call bt_medalPlayer_fnc_info";
				};
				class medals_button_28_text: BTRscButton1
				{
					idc = 77168;
					text = "i";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 21;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77168] call bt_medalPlayer_fnc_info";
				};
				class medals_button_29_text: BTRscButton1
				{
					idc = 77169;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77169] call bt_medalPlayer_fnc_info";
				};
				class medals_button_30_text: BTRscButton1
				{
					idc = 77170;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77170] call bt_medalPlayer_fnc_info";
				};
				class medals_button_31_text: BTRscButton1
				{
					idc = 77171;
					text = "i";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77171] call bt_medalPlayer_fnc_info";
				};
				class medals_button_32_text: BTRscButton1
				{
					idc = 77172;
					text = "i";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77172] call bt_medalPlayer_fnc_info";
				};
				class medals_button_33_text: BTRscButton1
				{
					idc = 77173;
					text = "i";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77173] call bt_medalPlayer_fnc_info";
				};
				class medals_button_34_text: BTRscButton1
				{
					idc = 77174;
					text = "i";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 28;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77174] call bt_medalPlayer_fnc_info";
				};
				class medals_button_35_text: BTRscButton1
				{
					idc = 77175;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77175] call bt_medalPlayer_fnc_info";
				};
				class medals_button_36_text: BTRscButton1
				{
					idc = 77176;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77176] call bt_medalPlayer_fnc_info";
				};
				class medals_button_37_text: BTRscButton1
				{
					idc = 77177;
					text = "i";
					x = medals_otstup * 14 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77177] call bt_medalPlayer_fnc_info";
				};
				class medals_button_38_text: BTRscButton1
				{
					idc = 77178;
					text = "i";
					x = medals_otstup * 21 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77178] call bt_medalPlayer_fnc_info";
				};
				class medals_button_39_text: BTRscButton1
				{
					idc = 77179;
					text = "i";
					x = medals_otstup * 28 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77179] call bt_medalPlayer_fnc_info";
				};
				class medals_button_40_text: BTRscButton1
				{
					idc = 77180;
					text = "i";
					x = medals_otstup * 35 + medals_height_control;
					y = medals_otstup * 35;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77180] call bt_medalPlayer_fnc_info";
				};
				class medals_button_41_text: BTRscButton1
				{
					idc = 77181;
					text = "i";
					x = medals_otstup + medals_height_control;
					y = medals_otstup * 42;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77181] call bt_medalPlayer_fnc_info";
				};
				class medals_button_42_text: BTRscButton1
				{
					idc = 77182;
					text = "i";
					x = medals_otstup * 7 + medals_height_control;
					y = medals_otstup * 42;
					w = medals_height_control / 4;
					h = medals_height_control / 4;
					action = "[77182] call bt_medalPlayer_fnc_info";
				};
			};
		};
	};
};
