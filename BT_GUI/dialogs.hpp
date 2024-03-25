//-------------------------------------------MAIN MENU------------------------------------------------------
class BT_main_menu
{
	idd = 9990;
	movingEnable = false;
	
	class controls
{
class Rsc999Picture_1200: Rsc999Picture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0.7)";
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.528 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class Rsc999Frame_1800: Rsc999Frame
{
	idc = 1800;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.386719 * safezoneW;
	h = 0.0055 * safezoneH;
	colorText[] = {1,0,0,1};
	colorBackground[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class BT_text_zvanie_name: Rsc999Text1
{
	idc = 1000;
	text = "" //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.170156 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class BT_text_uroven: Rsc999Text1
{
	idc = 1001;
	text = "Уровень доступа:"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0};
};
class Rsc999Text_1002: Rsc999Text1
{
	idc = 1002;
	text = "максимальный"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0,1,0,1};
	colorBackground[] = {1,1,1,0};
};
class BT_button_info: Rsc999Button
{
	idc = 1600;
	text = "Информация по острову"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.9};
	colorActive[] = {1,1,0,0.9};
	action = "closeDialog 0, [] spawn BT_fnc_info;";
};
class BT_button_green: Rsc999Button
{
	idc = 1601;
	text = "Досье BLACK SKULL"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.5 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.9};
	colorActive[] = {1,1,0,0.9};
	action = "closeDialog 0, [] spawn BT_fnc_green;";
};
class BT_button_ierarh: Rsc999Button
{
	idc = 1602;
	text = "Иерархия BLACK SKULL"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.9};
	colorActive[] = {1,1,0,0.9};
	action = "closeDialog 0, createDialog ""BT_ier""";
};
class BT_button_close: Rsc999Button
{
	idc = 1603;
	text = "Закрыть"; //--- ToDo: Localize;
	x = 0.556719 * safezoneW + safezoneX;
	y = 0.687 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.9};
	colorActive[] = {1,1,0,0.9};
	action = "closeDialog 0";
};
};
};
//----------------------------------------------------------------------------------------------------------------

//----------------------------------------------LIST GREEN------------------------------------------------
class BT_list_green
{
idd = 9992;
	movingEnable = false;
	
	class controls
	{
class Rsc999Picture_1200: Rsc999Picture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0.7)";
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.528 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class BT_spisok_green: Rsc999Listbox
{
	idc = 1555;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.407 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
	onMouseButtonClick = "[] spawn BT_green_info;";
};
class BT_delo_textscroll
		{
			access = 2; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = 4567; // Control identification (without it, the control won't be displayed)
			type = CT_CONTROLS_GROUP; // Type
			style = LB_TEXTURES; // Style
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = 0.448438 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.242031 * safezoneW;
			h = 0.385 * safezoneH;

			class Controls
			{
				class BT_delo: Rsc999StructuredText
			{
				idc = 1055;
				text = "Личное дело"; //--- ToDo: Localize;
				align = "left";
				valign = "top";
				x = 0.29 * safezoneW + safezoneX;
				y = 0.22 * safezoneH + safezoneY;
				w = 0.232031 * safezoneW;
				h = 0.9 * safezoneH;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
			};
			};
			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class VScrollBar
			{
				width = 0.021; // Unknown?
				height = 0; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color

				//autoScrollEnabled = 0; // 1 to enable automatic scrolling
				//autoScrollDelay = 1; // Time after autoscroll is initiated
				//autoScrollRewind = 1; // Repeat the autoscroll once it's finished
				//autoScrollSpeed = 1; // Autoscroll speed
			};
			class HScrollBar
			{
				width = 0; // Unknown?
				height = 0.028; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};

			//onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
			//onDestroy = "systemChat str ['onDestroy',_this]; false";
			//onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
			//onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
			//onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
			//onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
			//onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
			//onMouseMoving = "";
			//onMouseHolding = "";
		};
/*
class BT_delo: Rsc999Text1
{
	idc = 1055;
	text = "Личное дело"; //--- ToDo: Localize;
	align = "left";
	valign = "top";
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.232031 * safezoneW;
	h = 0.385 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};*/
class BT_rozisk: Rsc999Text1
{
	idc = 1066;
	text = ""; //--- ToDo: Localize;
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Frame_1800: Rsc999Frame
{
	idc = 1800;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.407 * safezoneH;
	colorText[] = {1,0,0,1};
	colorActive[] = {1,0,0,1};
};
class BT_text_spisok: Rsc999Text1
{
	idc = 1002;
	text = "Члены BLACK SKULL"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class BT_button_back: Rsc999Button
{
	idc = 1600;
	text = "Назад"; //--- ToDo: Localize;
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
	colorActive[] = {1,1,0,0.8};
	action = "closeDialog 9992, [] spawn BT_fnc_main_menu;";
};
};
};
//------------------------------------------------------------------------------------------------------

//------------------------------------------IERARH------------------------------------------------------
//------------------------------------------infoserv----------------------------------------------------
class BT_infoserv
{
idd = 9991;
	movingEnable = false;
	
	class controls
	{
class BT_infoserv_bg: Rsc999Picture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.528 * safezoneH;
};
class BT_infoserv_back: Rsc999Button
{
	idc = 1600;
	text = "Назад"; //--- ToDo: Localize;
	x = 0.597969 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.7};
	action = "closeDialog 0, [] spawn BT_fnc_main_menu;";
};
class BT_infoserv_frame: Rsc999Frame
{
	idc = 1800;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.418 * safezoneH;
	colorText[] = {1,0,0,1};
};
class BT_infoserv_textscroll
		{
			access = 2; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = 4567; // Control identification (without it, the control won't be displayed)
			type = CT_CONTROLS_GROUP; // Type
			style = LB_TEXTURES; // Style
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

			x = 0.324687 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.396 * safezoneH;

			class Controls
			{
				class BT_infoserv_text: Rsc999StructuredText
				{
					idc = 5454;
					text = ""; //--- ToDo: Localize;
					x = 0.29 * safezoneW + safezoneX;
					y = 0.23 * safezoneH + safezoneY;
					w = 0.350625 * safezoneW;
					h = 0.9 * safezoneH;
					colorText[] = {1,1,1,1};
					colorBackground[] = {0,0,0,0};
				};
			};
			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class VScrollBar
			{
				width = 0.021; // Unknown?
				height = 0; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color

				//autoScrollEnabled = 0; // 1 to enable automatic scrolling
				//autoScrollDelay = 1; // Time after autoscroll is initiated
				//autoScrollRewind = 1; // Repeat the autoscroll once it's finished
				//autoScrollSpeed = 1; // Autoscroll speed
			};
			class HScrollBar
			{
				width = 0; // Unknown?
				height = 0.028; // Unknown?
				scrollSpeed = 0.01; // Unknown?

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};

			//onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
			//onDestroy = "systemChat str ['onDestroy',_this]; false";
			//onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
			//onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
			//onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
			//onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
			//onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
			//onMouseMoving = "";
			//onMouseHolding = "";
		};
		/*
class BT_infoserv_text: Rsc999StructuredText
{
	idc = 5454;
	text = ""; //--- ToDo: Localize;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.350625 * safezoneW;
	h = 0.396 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};*/
};
};
//------------------------------------------------------------------------------------------------------

//--------------------------------------------------IER-------------------------------------------------
class BT_ier
{
idd = 9993;
	movingEnable = false;
	
	class controls
	{
class BT_ier_bg: Rsc999Picture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(0,0,0,0.8)";
	x = 0.298906 * safezoneW + safezoneX;
	y = 0.236 * safezoneH + safezoneY;
	w = 0.402187 * safezoneW;
	h = 0.528 * safezoneH;
};
class BT_ier_back: Rsc999Button
{
	idc = 1600;
	text = "Назад"; //--- ToDo: Localize;
	x = 0.592812 * safezoneW + safezoneX;
	y = 0.709 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.033 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0.8};
	colorActive[] = {1,1,0,1};
	action = "closeDialog 9992, [] spawn BT_fnc_main_menu;";
};
class BT_ier_foto_1: Rsc999Picture
{
	idc = 1201;
	text = "pics\vopros.jpg";
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class BT_ier_text_1: Rsc999Text
{
	idc = 1000;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class BT_ier_frame_1: Rsc999Frame
{
	idc = 1800;
	x = 0.402031 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.0055 * safezoneH;
	colorText[] = {1,0,0,1};
};
class Rsc999Picture_1202: Rsc999Picture
{
	idc = 1202;
	text = "pics\vopros.jpg";
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1203: Rsc999Picture
{
	idc = 1203;
	text = "pics\vopros.jpg";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Text_1001: Rsc999Text
{
	idc = 1001;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1002: Rsc999Text
{
	idc = 1002;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.515469 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Frame_1801: Rsc999Frame
{
	idc = 1801;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.360937 * safezoneW;
	h = 0.0055 * safezoneH;
	colorText[] = {1,0,0,1};
};
class Rsc999Picture_1204: Rsc999Picture
{
	idc = 1204;
	text = "pics\vopros.jpg";
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1205: Rsc999Picture
{
	idc = 1205;
	text = "pics\vopros.jpg";
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1206: Rsc999Picture
{
	idc = 1206;
	text = "pics\vopros.jpg";
	x = 0.551562 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1207: Rsc999Picture
{
	idc = 1207;
	text = "pics\vopros.jpg";
	x = 0.335 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1208: Rsc999Picture
{
	idc = 1208;
	text = "pics\vopros.jpg";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1209: Rsc999Picture
{
	idc = 1209;
	text = "pics\vopros.jpg";
	x = 0.335 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1210: Rsc999Picture
{
	idc = 1210;
	text = "pics\vopros.jpg";
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1211: Rsc999Picture
{
	idc = 1211;
	text = "pics\vopros.jpg";
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1212: Rsc999Picture
{
	idc = 1212;
	text = "pics\vopros.jpg";
	x = 0.551562 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Picture_1213: Rsc999Picture
{
	idc = 1213;
	text = "pics\vopros.jpg";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.066 * safezoneH;
};
class Rsc999Text_1003: Rsc999Text
{
	idc = 1003;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
    align = "center";
};
class Rsc999Text_1004: Rsc999Text
{
	idc = 1004;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1005: Rsc999Text
{
	idc = 1005;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1006: Rsc999Text
{
	idc = 1006;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1007: Rsc999Text
{
	idc = 1007;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.603125 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1008: Rsc999Text
{
	idc = 1008;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.319531 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1009: Rsc999Text
{
	idc = 1009;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.391719 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1010: Rsc999Text
{
	idc = 1010;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1011: Rsc999Text
{
	idc = 1011;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class Rsc999Text_1012: Rsc999Text
{
	idc = 1012;
	text = "Неизвестен"; //--- ToDo: Localize;
	x = 0.603125 * safezoneW + safezoneX;
	y = 0.665 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.011 * safezoneH;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
};
class BT_ier_BS: Rsc999Text
{
	idc = 1013;
	text = "BLACK SKULL"; //--- ToDo: Localize;
	x = 0.304062 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.159844 * safezoneW;
	h = 0.077 * safezoneH;
	colorText[] = {1,0,0,1};
	colorBackground[] = {0,0,0,0};

};
};
};
//------------------------------------------------------------------------------------------------