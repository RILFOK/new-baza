#define circle_X ((safezoneX + (safezoneW / 2)) - (safezoneH / 4))
#define circle_Y ((safezoneY + (safezoneH / 2)) - (safezoneH / 4))
#define circle_W (safezoneH / 2)
#define circle_H (safezoneH / 2)

#define circle_center_X (safezoneX + (safezoneW / 2))
#define circle_center_Y (safezoneY + (safezoneH / 2))
#define circle_R (safezoneH / 5)
#define circle_angle 40

#define circle_img_size (circle_R / 3)

#define circle_X1 (circle_R * (cos(circle_angle * 0 - 90)) + circle_center_X)
#define circle_Y1 (circle_R * (sin(circle_angle * 0 - 90)) + circle_center_Y)

#define circle_X2 (circle_R * (cos(circle_angle * 1 - 90)) + circle_center_X)
#define circle_Y2 (circle_R * (sin(circle_angle * 1 - 90)) + circle_center_Y)

#define circle_X3 (circle_R * (cos(circle_angle * 2 - 90)) + circle_center_X)
#define circle_Y3 (circle_R * (sin(circle_angle * 2 - 90)) + circle_center_Y)

#define circle_X4 (circle_R * (cos(circle_angle * 3 - 90)) + circle_center_X)
#define circle_Y4 (circle_R * (sin(circle_angle * 3 - 90)) + circle_center_Y)

#define circle_X5 (circle_R * (cos(circle_angle * 4 - 90)) + circle_center_X)
#define circle_Y5 (circle_R * (sin(circle_angle * 4 - 90)) + circle_center_Y)

#define circle_X6 (circle_R * (cos(circle_angle * 5 - 90)) + circle_center_X)
#define circle_Y6 (circle_R * (sin(circle_angle * 5 - 90)) + circle_center_Y)

#define circle_X7 (circle_R * (cos(circle_angle * 6 - 90)) + circle_center_X)
#define circle_Y7 (circle_R * (sin(circle_angle * 6 - 90)) + circle_center_Y)

#define circle_X8 (circle_R * (cos(circle_angle * 7 - 90)) + circle_center_X)
#define circle_Y8 (circle_R * (sin(circle_angle * 7 - 90)) + circle_center_Y)

#define circle_X9 (circle_R * (cos(circle_angle * 8 - 90)) + circle_center_X)
#define circle_Y9 (circle_R * (sin(circle_angle * 8 - 90)) + circle_center_Y)

class bt_circle_menu
{
	idd = 56000;
	duration = 1e+10; 
    fadeIn = 0;
    fadeOut = 0;
	movingEnable = false;
	
	class Controls
    {
		class level_bg: BTRscPicture
		{
			idc = 56120;
			text = "#(argb,8,8,3)color(0,0,0,0.7)";
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
		};
		class circle_level: BTRscText
		{
			idc = 56101;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.1);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_percent: BTRscText
		{
			idc = 56102;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.15);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_avia_t_h: BTRscText
		{
			idc = 56103;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.2);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_avia_t_p: BTRscText
		{
			idc = 56104;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.25);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_avia_b_h: BTRscText
		{
			idc = 56105;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.3);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_avia_b_p: BTRscText
		{
			idc = 56106;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.35);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_avia_b_storm: BTRscText
		{
			idc = 561066;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.4);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_tank_1: BTRscText
		{
			idc = 56107;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.45);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_tank_2: BTRscText
		{
			idc = 56108;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.5);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_tank_3: BTRscText
		{
			idc = 56109;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.55);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_tank_4: BTRscText
		{
			idc = 56114;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.6);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};
		class circle_green: BTRscText
		{
			idc = 56110;
			text = "";
			x = safezoneX + (safezoneW * 0.05);
			y = safezoneY + (safezoneH * 0.65);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.35)";
		};

		class circle_Zeusname: BTRscText
		{
			idc = 56116;
			text = "";
			x = 0.795275 * safezoneW + safezoneX;
			y = safezoneY + (safezoneH * 0.1);
			w = 0.13662 * safezoneW;
			h = 0.0188079 * safezoneH;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};

		
		class circle_curatorname: BTRscText
		{
			idc = 56117;
			text = "";
			x = 0.795275 * safezoneW + safezoneX;
			y = safezoneY + (safezoneH * 0.15);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};

		class circle_triggercount: BTRscText
		{
			idc = 56118;
			text = "";
			x = 0.795275 * safezoneW + safezoneX;
			y = safezoneY + (safezoneH * 0.2);
			w = safezoneW * 0.4;
			h = safezoneH * 0.05;
			SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};

		/*
		class kmb_img: BTRscPicture
		{
			idc = 56111;
			text = "BT_GUI\circleMenu\img\10_w.paa";
			x = safezoneX + (safezoneW / 2) - (circle_img_size / 2);
			y = safezoneY + safezoneH - (circle_img_size * 2);
			w = circle_img_size;
			h = circle_img_size;
		};
		
		class kmb_button: BTRscButton1
		{
			idc = 56112;
			text = "";
			x = safezoneX + (safezoneW / 2) - (circle_img_size / 2);
			y = safezoneY + safezoneH - (circle_img_size * 2);
			w = circle_img_size;
			h = circle_img_size;
			onMouseEnter = "player setVariable [""keyUp"",""KMB""];private _control = (findDisplay 56000) displayCtrl 56111; _control ctrlSetText ""BT_GUI\circleMenu\img\10_g.paa"";"
			onMouseExit = "player setVariable [""keyUp"",""NULL""];private _control = (findDisplay 56000) displayCtrl 56111; _control ctrlSetText ""BT_GUI\circleMenu\img\10_w.paa"";"
		};*/
		class level_pogon_img: BTRscPicture
		{
			idc = 56113;
			text = "";
			x = safezoneX + safezoneW - (circle_img_size * 2);
			y = safezoneY + (safezoneH / 2) - (circle_img_size * 3);
			w = circle_img_size * 2;
			h = circle_img_size * 6;
		};
		
		class myWebpageButton : BTRscButton1
		{	
			idc = 56114;
			
			text = "Открыть дискорд";
			url = "https://discord.com/invite/uTqDrsR";
			
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
			x = 0.795275 * safezoneW + safezoneX;
			y = 0.932581 * safezoneH + safezoneY;
			w = 0.180691 * safezoneW;
			h = 0.0376157 * safezoneH;
			colorBackground[] = {
				0.2,
				0.2,
				0.2,
				0.5
			};

			colorBackgroundActive[] = {
				0.8,
				0.8,
				0.8,
				0.6
			};

			
			colorFocused[] =  {
				0.3,
				0.3,
				0.3,
				0.55
			};

		};
				
	};
};
