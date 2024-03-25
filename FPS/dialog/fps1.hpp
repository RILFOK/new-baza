class FPS_RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.14,1,0,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	//font = "PuristaMedium";
	font = "RobotoCondensed";
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	linespacing = 1;
};

class DisplayFps 
{
    idd=-1;
	movingEnable=0;
	duration = 1e+011;
	fadein = 0;
	fadeout = 0;
	name = "DisplayFps";
    onLoad = "uiNamespace setVariable ['DisplayFps', param [0]]";
	onUnLoad = "uiNamespace setVariable ['DisplayFps', nil]";
	class controls 
	{/*
        class ServerFps: FPS_RscText
        {
	      idc = -1;
	      text = "$STR_CONF_FPS1"; //--- ToDo: Localize;
	      x = -0.0020319 * safezoneW + safezoneX;
	      y = 0.924946 * safezoneH + safezoneY;
	      w = 0.0654824 * safezoneW;
	      h = 0.0339957 * safezoneH;
        };
        class numberFPSserver: FPS_RscText
        {
	      idc = 50;
          text = "";
	      x = 0.0707264 * safezoneW + safezoneX;
	      y = 0.924946 * safezoneH + safezoneY;
	      w = 0.0218275 * safezoneW;
	      h = 0.0339957 * safezoneH;
        };	
		*/
        class ClientFPS: FPS_RscText
        {
	      idc = -1;
	      text = "$STR_CONF_FPS2"; //--- ToDo: Localize;
	      x = -0.0020319 * safezoneW + safezoneX;
	      y = 0.958941 * safezoneH + safezoneY;
	      w = 0.0654824 * safezoneW;
	      h = 0.0339957 * safezoneH;
        };
        class numberFPClient: FPS_RscText
        {
	     idc = 51;
          text = "";
	      x = 0.0707264 * safezoneW + safezoneX;
	      y = 0.958941 * safezoneH + safezoneY;
	      w = 0.0218275 * safezoneW;
	      h = 0.0339957 * safezoneH;
        };
	};			
};
	
