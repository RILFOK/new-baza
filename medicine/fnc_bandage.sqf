_medic = _this select 0;
_patient = _this select 1;

if ((items _medic) find "FirstAidKit" != -1 && !(player call fnc_isMedic)) then
{
	_medic removeItem "FirstAidKit";
};
//[_medic, "AinvPknlMstpSlayWrflDnon_medic"] remoteExec ["playMoveNow"];
sleep 0.5;
_patient setVariable ["isBleeding", false, true];