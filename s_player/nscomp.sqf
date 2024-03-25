camputer addAction ["<t color='#00CCCC'>6 часов утра</t>", {[[2019, 7, 1, 6, 0]] remoteExec ["setDate", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00CCCC'>12 часов дня</t>", {[[2019, 7, 1, 12, 0]] remoteExec ["setDate", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00CCCC'>9 часов вечера</t>", {[[2019, 7, 1, 21, 0]] remoteExec ["setDate", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00CCCC'>12 часов ночи</t>", {[[2019, 7, 1, 24, 0]] remoteExec ["setDate", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#ff2200'>Пропустить 1 час</t>", {[1] remoteExec ["skipTime", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#ff2200'>Пропустить 3 часа</t>", {[3] remoteExec ["skipTime", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#ff2200'>Пропустить 6 часов</t>", {[6] remoteExec ["skipTime", 2]},[],1.5,true,true,""];

camputer addAction ["<t color='#ff9900'>Солнечно без облаков</t>", {[0,0] remoteExec ["setOvercast", 2];[0,0] remoteExec ["setRain", 2];remoteExec ["forceWeatherChange", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#ff9900'>Облачно</t>", {[1,1] remoteExec ["setOvercast", 2];[0,0] remoteExec ["setRain", 2];remoteExec ["forceWeatherChange", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#ff9900'>Дождь</t>", {[1,1] remoteExec ["setOvercast", 2];[1,1] remoteExec ["setRain", 2];remoteExec ["forceWeatherChange", 2]},[],1.5,true,true,""];

camputer addAction ["<t color='#ff9900'>Снег</t>", {
	[0,1] remoteExec ["setOvercast", 2];
	[0,1] remoteExec ["setRain", 2];
	[0,0.5] remoteExec ["setFog", 2];
	[0.9] remoteExec ["setHumidity", 2];
	
	[
		[
			"a3\data_f\rainnormal_ca.paa",
			1,
			0.01,
			15,
			0.1,
			2,
			0.5,
			0.5,
			0.02,
			0.02,
			[0.1, 0.1, 0.1, 1],
			0.1, 
			0.1, 
			5.5,
			0.3,
			true,
			false
		]
	] remoteExecCall ["setRain", 0, true];
	remoteExec ["forceWeatherChange",2];

},[],1.5,true,true,""];


camputer addAction ["<t color='#FFFF00'>Убрать гром</t>", {[1,0] remoteExec ["setLightnings", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#FFFF00'>Установить гром</t>", {[1,1] remoteExec ["setLightnings", 2]},[],1.5,true,true,""];

camputer addAction ["<t color='#00FF00'>Убрать туман</t>",{[1,0] remoteExec ["setFog", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00FF00'>Туман 1/5 </t>", {[1,0.2] remoteExec ["setFog", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00FF00'>Туман 2/5 </t>", {[1,0.4] remoteExec ["setFog", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00FF00'>Туман 3/5 </t>", {[1,0.6] remoteExec ["setFog", 2]},[],1.5,true,true,""];
camputer addAction ["<t color='#00FF00'>Густой туман</t>", {[1,1] remoteExec ["setFog", 2]},[],1.5,true,true,""];


[radik, "<t color='#ff0000'>Вызвать силы CSAT</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 20", "_caller distance _target < 20", {}, {}, {private _datapoint = Gamer getVariable ["datapoint",[]];_datapoint params ["_Point","_NamePoint"]; hint format[localize "STR_CONF_CSAT1",_NamePoint]; [_Point] remoteExec ["srv_fnc_ReinforPointCSAT",2]}, {}, [], 3, 0, true, false] call BIS_fnc_holdActionAdd;

diff addAction ["<t color='#ff0000'>Включить первое лицо</t>", {missionNamespace setVariable ["3pw", true ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Выключено третье лицо"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Включить стамину</t>", {missionNamespace setVariable ["stamina", true ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Включена стамина"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Включить тряску</t>", {missionNamespace setVariable ["traska", true ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Тряска выключена"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Выключить маркеры на карте</t>", {missionNamespace setVariable ["MapNV", true ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Маркеры отключены"},[],1.5,true,true,""];

diff addAction ["<t color='#ff0000'>Выключить первое лицо</t>", {missionNamespace setVariable ["3pw", false ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Включено третье лицо"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Выключить стамину</t>", {missionNamespace setVariable ["stamina", false ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Выключена стамина"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Выключить тряску</t>", {missionNamespace setVariable ["traska", false ,true];[] remoteExec ["srv_fnc_stamina"];  hint "Тряска выключена"},[],1.5,true,true,""];
diff addAction ["<t color='#ff0000'>Включить маркеры на карте</t>", {missionNamespace setVariable ["MapNV", false ,true];[] remoteExec ["srv_fnc_disstamina"];  hint "Маркеры включены"},[],1.5,true,true,""];


[gr, "<t color='#ff0000'>Сбросить группы</t>", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 30", "_caller distance _target < 30", {}, {}, 
{[] remoteExec ["srv_fnc_delgr",0,true]}, 
{}, [], 3, 0, false, false] remoteExec ["BIS_fnc_holdActionAdd",0,gr];