#define MAX_SAFE_DAMAGE	0.9
_unit       = _this select 0;
_damage     = _this select 2;
_instigator = _this select 6;


if ((damage _unit) <= _damage) then {_damage = _damage - (damage _unit);};

if ((vehicle _unit) != _unit) then {
	_damage = _damage * 0.5;
};

_totalDamage = _damage + (damage _unit);


if (!(_unit getVariable ["isUnconscious", false])) then {
	if (_totalDamage >= MAX_SAFE_DAMAGE) then {
		_damage = MAX_SAFE_DAMAGE;
		_injury = false;
      	[_unit, _instigator, _injury] spawn AVO_fnc_MED;
		[_unit] spawn fnc_300w;
	} else {
			if (!(_unit getVariable ["injury", false])) then {
				if (_totalDamage > 0.05) then {
					[_unit, _instigator,_damage] spawn AVO_fnc_Injury;
				};
			} else {
				if ((vehicle _unit) != _unit) then {
						_damage = _damage * 0.1 + (damage _unit);
				};
			};
		_damage = _totalDamage;
		};	
} else {
	if (_totalDamage >= MAX_SAFE_DAMAGE) then {
		_damage = 0;
	};
};

_damage;