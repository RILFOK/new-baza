_vehicle = _this select 0;
{
	if (_x getVariable "isUnconscious") then 
	{
		unAssignVehicle _x;
		moveOut _x;
		sleep 0.3;
		[_x, "UnconsciousReviveDefault_A"] remoteExec ["SwitchMove"];
		[_x, "UnconsciousReviveDefault_A"] remoteExec ["playMove"];
	};
}foreach crew _vehicle;