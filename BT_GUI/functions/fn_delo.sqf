
disableSerialization;
_id = lbCurSel 1555;
//_class = lbData [7, _id];
_info0 = "qqq";
_info1 = "www";

if (_id == 0) then
{
	ctrlSetText [1055, format["%1",_info0]];
}
else
{
	if (_id == 1) then
	{
		ctrlSetText [1055, format["%1",_info1]];
	};
};