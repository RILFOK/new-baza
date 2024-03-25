private _level = _this;

private _vseZvaniya = missionNamespace getVariable ["LEVELS",[]];

private _index = (_vseZvaniya findIf {(_x # 0) == _level});
private _zvanie = _vseZvaniya # _index # 1;

_zvanie
