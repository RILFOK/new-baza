/*waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
status_bar_active = true;
[] spawn
{
	while {true} do
	{
		if (!status_bar_active) then 
		{
			((uiNamespace getVariable "RscStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText "";
		};
		waitUntil{sleep 0.3;status_bar_active};
		uisleep 5;
		
			_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];

			if(isNull ((uiNamespace getVariable "RscStatusBar")displayCtrl 55554)) then
			{
				diag_log "statusbar is null create";
				disableSerialization;
				_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
				_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];
			};
			//initialize variables and set values
			_unit = _this select 0;
			/*{serverFPS = round diag_fps; publicVariable "serverFPS";} remoteExec ["bis_fnc_call", 2];
			_ClientFPS = round diag_fps;
			
			//display the information
			((uiNamespace getVariable "RscStatusBar")displayCtrl 55554) ctrlSetStructuredText
			parseText
			format
			["
				<t/>FPS Сервера %1<\t>
				<t/>FPS Клиента %2</t>",
				serverFPS,
				_ClientFPS
			];
	};
};*/
