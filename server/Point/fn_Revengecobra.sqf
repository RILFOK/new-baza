if (!isServer) exitWith {};

params ["_veh","_instigator"];

private _cargo = fullCrew [_veh, "cargo", false];

if (missionNameSpace getvariable ["_notallow_revengecobra1", false]) exitWith {};
if (count _cargo == 0) exitWith {};
if (side _instigator != east ) exitWith {};
//if (count allplayers < 16) exitWith {};



private _slot = _instigator getVariable ["slot", "rifleman"];

private _message = "";

private _marker =  (Gamer getVariable "datapoint") param [0];
private _markpos = getMarkerPos _marker;
private _dir = random 360;
private _h = 300;
private _ps = [(_markpos select 0) + ((sin _dir) * 5000),(_markpos select 1) + ((cos _dir) * 5000),_h];
private _spwndir = _dir + 180;


switch _slot do
{
	case "pilot": {
        _message = format ["Вертолет с десантом был сбит пилотом %1. Враг направляет дополнительные воздушные силы на сигнал бедствия", name _instigator];
        // Убрал НАХЕР спиливание ЭКСПЫ за сбитый вертолет
        // [_instigator,-2] spawn bt_fnc_addExp;

        [_message] remoteExec ["hintSilent",allplayers select {side _x == east}];
        
        sleep (random [5, 13, 20]);

        private _type = EnemyAirAA select 0;
        [_ps,_spwndir,_type,_markpos,2] spawn srv_fnc_createenemyairCycleAA;
        
        
    };
	default { 
        _message = format ["Вертолет с десантом был сбит бойцом %1. Враг направляет дополнительные воздушные силы на сигнал бедствия", name _instigator];
        // Убрал НАХЕР спиливание ЭКСПЫ за сбитый вертолет
        // [_instigator, -5.5] spawn bt_fnc_addExp;

        [_message] remoteExec ["hintSilent",allplayers select {side _x == east}];
        sleep (random [5, 13, 20]);


        private _type = EnemyHelli select 0;

        
        [_ps,_spwndir,_type,_markpos,3] spawn srv_fnc_createenemyairCycleAA;

        
        _ps = [(_markpos select 0) + ((sin (_dir + 180)) * 5000),(_markpos select 1) + ((cos (_dir +180)) * 5000),_h];
        _spwndir = _dir + 180 + 180;

        [_ps,_spwndir,_type,_markpos,3] spawn srv_fnc_createenemyairCycleAA;

    };
};

