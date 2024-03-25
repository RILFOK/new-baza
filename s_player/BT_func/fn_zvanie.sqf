/*_unit = _this # 0;
_pUID = getPlayerUID _unit;

while {true} do {
	_numZvanie = missionNamespace getVariable [format["ZVANIE_%1",_pUID],1];

	switch (_numZvanie) do {
		case 1: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"рядовой",true]};
		case 2: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"мл.сержант",true]};
		case 3: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"сержант",true]};
		case 4: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"мл.лейтенант",true]};
		case 5: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"лейтенант",true]};
		case 6: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"ст.лейтенант",true]};
		case 7: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"капитан",true]};
		case 8: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"майор",true]};
		case 9: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"подполковник",true]};
		case 10: {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"полковник",true]};
		default {missionNamespace setVariable [format["BTZVANIE_%1",_pUID],"новобранец",true]};
	};
	sleep 0.5;
};