
//неактуально не используется Haron

_target = _this select 0;
_return = false;
if ((_target isKindOf "LandVehicle" || _target isKindOf "Air") && _target distance player < 6 && {(_x getVariable "IsUnconscious") && (alive _x)}count crew _target > 0) then 
{
	_return = true;
};
_return;