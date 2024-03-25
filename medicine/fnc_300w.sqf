//-----------------------под замену----------------
/*_unit = _this select 0;
if (icw_work) exitWith {};
icw_work = true;



while {alive _unit && {_unit getVariable "isUnconscious"}} do {

	waitUntil {cameraView == "EXTERNAL" || cameraView == "GROUP"};

	if  (((vehicle player) == player) && (speed ( player)) >= -20) then {
		player switchCamera "INTERNAL";
	};
	sleep 0.1;

	if (((vehicle player)isKindOf "LandVehicle") && (speed (vehicle player)) >= -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;
	if (( vehicle player) isKindOf "Helicopter" && (getPosVisual (vehicle player) select 2) > -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;

	if ((vehicle player) isKindOf "Plane" && (speed (vehicle player)) >= -20) then {
			(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;

	if (((vehicle player)isKindOf "Ship") && (speed (vehicle player)) >= -20) then {
		(vehicle player) switchCamera "Internal";
	};
	sleep 0.1;
};


icw_work = false;
*/

player switchCamera "INTERNAL";
(vehicle player) switchCamera "Internal";