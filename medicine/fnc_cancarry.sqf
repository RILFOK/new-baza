private ["_target","_return"];
_target = _this select 0;
_return = false;
if ((_target getVariable "isUnconscious") && {!(_target getVariable "isCarryed") && !(_target getVariable "isDragged") && {!(player getVariable "isDrag") && (alive _target)}}) then
{
	_return = true;
};
_return;