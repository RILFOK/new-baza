#define kmenu_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define kmenu_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define kmenu_W (safezoneH / 2)
#define kmenu_H (safezoneH / 2)

#define kmenu_otstup (kmenu_H / 60)

#define kmenu_width_control ((kmenu_W / 3) - (kmenu_otstup * 4))
#define kmenu_height_control (kmenu_H / 20)



class bt_kmb_menu
{
	idd = 59000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;

	class Controls
    {
		class kmb_group: BTRscControlsGroup
		{
			idc = 59001;
			x = kmenu_X;
			y = kmenu_Y;
			w = kmenu_W;
			h = kmenu_H;

			class Controls
			{	/*
				class kmb_text1: BTRscText
				{
					idc = 59001;
					text = "КМБ Инструктора";
					x = 0.328123 * safezoneW + safezoneX;
					y = 0.28371 * safezoneH + safezoneY;
					w = 0.118992 * safezoneW;
					h = 0.0282118 * safezoneH;
					SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";

					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};
				};
				*/
			
				class kmb_text2: BTRscText
				{
					idc = 59002;
					text = "Новобранцы";
					x = 0.438301 * safezoneW + safezoneX;
					y = 0.28371 * safezoneH + safezoneY;
					w = 0.123399 * safezoneW;
					h = 0.0282118 * safezoneH;
					SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";

					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};
				};
				/*
				class kmb_list: BTRscListBox
				{
					idc = 59004;
					text = "";
					x = 0.328123 * safezoneW + safezoneX;
					y = 0.321325 * safezoneH + safezoneY;
					w = 0.123399 * safezoneW;
					h = 0.28 * safezoneH;

					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};

					
					//onLBSelChanged = "_this spawn bt_kmenu_fnc_listChange";
				};
				*/
				class kmb_list2: BTRscListBox
				{
					idc = 59005;

					text = "";
					x = 0.438301 * safezoneW + safezoneX;
					y = 0.321325 * safezoneH + safezoneY;
					w = 0.123399 * safezoneW;
					h = 0.28 * safezoneH;

					colorBackground[] = {
						0,
						0,
						0,
						0.7
					};

				};

				class kmb_button: BTRscButton1
				{
					idc = 59006;
					text = "Повысить до Рядового";
					x = 0.438301 * safezoneW + safezoneX;
					y = 0.321325 * safezoneH + safezoneY + 0.3 * safezoneH;
					w = 0.123399 * safezoneW;
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

					action = "[] spawn bt_kmenu_fnc_kmbMenuButton";
				};
			};
		};
	};
};
