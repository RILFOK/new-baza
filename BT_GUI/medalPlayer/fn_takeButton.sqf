
private ["_display","_index","_data","_medal_name","_value","_valueData","_oldvalue"];


_display = findDisplay 77000;

_index = _display getVariable ["_selected_medal",""];

if (_index isEqualTo "") exitwith{hint "Выберите медаль !";};

_data = _display getVariable ["_data",[]];
_medals = missionNamespace getVariable ["MEDALS",[]];

private _uid = _data # 0;
private _player = _uid call BIS_fnc_getUnitByUid;
private _uidgiver = getPlayerUID player;
private _namegiver = name player;
private _nametaker = name _player;

_valueData = _medals # _index # 2;
_oldvalue = _data # (_index + 2);
_value = _oldvalue - 1;

if (_oldvalue < 1) exitwith {hint "У игрока нет этой медали"};

_data set [_index+2,_value];

_player setVariable ["_MEDALS",_data,true];

(_display displayCtrl 78094) ctrlSetText (str (_value));

[_uid,_valueData,_value] remoteExecCall ["bt_db_fnc_changeMedalsP",2];

//_medal_name = _medals # _index # 3;

[_namegiver,_uidgiver,_nametaker,_uid,"medaltake",_valueData] remoteExecCall ["bt_db_fnc_insertDopusklog",2];