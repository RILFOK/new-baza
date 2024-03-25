params ["_idc"];
private ["_display","_ctrl1","_ctrl2","_ctrl3","_ctrl4","_medals","_index","_name_medal","_data"];

_display = findDisplay 77000;
_ctrl1 = _display displayCtrl 77092;
_ctrl2 = _display displayCtrl 77401;
//_ctrl3 = _display displayCtrl 77402;
_ctrl4 = _display displayCtrl 78094;

_ctrl1 ctrlSetText (ctrlText (_idc-100));

_medals = missionNamespace getVariable ["MEDALS",[]];

_index = (_medals findIf {(_x # 1) == (_idc-100)});
_name_medal = _medals # _index # 2;

_ctrl2 ctrlSetText (_medals # _index # 3);

_data = _display getVariable ["_data",[]];
_ctrl4 ctrlSetText (str (_data # (_index + 2)));

_display setVariable ["_selected_medal",_index];
