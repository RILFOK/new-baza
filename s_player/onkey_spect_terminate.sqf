private['_handled'];
_handled = false;
switch (_this select 1) do
{
	case 10:
	{
		["Terminate"] call BIS_fnc_EGSpectator;
		_handled = true;
	};
};
_handled;