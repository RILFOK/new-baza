closeDialog 51000;

private _pos = getPos (baseavia);
private _dir = 288;
private _camera = "CamCurator" camcreate _pos;

_camera cameraeffect ["internal", "back"];
_camera camPreparePos _pos;
_camera camCommitPrepared 0;
_camera setPosATL _pos;
_camera setDir _dir;

player setVariable ["CAMERA",_camera];

camKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    private _key = _this # 1;
    private _camera = player getVariable "CAMERA";
    private _return = false;

    if (_key == 1) then {
        _camera cameraEffect ["terminate", "back"];
        camDestroy _camera;
        _return = true;
    };
    if (_key == 49) then{
        if !(player getvariable ["_cam_avia_NVG",false]) then {
            camUseNVG true;
            player setVariable ["_cam_avia_NVG",true];
        } else {
            camUseNVG false;
            player setVariable ["_cam_avia_NVG",false];
        };
        _return = true;
    };

    _return
}];

while {!isNull _camera} do {
    uiSleep 0.1;
    if !((getPos _camera) inArea [_pos,2000,2000,0,false]) then {
        _camera setPosATL _pos;
        _camera setDir _dir;
    };
};

(findDisplay 46) displayRemoveEventHandler ["keyDown",camKeyDown];
