params ["_nazv","_vrem","_opis"];

_data = [_nazv,_vrem,_opis];

[[_data],BT_fnc_spec_save_db] remoteExec ["spawn",2];