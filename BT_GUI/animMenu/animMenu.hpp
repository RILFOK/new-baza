#define anim_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define anim_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define anim_W (safezoneH / 2)
#define anim_H (safezoneH / 2)

#define anim_otstup (anim_H / 60)

#define anim_width_control ((anim_W / 3) - (anim_otstup * 4))
#define anim_height_control (anim_H / 20)



class bt_anim_menu
{
	idd = 58000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	onUnload = "player setVariable ['animMenuOpen',false];";

	class Controls
    {
		class anim_group: BTRscControlsGroup
		{
			idc = 58001;
			x = anim_X;
			y = anim_Y;
			w = anim_W;
			h = anim_H;

			class Controls
			{/*
				class anim_chang: BTRscCombo
				{
					idc = 58003;
					text = "";
					x = anim_otstup;
					y = anim_otstup;
					w = anim_width_control * 1.3;
					h = anim_height_control;

					onLBSelChanged = "_this spawn bt_anim_fnc_comboChange";
				};*/

				class anim_list: BTRscListBox
				{
					idc = 58004;
					text = "";
					x = 0.372194 * safezoneW + safezoneX;
					y = 0.311922 * safezoneH + safezoneY;
					w = 0.255611 * safezoneW;
					h = 0.291522 * safezoneH;

					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};

					
					//onLBSelChanged = "_this spawn bt_anim_fnc_listChange";
				};
				class anim_cam_button: BTRscButton1
				{
					idc = 58015;
					text = "Выбрать";
					x = 0.372194 * safezoneW + safezoneX;
					y = 0.612847 * safezoneH + safezoneY;
					w = 0.255611 * safezoneW;
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

					action = "[] spawn bt_anim_fnc_animPlay";
				};
				class anim_cam_stopbutton: BTRscButton1
				{
					idc = 58016;
					text = "Прервать";
					x = 0.372194 * safezoneW + safezoneX;
					y = 0.612847 * safezoneH + safezoneY + (0.0376157 * safezoneH )*1.1;
					w = 0.255611 * safezoneW;
					h = 0.0376157 * safezoneH;


					colorBackground[] = {0.38,0.031,0.031,1};
					
					
					colorBackgroundActive[] = {0.38,0.031,0.031,0.9};

					action = "player switchmove ''";
				};
			};
		};
	};
};
