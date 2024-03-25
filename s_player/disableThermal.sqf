/*
Author: ToxaBes
Description: disable thermal view on helmets and nvgs
*/
/*
while {true} do { 
    waituntil {currentVisionMode player == 2};
    vehicle player disableTIEquipment true;
    cutText ["Тепловизор не работает, нажмите N для перезагрузки.", "BLACK", 0.001];
    playSound "FD_CP_Not_Clear_F";
    waituntil {currentVisionMode player != 2};
    0 cutFadeOut 0;
};*/

player addEventHandler ["VisionModeChanged", {
	params ["_person", "_visionMode", "_TIindex", "_visionModePrev", "_TIindexPrev", "_vehicle", "_turret"];
    if (_visionMode == 2) then { 
        vehicle _person disableTIEquipment true;
        playSound "FD_CP_Not_Clear_F";

        [] spawn {
            cutText ["Тепловизор не работает, нажмите N для перезагрузки.", "BLACK", 0.001];
            playSound "FD_CP_Not_Clear_F";
            waituntil {currentVisionMode player != 2};
            0 cutFadeOut 0;
        };

    };
}];