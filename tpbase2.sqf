_tele = _this select 0;
_caller = _this select 1;

_caller setPos [(getPos tpbase2 select 0) - 1.8, (getPos tpbase2 select 1) - 0.3];
private _az = getDir tpbase2;
_caller setDir _az;