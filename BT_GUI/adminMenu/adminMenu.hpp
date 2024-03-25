#define admin_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define admin_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define admin_W (safezoneH / 2)
#define admin_H (safezoneH / 2)

#define admin_otstup (admin_H / 60)

#define admin_width_control ((admin_W / 3) - (admin_otstup * 4))
#define admin_height_control (admin_H / 20)



class bt_admin_menu
{
	idd = 57000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class admin_group: BTRscControlsGroup
		{
			idc = 57001;
			x = admin_X;
			y = admin_Y;
			w = admin_W;
			h = admin_H;

			class Controls
			{
				class admin_bg: BTRscPicture
				{
					idc = 57002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = admin_W;
					h = admin_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class admin_chang: BTRscCombo
				{
					idc = 57003;
					text = "";
					x = admin_otstup;
					y = admin_otstup;
					w = admin_width_control;
					h = admin_height_control;

					onLBSelChanged = "_this spawn bt_admin_fnc_comboChange";
				};
				class admin_list: BTRscListBox
				{
					idc = 57004;
					text = "";
					x = admin_otstup;
					y = admin_otstup * 2 + admin_height_control;
					w = admin_width_control;
					h = admin_H - admin_height_control - (admin_otstup * 3);

					onLBSelChanged = "_this spawn bt_admin_fnc_listChange";
				};
				class admin_kick_text: BTRscText
				{
					idc = 57005;
					text = "Доступ к кик-панели";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_kick_check: BTRscCheckBox
				{
					idc = 57006;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""kick""] spawn bt_admin_fnc_checkChange";
				};
				class admin_level_text: BTRscText
				{
					idc = 57007;
					text = "Управление званиями";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup * 2 + admin_height_control;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_level_check: BTRscCheckBox
				{
					idc = 57008;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup * 2 + admin_height_control;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""level_a""] spawn bt_admin_fnc_checkChange";
				};
				class admin_avia_text: BTRscText
				{
					idc = 57009;
					text = "Управление авиацией";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup * 3 + admin_height_control * 2;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_avia_check: BTRscCheckBox
				{
					idc = 57010;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup * 3 + admin_height_control * 2;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""avia""] spawn bt_admin_fnc_checkChange";
				};
				class admin_tank_text: BTRscText
				{
					idc = 57011;
					text = "Управление танкистами";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup * 4 + admin_height_control * 3;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_tank_check: BTRscCheckBox
				{
					idc = 57012;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup * 4 + admin_height_control * 3;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""tank""] spawn bt_admin_fnc_checkChange";
				};
				class admin_green_text: BTRscText
				{
					idc = 57013;
					text = "Управление зелеными";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup * 5 + admin_height_control * 4;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_green_check: BTRscCheckBox
				{
					idc = 57014;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup * 5 + admin_height_control * 4;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""green_a""] spawn bt_admin_fnc_checkChange";
				};
				class admin_kmb_text: BTRscText
				{
					idc = 57015;
					text = "Курс Молодого Бойца";
					x = admin_otstup * 2 + admin_width_control;
					y = admin_otstup * 6 + admin_height_control * 5;
					w = admin_width_control;
					h = admin_height_control;
					style = ST_RIGHT;
				};
				class admin_kmb_check: BTRscCheckBox
				{
					idc = 57016;
					text = "";
					x = admin_otstup * 3 + admin_width_control * 2;
					y = admin_otstup * 6 + admin_height_control * 5;
					w = admin_height_control;
					h = admin_height_control;

					onCheckedChanged = "[_this,""kmb""] spawn bt_admin_fnc_checkChange";
				};
			};
		};
	};
};
