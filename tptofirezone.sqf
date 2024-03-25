_tele = _this select 0;
_caller = _this select 1;
 
_caller setPos [(getPos firezone select 0) - 2, (getPos firezone select 1) + 1.2];
private _az = getDir firezone;
_caller setDir _az;