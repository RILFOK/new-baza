waitUntil {
    uiSleep 0.2;
    ((count (missionNamespace getVariable ["DIARY",[]])) > 0)
};
private _diaryArray = missionNamespace getVariable ["DIARY",[]];
private _diaryKey = [];
private _diary = [];

{
    _diaryKey pushBackUnique [_x # 1,_x # 2];
} forEach _diaryArray;

{
    _diary pushBack [_x # 1, [_x # 5, _x # 6]];
} forEach _diaryArray;

{
    player createDiarySubject _x;
} forEach _diaryKey;

{
    player createDiaryRecord _x;
} forEach _diary;
