_green = _this select 0;
_return = false;
if (_green isKindOf "Man" && (alive _green) && (_green distance player < 2) && (side _green != playerSide) && (side _green != east) && (side (group _green) != playerSide)) then 
{
	_return = true;
};
_return;