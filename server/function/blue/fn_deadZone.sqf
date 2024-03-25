sleep 1;
_marker = createMarkerLocal ["trigan", position player];
_marker setMarkerShapeLocal "ELLIPSE";
_marker setMarkerBrushLocal "DiagGrid";
_marker setMarkerSizeLocal [600,600];
_marker setMarkerColorLocal "colorBLUFOR";
_kek = true;

while {_kek} do {
	_distance = player distance2D getMarkerPos "trigan";
	if ((alive player) && (_distance < 600)) then {
		if (_distance > 550) then {
			hint "Вы приближаетесь к краю своей зоны!";
		};
		_kek = true;
	} else {
		_kek = false;
		player setDamage 1;
	};
	uiSleep 2;
};
waitUntil { ! alive player };
deleteMarkerLocal _marker;
