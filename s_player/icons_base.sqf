fnc_iconDraw_base = compileFinal 
"
	if ((ctrlMapScale ((findDisplay 12) displayCtrl 51)) < 0.005) then 
	{
		for '_i' from 0 to (count_m_base-1) do
		{
			format ['m_base_%1_0',_i] setMarkerAlphaLocal 0;
			format ['m_base_%1_1',_i] setMarkerAlphaLocal 1;
			format ['m_base_%1_2',_i] setMarkerAlphaLocal 1;
		};
	}else
	{
		for '_i' from 0 to (count_m_base-1) do
		{
			format ['m_base_%1_0',_i] setMarkerAlphaLocal 1;
			format ['m_base_%1_1',_i] setMarkerAlphaLocal 0;
			format ['m_base_%1_2',_i] setMarkerAlphaLocal 0;
		};
	};
";
count_m_base = 6;
[] spawn {
	sleep 0.1;
	
	//Определение карты
	waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
	clientEhDrawMap_2 = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw",fnc_iconDraw_base];
};