disableSerialization;

createDialog "BT_ierarh";
waitUntil {!isNull (findDisplay 9993);};
/*
_ctrl = (findDisplay 9992) displayCtrl 1555;
{
	_ctrl lbAdd _x;
} forEach _spisok;

BT_green_info =
{
disableSerialization;
_ctrl2 = (findDisplay 9992) displayCtrl 1066;
_id = lbCurSel 1555;
//_class = lbData [7, _id];
_roz = "В розыске";
_lik = "Ликвидирован";
_info0 = "Ну это говнюк конкретный. Добаить нечего";
_info1 = "Помер Максим, да и хер с ним...";

if (_id == 0) then
{
	ctrlSetText [1055, format["%1",_info0]];
	ctrlSetText [1066, format["%1",_roz]];
	_ctrl2 ctrlSetTextColor [0,1,0,1];
}
else
{
	if (_id == 1) then
	{
		ctrlSetText [1055, format["%1",_info1]];
		ctrlSetText [1066, format["%1",_lik]];
		_ctrl2 ctrlSetTextColor [1,0,0,1];
	};
};
};
*/