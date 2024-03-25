if (
    (!isNull (findDisplay 51000)) ||
    (!isNull (findDisplay 52000)) ||
    (!isNull (findDisplay 53000)) ||
    (!isNull (findDisplay 54000)) ||
    (!isNull (findDisplay 55000)) ||
    (!isNull (findDisplay 57000)) ||
    (!isNull (findDisplay 2900))
) exitWith {};

player setVariable ["circleMenuOpen",true];
createDialog "bt_circle_menu";
player setVariable ["keyUp","NULL"];
player setVariable ["BERUSHI",1];
player setVariable ["VIEW",1];
player setVariable ["WFROMBACK",1];


player setVariable ["KMBMENU",player getVariable ["KMB",0]];

waitUntil {
    !isNull (findDisplay 56000)
};

private _display = findDisplay 56000;


/*private _kmb_img = _display displayCtrl 56111;
private _kmb_button = _display displayCtrl 56112;
private _isKMB = player getVariable ["KMB",0];
if (_isKMB == 0) then {
    _kmb_img ctrlShow false;
    _kmb_button ctrlShow false;
    _kmb_button ctrlEnable false;
}; 
*/

private _ctrl = controlNull;
private _menuAllButtons = [
    //["Беруши","BT_GUI\circleMenu\img\1_w.paa","BT_GUI\circleMenu\img\1_g.paa","BT_GUI\circleMenu\img\1_r.paa","BERUSHI"],
    ["Дальность видимости","BT_GUI\circleMenu\img\2_w.paa","BT_GUI\circleMenu\img\2_g.paa","","VIEW"],
    //["Оружие за спину","BT_GUI\circleMenu\img\3_w.paa","BT_GUI\circleMenu\img\3_g.paa","","WFROMBACK"],
    ["Кик-панель","BT_GUI\circleMenu\img\4_w.paa","BT_GUI\circleMenu\img\4_g.paa","","KICK"],
    ["Доступ за зеленых","BT_GUI\circleMenu\img\5_w.paa","BT_GUI\circleMenu\img\5_g.paa","","GREEN_A"],
    ["Авиа допуски","BT_GUI\circleMenu\img\6_w.paa","BT_GUI\circleMenu\img\6_g.paa","","AVIA"],
    ["Допуски на технику","BT_GUI\circleMenu\img\7_w.paa","BT_GUI\circleMenu\img\7_g.paa","","TANK"],
    ["Управление званиями","BT_GUI\circleMenu\img\8_w.paa","BT_GUI\circleMenu\img\8_g.paa","","LEVEL_A"],
    ["Админ-панель","BT_GUI\circleMenu\img\9_w.paa","BT_GUI\circleMenu\img\9_g.paa","","ADMIN"],
    ["Список КМБ-инструкторов","BT_GUI\circleMenu\img\10_w.paa","BT_GUI\circleMenu\img\10_g.paa","","KMBMENU"]

];

private _menuButtons = _menuAllButtons select {(player getVariable [(_x # 4),0]) > 0};

private _circle_angle = 360 / (count _menuButtons);
private _circle_R = safezoneH / 5;
private _circle_center_X = safezoneX + (safezoneW / 2);
private _circle_center_Y = safezoneY + (safezoneH / 2);
private _circle_img_size = _circle_R / 2;

private _icons = [];

for "_i" from 0 to ((count _menuButtons) - 1) step 1 do {
    _ctrl = _display ctrlCreate ["BTRscPicture",56001 + _i];
    _ctrl ctrlSetPosition [
        _circle_R * (cos(_circle_angle * _i - 90)) + _circle_center_X - (_circle_img_size / 2),
        _circle_R * (sin(_circle_angle * _i - 90)) + _circle_center_Y - (_circle_img_size / 2),
        _circle_img_size,
        _circle_img_size
    ];
    _ctrl ctrlSetText (_menuButtons # _i # 1);
    
    _ctrl ctrlCommit 0;

    _ctrl1 = _display ctrlCreate ["BTRscButton",-1];
    _ctrl1 setVariable ["BUTTONACTIONS",[_i,[_menuButtons # _i # 1,_menuButtons # _i # 2,_menuButtons # _i # 3],_menuButtons # _i # 4]];
    _ctrl1 ctrlSetPosition [
        _circle_R * (cos(_circle_angle * _i - 90)) + _circle_center_X - (_circle_img_size / 2),
        _circle_R * (sin(_circle_angle * _i - 90)) + _circle_center_Y - (_circle_img_size / 2),
        _circle_img_size,
        _circle_img_size
    ];
    _ctrl1 ctrlSetTooltip (_menuButtons # _i # 0);
    _ctrl1 ctrlCommit 0;
    _ctrl1 ctrlAddEventHandler ["MouseEnter",{
        private _ctrlButton = _this # 0;
        private _name = (_ctrlButton getVariable ["BUTTONACTIONS",[0,["","",""],""]]) # 2;
        private _value = (_ctrlButton getVariable ["BUTTONACTIONS",[0,["","",""],""]]) # 0;
        private _pic = (_ctrlButton getVariable ["BUTTONACTIONS",[0,["","",""],""]]) # 1 # 1;
        player setVariable ["keyUp",_name];
        private _control = (findDisplay 56000) displayCtrl (56001 + _value); 
        _control ctrlSetText _pic;
    }];

    _ctrl1 ctrlAddEventHandler ["MouseExit",{
        player setVariable ["keyUp","NULL"];
        private _ctrlButton = _this # 0;
        private _value = (_ctrlButton getVariable ["BUTTONACTIONS",[0,["","",""]]]) # 0;
        private _pic = (_ctrlButton getVariable ["BUTTONACTIONS",[0,["","",""]]]) # 1 # 0;
        private _control = (findDisplay 56000) displayCtrl (56001 + _value); 
        _control ctrlSetText _pic;
    }];

    _icons pushBack [_ctrl,_ctrl1];
};

_circle_img_size = _circle_R / 1.5;
{
    _i = _forEachIndex;
    _ctrl = _x # 0;
    _ctrl1 = _x # 1;

    _ctrl ctrlSetPosition [
        _circle_R * (cos(_circle_angle * _i - 90)) + _circle_center_X - (_circle_img_size / 2),
        _circle_R * (sin(_circle_angle * _i - 90)) + _circle_center_Y - (_circle_img_size / 2),
        _circle_img_size,
        _circle_img_size
    ];
    _ctrl1 ctrlSetPosition [
        _circle_R * (cos(_circle_angle * _i - 90)) + _circle_center_X - (_circle_img_size / 2),
        _circle_R * (sin(_circle_angle * _i - 90)) + _circle_center_Y - (_circle_img_size / 2),
        _circle_img_size,
        _circle_img_size
    ];

    _ctrl ctrlCommit 0.1;
    _ctrl1 ctrlCommit 0.1;

    //uiSleep 0.02;
} forEach _icons;

if(side player == east) then {

    private _levelCtrl = _display displayCtrl 56101;
    private _percentCtrl = _display displayCtrl 56102;
    private _avia_t_h_ctrl = _display displayCtrl 56103;
    private _avia_t_p_ctrl = _display displayCtrl 56104;
    private _avia_b_h_ctrl = _display displayCtrl 56105;
    private _avia_b_p_ctrl = _display displayCtrl 56106;
    private _avia_b_storm_ctrl = _display displayCtrl 561066;
    private _tank_1_Ctrl = _display displayCtrl 56107;
    private _tank_2_Ctrl = _display displayCtrl 56108;
    private _tank_3_Ctrl = _display displayCtrl 56109;
    private _tank_4_Ctrl = _display displayCtrl 56114;
    private _greenCtrl = _display displayCtrl 56110;
    private _img = _display displayCtrl 56113;
    private _zeusname = _display displayCtrl 56116;
    private _curatorname = _display displayCtrl 56117;
    private _triggercount = _display displayCtrl 56118;

    private _level = player getVariable ["LEVEL",1];
    private _exp = player getVariable ["EXP",0];
    private _avia_t_h = player getVariable ["AVIA_T_H",0];
    private _avia_t_p = player getVariable ["AVIA_T_P",0];
    private _avia_b_h = player getVariable ["AVIA_B_H",0];
    private _avia_b_p = player getVariable ["AVIA_B_P",0];
    private _avia_b_storm = player getVariable ["AVIA_B_STORM",0];
    private _tank_1 = player getVariable ["TANK_1",0];
    private _tank_2 = player getVariable ["TANK_2",0];
    private _tank_3 = player getVariable ["TANK_3",0];
    private _tank_4 = player getVariable ["TANK_4",0];
    private _green = player getVariable ["GREEN",0];
    private _zvanie = _level call bt_fnc_getZvanie;
    private _expNeed = [_level,_exp] call bt_fnc_getExpNeed;
    private _nextExpNeed = (_expNeed # 1) - (_expNeed # 0);
    private _percent = _nextExpNeed / 100;
    private _expNow = (_expNeed # 1) - _exp;
    private _percents = floor(100 - (_expNow / _percent));





    _levelCtrl ctrlSetText format["Звание - %1",_zvanie];
 //   uiSleep 0.02;
    _percentCtrl ctrlSetText format["Прогресс - %1%2",_percents,"%"];
   // uiSleep 0.02;
    _avia_t_h_ctrl ctrlSetText format["Допуск трансп. вертолеты - %1",_avia_t_h];
   // uiSleep 0.02;
    _avia_t_p_ctrl ctrlSetText format["Допуск трансп. самолеты - %1",_avia_t_p];
  //  uiSleep 0.02;
    _avia_b_h_ctrl ctrlSetText format["Допуск боевые вертолеты - %1",_avia_b_h];
  //  uiSleep 0.02;
    _avia_b_p_ctrl ctrlSetText format["Допуск боевые самолеты - %1",_avia_b_p];
  //  uiSleep 0.02;
    _avia_b_storm_ctrl ctrlSetText format["Допуск Шторм - %1",_avia_b_storm];
  //  uiSleep 0.02;
    _tank_1_Ctrl ctrlSetText format["Танковый допуск 1 - %1",_tank_1];
   // uiSleep 0.02;
    _tank_2_Ctrl ctrlSetText format["Танковый допуск 2 - %1",_tank_2];
   // uiSleep 0.02;
    _tank_3_Ctrl ctrlSetText format["Танковый допуск 3 - %1",_tank_3];
   // uiSleep 0.02;
    _tank_4_Ctrl ctrlSetText format["Танковый допуск 4 - %1",_tank_4];
  //  uiSleep 0.02;
    _greenCtrl ctrlSetText format["Доступ за зеленых - %1",_green];
 //   uiSleep 0.02;
    _img ctrlSetText format["BT_GUI\levelMenu\img\%1.paa",_level];

    _zeusname ctrlSetText format["Зевс: %1", missionNamespace getVariable ["_Active_Zeus1",""]];
    _curatorname ctrlSetText format["Доп. Зевс: %1", name ((allplayers select {!isNull (_x getVariable ["Achilles_var_promoZeusModule",objNull])}) # 0)];
    _triggercount ctrlSetText format["Триггер: %1", missionNamespace getVariable ["_number_hn_trigger_monitoring","-"]];


};


