_marker = createMarkerLocal ["ostrov", position player];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerSizeLocal [50,50];
_marker setMarkerColorLocal "colorBLUFOR";
missionNamespace setVariable ["inIland",true];
while {missionNamespace getVariable "inIland"} do {
	if ((player inArea "ostrov")) then {
		missionNamespace setVariable ["inIland",true];
	} else {
		missionNamespace setVariable ["inIland",false];
		hint "Покидать зону запрещено";
		sleep 2;
		"end1" call BIS_fnc_endMission;
	};
	uiSleep 2;
};