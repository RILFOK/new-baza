disableSerialization;

//UID для мл.сержантов
_pUIDmlsergant = []; 

//UID для сержантов
_pUIDsergant = []; 

//UID для мл. лейтенантов
_pUIDmlleitenant = []; 

//UID для лейтенантов
_pUIDleitenant = []; 

//UID для ст. лкйтенантов
_pUIDstleitenant = []; 

//UID для капитанов
_pUIDkapitan = []; 

//UID для майоров
_pUIDmaior = []; 

//UID для подполковников
_pUIDpodpolkovnik = []; 

//UID для полковников
_pUIDpolkovnik = [];   

//UID для пол.преда.
_pUIDpolpred = [];				  


_pUID = getPlayerUID player;

_mor_zvanie = 	if (_pUID in _pUIDmlsergant) then {
				localize "STR_DOM_MISSIONSTRING_1000002"
			} else {
				if (_pUID in _pUIDsergant) then {
					localize "STR_DOM_MISSIONSTRING_1000003"
				} else {
					if (_pUID in _pUIDmlleitenant) then {
						localize "STR_DOM_MISSIONSTRING_1000004"
					} else {
						if (_pUID in _pUIDleitenant) then {
							localize "STR_DOM_MISSIONSTRING_1000005"
						} else {
							if (_pUID in _pUIDstleitenant) then {
								localize "STR_DOM_MISSIONSTRING_1000006"
							} else {
								if (_pUID in _pUIDkapitan) then {
									localize "STR_DOM_MISSIONSTRING_1000007"
								} else {
									if (_pUID in _pUIDmaior) then {
										localize "STR_DOM_MISSIONSTRING_1000008"
									} else {
										if (_pUID in _pUIDpodpolkovnik) then {
											localize "STR_DOM_MISSIONSTRING_1000009"
										} else {
											if (_pUID in _pUIDpolkovnik) then {
												localize "STR_DOM_MISSIONSTRING_1000010"
											}
											else {
												if (_pUID in _pUIDpolkovnik) then {
													localize "STR_DOM_MISSIONSTRING_1000011"
												}
												else {
													localize "STR_DOM_MISSIONSTRING_1000001"
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
createDialog "BT_main_menu";
waitUntil {!isNull (findDisplay 9990);};
ctrlSetText [1000, format["%1 %2",_mor_zvanie, name player]];