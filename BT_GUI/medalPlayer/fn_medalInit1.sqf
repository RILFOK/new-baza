params ["_player","_uid"];
private ["_display","_ctrlList","_givebutton","_takebutton","_data","_medals","_index","_medals_W","_medals_H","_medals_otstup","_medals_width_control","_medals_height_control"];

createDialog "bt_medal_player";

waitUntil {!(isNull (findDisplay 77000))};

player setVariable ["medalMenuOpen",true];

_display = findDisplay 77000;
_ctrlList = _display displayCtrl 77004;

_medals = missionNamespace getVariable ["MEDALS",[]];
_data = _player getvariable ["_MEDALS",[_uid,name _player,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];

_display setVariable ["_data",_data];

(_display displayCtrl 78009) ctrlSetText (_data # 1);

//_medals_X = ((safezoneX + (safezoneW / 3.5)) - (safezoneH / 4))
//_medals_Y = ((safezoneY + (safezoneH / 3.5)) - (safezoneH / 4))


if ((player getVariable ["LEVEL_A",0]) > 0) then {

	_medals_W =(safezoneH / 1);
	_medals_H = (safezoneH / 1.1);
	_medals_otstup =(_medals_H / 60);
	_medals_width_control = ((_medals_W / 3) - (_medals_otstup * 4));
	_medals_height_control = (_medals_H / 20);
	

	//Кнопка выдать медаль

	_givebutton = _display ctrlCreate ["BTRscButton1",77021,_display displayctrl 77001];
	
	_givebutton ctrlSetPosition [
		_medals_otstup + _medals_height_control * 3,
		_medals_otstup * 10 + _medals_height_control * 15,
		_medals_width_control / 2,
		_medals_height_control
	];

	//_givebutton ctrlSetPosition [0.027,1.5,0.24,0.082];
	//_givebutton ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
	//_givebutton ctrlSetTextColor [0.5, 0.5, 0.5, 1];

	
	_givebutton ctrlSetText "Выдать медаль";


	_givebutton buttonSetAction "[] call bt_medalPlayer_fnc_giveButton";

	_givebutton ctrlCommit 0;


	//Кнопка забрать медаль

	_takebutton = _display ctrlCreate ["BTRscButton1",77022,_display displayctrl 77001];
	
	_takebutton ctrlSetPosition [
		_medals_otstup + _medals_height_control * 6,
		_medals_otstup * 10 + _medals_height_control * 15,
		_medals_width_control / 2,
		_medals_height_control
	];

	//_givebutton ctrlSetPosition [0.027,1.5,0.24,0.082];
	//_givebutton ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1];
	//_givebutton ctrlSetTextColor [0.5, 0.5, 0.5, 1];

	
	_takebutton ctrlSetText "Забрать медаль";


	_takebutton buttonSetAction "[] call bt_medalPlayer_fnc_takeButton";

	_takebutton ctrlCommit 0;

};


for "_i" from 2 to ((count _data) - 1) do {
	if ((_data # _i) < 1) then {
		_index = _medals # (_i-2) # 1;
		(_display displayCtrl _index) ctrlSetTextColor [0.4, 0.4, 0.4, 0.6];
	};
};