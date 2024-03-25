
//---------------------------------------------------добавление зевсу видимость
if !(isServer) exitwith {};

private _zeusobjects_script = [] spawn 
{
	while {true} do
	{
		{
			_x addCuratorEditableObjects [allUnits, true];
			_x addCuratorEditableObjects [vehicles, true];
		} forEach allCurators; 
	sleep 5;
	};
};

//---------------------------------------------------------------------------------------------------------------------------

missionNamespace setvariable ["_zeusaddobjects_script",_zeusobjects_script];
