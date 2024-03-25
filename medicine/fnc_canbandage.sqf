_target = _this select 0;
_return = false;
if ( (_target distance player < 2) && {(_target getVariable "isUnconscious") && {_target getVariable "isBleeding" && {!(_target getVariable "isDragged") && !(_target getVariable "isCarryed") && (alive _target)}}}) then 
{
	if (((items player) find "FirstAidKit" != -1) || ((player call fnc_isMedic) && ((items player) find "Medikit" != -1))) then
	{
		_return = true;
	};
};
_return;