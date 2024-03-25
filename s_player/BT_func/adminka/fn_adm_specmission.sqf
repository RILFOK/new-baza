BT_specmission_text_nazv = "";
BT_specmission_text_vrem = "";
BT_specmission_text_opis = "";

disableSerialization;

createDialog "adminka_specmission";

((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140088) ctrlSetText BT_specmission_text_nazv;
((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140188) ctrlSetText BT_specmission_text_vrem;
((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140288) ctrlSetText BT_specmission_text_opis;

BT_fnc_prim_specmission = {
	BT_specmission_text_nazv = ctrlText ((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140088);
	BT_specmission_text_vrem = ctrlText ((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140188);
	BT_specmission_text_opis = ctrlText ((uiNamespace getVariable "ADMINKA_SPECMISSION") displayCtrl 140288);
	[BT_specmission_text_nazv,BT_specmission_text_vrem,BT_specmission_text_opis] spawn BT_fnc_specmission_call_db;
};