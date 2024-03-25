closeDialog 58000;

private _display = findDisplay 58000;
private _ctrlList = _display displayCtrl 58004;

private _index = lbCurSel _ctrlList;
private _anim = _ctrlList lbData _index;

private _player = player;
[_player,_anim] remoteExec ["switchMove",-2];
player playmoveNow _anim;
//player switchmove _anim;
