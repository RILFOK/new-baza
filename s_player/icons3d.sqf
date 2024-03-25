private _icon_hn_3d = addMissionEventHandler ["Draw3D", {
	_cursorTarget = cursortarget;
	_vehicle_target = vehicle _cursorTarget;
	_player = player;
	_playerside = Playerside;
	
	//Оптимизирвоать
	{
	_distance_to_player2 = 1.1 - (_player distance _x)/30;
	if (_distance_to_player2 <= 0) then { _distance_to_player2 = 0;};

	drawIcon3D [
		'a3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa',
		[0.57,0.68,0.32,0.8],
		_x modelToWorld [0,0,2],
		_distance_to_player2,
		_distance_to_player2,
		0,
		"",
		2,
		0.04,
		'EtelkaMonospaceProBold',
		"center",
		true,
		0,
		1
	];}forEach ((allPlayers - [_player]) select {(getPlayerChannel _x == 5) && (side _x == _playerside)});

	if ((_cursorTarget isKindOf "Man") && {((vehicle _player) distance _cursorTarget < 50) && {(side (group _cursorTarget) == _playerside)}}) then {

		_clr = [0,1,0,1];
		_pos = _vehicle_target modelToWorld (_vehicle_target selectionPosition "camera");
		if (_cursorTarget getVariable "isUnconscious") then
		{
			if (_cursorTarget getVariable "isBleeding") then
			{
				_clr = [1,1,0,1];
			} else
			{
				_clr = [1,0.4,0,1];
			};
		};
					
		if (_vehicle_target == _cursorTarget && {side _cursorTarget == east}) then 
		{
			_level = _cursorTarget getVariable ["LEVEL",1];
			_bt_zvanie = _level call bt_fnc_getZvanie;
			_vt = roleDescription _cursorTarget ;
			drawIcon3D
			[
				'',
				_clr,
				_pos,
				0,
				0,
				getdir _player,
				format ["%1 %2",_bt_zvanie,name _cursorTarget],
				2,
				0.04,
				'EtelkaMonospaceProBold'
			];
		} else
		{
			_pos = position (_vehicle_target);
			_pos set [2, (((_vehicle_target) modelToWorld [0,0,0]) select 2) + 1];
			_tx = format ["%1",(name _vehicle_target)];
			_clr = [0,1,0,1];
			if ((count crew (_vehicle_target)) > 1) then 
			{
				_tx = format ["%1 + [%2]",(name _vehicle_target),(count crew (_vehicle_target))-1];
			};
			drawIcon3D
			[
				'',
				_clr,
				_pos,
				0,
				0,
				getdir _player,
				_tx,
				2,
				0.04,
				'EtelkaMonospaceProBold'
			];
		};
	};
}];



//====================================================
//====================================================
player setvariable ["_icon_hn_3d",_icon_hn_3d];
//====================================================
//====================================================