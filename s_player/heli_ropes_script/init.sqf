player addAction ["<t color='#C9C900'>ПОДЦЕПИТЬ</t>", {[[vehicle player],{[_this select 0] spawn fnc_attach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player] call can_attach_ropes"];
player addAction ["<t color='#C9C900'>ОТЦЕПИТЬ</t>", {[[vehicle player,false],{[_this select 0,_this select 1] spawn fnc_detach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player,false] call can_detach_ropes"];
player addAction ["<t color='#C9C900'>ОТЦЕПИТЬ С ПАРАШЮТОМ</t>", {[[vehicle player,true],{[_this select 0,_this select 1] spawn fnc_detach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player,true] call can_detach_ropes"];

player addEventHandler ["Respawn", 
{
	player addAction ["<t color='#C9C900'>ПОДЦЕПИТЬ</t>", {[[vehicle player],{[_this select 0] spawn fnc_attach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player] call can_attach_ropes"];
	player addAction ["<t color='#C9C900'>ОТЦЕПИТЬ</t>", {[[vehicle player,false],{[_this select 0,_this select 1] spawn fnc_detach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player,false] call can_detach_ropes"];
	player addAction ["<t color='#C9C900'>ОТЦЕПИТЬ С ПАРАШЮТОМ</t>", {[[vehicle player,true],{[_this select 0,_this select 1] spawn fnc_detach_ropes}] remoteExec ["bis_fnc_spawn", 2];}, nil, 10, true, true, "", "[vehicle player,true] call can_detach_ropes"];
}];
