#define tank_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define tank_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define tank_W (safezoneH / 2)
#define tank_H (safezoneH / 2)

#define tank_otstup (tank_H / 60)

#define tank_width_control ((tank_W / 3) - (tank_otstup * 4))
#define tank_height_control (tank_H / 20)



class bt_tank_menu
{
	idd = 52000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class tank_group: BTRscControlsGroup
		{
			idc = 52001;
			x = tank_X;
			y = tank_Y;
			w = tank_W;
			h = tank_H;

			class Controls
			{
				class tank_bg: BTRscPicture
				{
					idc = 52002;
					text = "#(argb,8,8,3)color(0,0,0,0.7)";
					x = 0;
					y = 0;
					w = tank_W;
					h = tank_H;
					colorBackground[] = {0,0,0,0.7};
				};
				class tank_chang: BTRscCombo
				{
					idc = 52003;
					text = "";
					x = tank_otstup;
					y = tank_otstup;
					w = tank_width_control;
					h = tank_height_control;

					onLBSelChanged = "_this spawn bt_tank_fnc_comboChange";
				};
				class tank_list: BTRscListBox
				{
					idc = 52004;
					text = "";
					x = tank_otstup;
					y = tank_otstup * 2 + tank_height_control;
					w = tank_width_control;
					h = tank_H - tank_height_control - (tank_otstup * 3);

					onLBSelChanged = "_this spawn bt_tank_fnc_listChange";
				};
				class tank_kick_text: BTRscText
				{
					idc = 52005;
					text = "Допуск 1";
					x = tank_otstup * 2 + tank_width_control;
					y = tank_otstup;
					w = tank_width_control;
					h = tank_height_control;
					style = ST_RIGHT;
				};
				class tank_kick_check: BTRscCheckBox
				{
					idc = 52006;
					text = "";
					x = tank_otstup * 3 + tank_width_control * 2;
					y = tank_otstup;
					w = tank_height_control;
					h = tank_height_control;

					onCheckedChanged = "[_this,""tank_1""] spawn bt_tank_fnc_checkChange";
				};
				class tank_level_text: BTRscText
				{
					idc = 52007;
					text = "Допуск 2";
					x = tank_otstup * 2 + tank_width_control;
					y = tank_otstup * 2 + tank_height_control;
					w = tank_width_control;
					h = tank_height_control;
					style = ST_RIGHT;
				};
				class tank_level_check: BTRscCheckBox
				{
					idc = 52008;
					text = "";
					x = tank_otstup * 3 + tank_width_control * 2;
					y = tank_otstup * 2 + tank_height_control;
					w = tank_height_control;
					h = tank_height_control;

					onCheckedChanged = "[_this,""tank_2""] spawn bt_tank_fnc_checkChange";
				};
				class tank_level1_text: BTRscText
				{
					idc = 52009;
					text = "Допуск 3";
					x = tank_otstup * 2 + tank_width_control;
					y = tank_otstup * 3 + (tank_height_control * 2);
					w = tank_width_control;
					h = tank_height_control;
					style = ST_RIGHT;
				};
				class tank_level1_check: BTRscCheckBox
				{
					idc = 52010;
					text = "";
					x = tank_otstup * 3 + tank_width_control * 2;
					y = tank_otstup * 3 + (tank_height_control * 2);
					w = tank_height_control;
					h = tank_height_control;

					onCheckedChanged = "[_this,""tank_3""] spawn bt_tank_fnc_checkChange";
				};
				class tank_levelart_text: BTRscText
				{
					idc = 52011;
					text = "Допуск 4";
					x = tank_otstup * 2 + tank_width_control;
					y = tank_otstup	 * 4 + (tank_height_control * 3);
					w = tank_width_control;
					h = tank_height_control;
					style = ST_RIGHT;
				};
				class tank_levelart_check: BTRscCheckBox
				{
					idc = 52012;
					text = "";
					x = tank_otstup * 3 + tank_width_control * 2;
					y = tank_otstup * 4 + (tank_height_control * 3);
					w = tank_height_control;
					h = tank_height_control;

					onCheckedChanged = "[_this,""tank_4""] spawn bt_tank_fnc_checkChange";
				};
			};
		};
	};
};
