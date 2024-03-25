#define PROGBAR_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 2 / 1.6))
#define PROGBAR_Y safezoneY
#define PROGBAR_W (safezoneH / 1.6)
#define PROGBAR_H (safezoneH / 8)
#define PROGBAR_OTSTUP (PROGBAR_H / 5)
#define PROGBAR_W_CONTROL (PROGBAR_W / 4)
#define PROGBAR_H_CONTROL (PROGBAR_H / 3)
#define PROGBAR_W_PROGRESS ((PROGBAR_W * 4) + (PROGBAR_OTSTUP * 3))

// - (PROGBAR_OTSTUP * 5))
// - (PROGBAR_OTSTUP * 4))

class bt_progressBar
{
	idd = 55000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['progressBar',_this select 0]";
	
	class Controls
    {
		class progbar_group: BTRscControlsGroup
		{
			idc = 11002;
			x = PROGBAR_X;
			y = PROGBAR_Y;
			w = PROGBAR_W;
			h = PROGBAR_H;

			class Controls
			{
				class progbar_name: BTRscText
				{
					idc = 11003;
					text = "Имя: ";
					x = PROGBAR_OTSTUP;
					y = PROGBAR_OTSTUP;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class progbar_zvanie: BTRscText
				{
					idc = 11004;
					text = "Звание: ";
					x = (PROGBAR_OTSTUP * 3) + (PROGBAR_W_CONTROL * 2);
					y = PROGBAR_OTSTUP;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class progbar_avia_t: BTRscText
				{
					idc = 11005;
					text = "Авиа Т. - ";
					x = PROGBAR_OTSTUP;
					y = (PROGBAR_OTSTUP * 2) + PROGBAR_H_CONTROL;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class progbar_avia_b: BTRscText
				{
					idc = 11006;
					text = "Авиа Б. - ";
					x = (PROGBAR_OTSTUP * 2) + PROGBAR_W_CONTROL;
					y = (PROGBAR_OTSTUP * 2) + PROGBAR_H_CONTROL;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class progbar_tank_l: BTRscText
				{
					idc = 11007;
					text = "Танк Л. - ";
					x = (PROGBAR_OTSTUP * 3) + (PROGBAR_W_CONTROL * 2);
					y = (PROGBAR_OTSTUP * 2) + PROGBAR_H_CONTROL;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class progbar_tank_t: BTRscText
				{
					idc = 11008;
					text = "Танк Т. - ";
					x = (PROGBAR_OTSTUP * 4) + (PROGBAR_W_CONTROL * 3);
					y = (PROGBAR_OTSTUP * 2) + PROGBAR_H_CONTROL;
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_H_CONTROL;
					colorText[] = {1,1,1,1};
					colorBackground[] = {1,1,1,0};
				};
				class Progress: BTRscProgress
				{
					idc = 11009;
					x = PROGBAR_OTSTUP;
					y = (PROGBAR_OTSTUP * 3) + (PROGBAR_H_CONTROL * 2);
					w = PROGBAR_W_CONTROL;
					h = PROGBAR_W_PROGRESS;
				};
			};
		};
	};
};