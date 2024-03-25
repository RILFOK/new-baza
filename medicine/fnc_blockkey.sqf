private["_return"];
_return = false;
_dikCode = (_this select 1);
if ((_dikCode != 61) and (!(_dikCode == 1)) and (_dikCode != 58) and (_dikCode != 53) and (_dikCode != 51) and (_dikCode != 21) /*and (!(_dikCode in (ActionKeys "PersonView")))*/ and (!(_dikCode in (ActionKeys "ShowMap"))) and (!(_dikCode in (ActionKeys "HideMap")))) then
{
	_return = true;
};
_return;

