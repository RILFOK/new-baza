params [ ["_veh", objNull, [objNull]] ];
if (_veh isEqualTo objNull) exitWith {}; // Если не передали объект - выходим отсюда


private _pylonConfs = "true" configClasses (configOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons");
private _numPylons = count (_pylonConfs);

if (_numPylons < 1) exitWith {}; // Нечего редактировать

private _emptyRow = []; // Массив с 0 по количеству пилонов для использования в качестве возможности подвешивания по умолчанию
for "_i" from 1 to _numPylons do {_emptyRow pushBack 0;};

// Массив массивов с совместимыми магазинами. Для удобства применения белых/чёрных списков, запрета пилонов, добавления нештатных подвесов
// и прочих шалостей. Ну или просто забить _pylonArrays руками и скормить тому, что дальше.
private _pylonArrays = [];
for "_i" from 1 to _numPylons do {
	_pylonArrays pushBack ((_veh getCompatiblePylonMagazines _i) - (missionNamespace getVariable ["PylonManagerBlackList",[]]));
};

// Если все пилоны завязаны на пилота - переключение стрелок/пилот не понадобится
private _pylonTurrets = _pylonConfs apply {
	getArray (_x >> "turret")
};
private _noGunner = count (_pylonTurrets - [[]]) == 0;

// Для всех совместимых магазинов сделаем hashMap с displayName, descriptionShort и можно/нет (1/0) вешать на пилон, пример:
// ["PylonRack_3Rnd_Missile_AGM_02_F",["Macer 3x","Short-range, infrared-guided, air-to-surface missile with high-explosive anti-tank warhead",[0,0,1,1,1,1,1,1,0,0]]]
private _pylonMags = createHashMap;
{
	private _imags = _x;
	private _i = _forEachIndex + 1;
	private _magsWithPrice = _imags apply {
		private _mag = _x;
		private _config = configFile >> "CfgMagazines" >> _x;
		private _dn = getText (_config >> "displayName");
		private _ds = getText (_config >> "descriptionShort");
		[_mag, _dn, _ds];
	   };
	
	_magsWithPrice pushBack ["", "Пустой. Модификаторы: Ctrl/Alt", "Пустой пилон. Ctrl - смена пилот/стрелок. Alt - Отзеркалить", 0, 0];
	{
		if !(_x#0 in _pylonMags) then {
			_pylonMags set [_x#0, [_x#1, _x#2, [] + _emptyRow]];
		};
		private _cur = _pylonMags get (_x#0);
		_cur#2 set [_i-1, 1];
	} forEach _magsWithPrice;
} forEach _pylonArrays;

[_veh, _pylonMags, _noGunner] spawn
{

	uiNamespace setVariable ["updateLNB", {
		disableSerialization;
		params ["_control", "_setup", "_forcedPilot"];
		lnbSize _control params ["_rows", "_cols"];
		for "_row" from 0 to _rows do {
			private _class = _control lnbData [_row, 0];
			private _r = (_control lnbValue [_row, 0]) % 1000;
			for "_pylon" from 1 to _cols - 3 do {
				private _cur = _control lnbValue [_row, _pylon]; // _cur: 0 - нельзя вешать, 1 - можно
				if (_class == _setup select (_pylon-1)) then {
					_cur = _cur * 2; // 2 - уже висит
					_r = _r % 1000 + 1000; // Висящие подвесы поднимаем в сортировке на 1000 позиций
				};
				private _fPilot = _forcedPilot select (_pylon - 1);
				_control lnbSetPicture [
					[_row, _pylon], 
					[
						"a3\ui_f\data\gui\rsc\rscdisplayarcademap\icon_exit_cross_ca.paa", 
						"a3\ui_f\data\map\markers\military\circle_ca.paa", 
						//"a3\ui_f\data\map\vehicleicons\iconobject_circle_ca.paa"
						[
							"a3\ui_f\data\igui\cfg\commandbar\imagegunner_ca.paa",
							"a3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa"
						] select _fPilot // false/true удобно выбирает между "как положено" и "пилоту в зубы"
					] select _cur]; // 0,1,2 очень удобно выбирают нужную иконку
				_control lnbSetPictureColor [
					[_row, _pylon],
					[
						[1,0,0,1],
						[1,1,1,1],
						[0,1,0,1]
					] select _cur
				];
				_control lnbSetPictureColorSelected [
					[_row, _pylon],
					[
						[1,0,0,1],
						[1,1,1,1],
						[0,1,0,1]
					] select _cur
				];
				_control lnbSetValue [[_row, 0], _r];
			};
	
			if (_class isEqualTo "") then {_control lnbSetValue [[_row, 0],1000000]};
		};
	}];

	disableSerialization;

    params ["_veh", "_pylonMags", "_noGunner"];

	// Пересохраняем параметры в uiNamespace для переиспользования в Event Handler-ах
	uiNamespace setVariable ["curVeh", _veh];
	private _defSetup = GetPylonMagazines _veh;
	uiNamespace setVariable ["setup", _defSetup];
	uiNamespace setVariable ["noGunner", _noGunner];

	// Собираем текущих владельцев пилонов (пилот/не пилот). Что у пилота - будет принудительно давать пилоту.
	private _pylInfo = getAllPylonsInfo _veh;
	private _forcePilot = _pylInfo apply {_x#2 isEqualTo [-1]};
	uiNamespace setVariable ["forcePilot", _forcePilot];

	// Собираем список зеркальных пилонов. В нумерации пилонов (старт с 1).
	private _mirrorList = [];
	_mirrorList resize (count _pylInfo);
	{
		private _pylNumber = _x#0;
		private _pylName = _x#1;
		private _mir = getNumber (configOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> _pylName >> "mirroredMissilePos");
		if (_mir > 0) then {
			if (isNil {_mirrorList#_pylNumber} && isNil {isNil {_mirrorList#_mir}}) then {
				systemChat format ["Something wrong with pylon config of %1 or %2", _pylNumber, _mir];
			};
			_mirrorList set [_pylNumber, _mir];
			_mirrorList set [_mir, _pylNumber];
		};
	} forEach _pylInfo;
	_mirrorList = _mirrorList apply {if (isNil "_x") then {-1} else {_x}};
	uiNamespace setVariable ["mirrorList", _mirrorList];
	
	// ListNBox использует idc = -1, потому от балды взяты значения 6660, 6666, 6667
	private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
	private _ctrlGroup = _display ctrlCreate ["RscControlsGroup", 6666];

	// Задник, он же фон
	private _back = _display ctrlCreate ["RscTextMulti", 6660, _ctrlGroup];
	_back ctrlSetPosition [0,0,1,1];
	_back ctrlSetBackgroundColor [0.3,0.3,0.3,0.7];
	_back ctrlEnable false;
	_back ctrlCommit 0;

	private _lnb = _display ctrlCreate ["RscListNBox", 6667, _ctrlGroup];
	uiNamespace setVariable ["lnb", _lnb];
	_lnb ctrlSetPosition [0,0,1,1];

	private _pylCount = count (_pylonMags get "" select 2); // На сколько пилонов можно ничего не вешать - столько их и есть
	private _colPos = [0.01, 0.5];
	for "_i" from 1 to _pylCount do {_colPos pushBack (0.5 + 0.03 * _i)}; // добавить по столбцу на пилон
	_colPos pushBack 1; // и ещё один в конец
	_lnb lnbSetColumnsPos _colPos;
	_lnb ctrlCommit 0;



	// Отсортировать ключи hashMap по сохранённому displayName по алфавиту, пустой пилон передвинуть в начало
	private _keys = keys _pylonMags;
	_keys = _keys - [""];
	_keys = [_keys, [], {_pylonMags get _x select 0}] call BIS_fnc_sortBy;
	_keys = [""] + _keys;

	lnbClear _lnb;
	// Заполнить строки. Название, можно ли вешать на каждый пилон. Описание в подсказку.
	{
		private _class = _x;
		_pylonMags get _x params ["_dn", "_ds", "_pylons"];
		private _row = [_dn];
		_row append (_pylons apply {str _x});
		private _i = _lnb lnbAddRow _row;
		_lnb lnbSetTooltip [[_i, 0], _ds];
		_lnb lnbSetData [[_i, 0], _class];
	} forEach _keys;

	// Второй проход, в 0 столбце проставляем Value по порядку для последующей сортировки.
	// На пересечениях подвес/пилон значение из текста перекладываем в Value 
	lnbSize _lnb params ["_rows", "_cols"]; // Количество строк и столбцов берём с самого ListNBox
	for "_row" from 0 to _rows do {
		_lnb lnbSetValue [[_row, 0], _rows -_row];
		for "_pylon" from 1 to _cols - 3 do {
			private _cur = parseNumber (_lnb lnbText [_row, _pylon]);
			_lnb lnbSetText [[_row, _pylon], ""];
			_lnb lnbSetValue [[_row, _pylon], _cur];
		};
	};

	// Выставляем итоговую высоту ListNBox и задника
	// ctrlFontHeight _lnb + 0.001 примерно попадает в высоту строки, проверено на списке в 70 строк
	_lnb ctrlSetPosition [0,0,1,(ctrlFontHeight _lnb + 0.001) * _rows];
	_back ctrlSetPosition [0,0,1,((ctrlFontHeight _lnb + 0.001) * _rows) max 0.9];
	_lnb ctrlCommit 0;
	_back ctrlCommit 0;

	// И прибитый гвоздями размер группы. Если что не влезет - будут полосы прокрутки.
	_ctrlGroup ctrlSetPosition [0,0,1,0.9];
	_ctrlGroup ctrlCommit 0;

	// Отрисовать иконки и отсортировать
	[_lnb, _defSetup, _forcePilot] call (uiNamespace getVariable "updateLNB");
	_lnb lnbSortByValue [0, true];

	_lnb ctrlAddEventHandler ["MouseButtonDblClick", {
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
		lnbSize _control params ["_rows", "_cols"]; // Количество строк и столбцов берём с самого ListNBox
		private _row = lnbCurSelRow _control; // строка

		// Клик пришёл в столбец левее того, который точно правее клика.
		// Без поправки на 0.01 нажимаемая область уезжала влево от иконки
		private _gcp = lnbGetColumnsPosition _control;
		private _col = (_gcp findIf {_x > (_xPos - 0.01)}) - 1; 
		private _setup = uiNamespace getVariable "setup";
		private _forcePilot = uiNamespace getVariable "forcePilot"; // массив владельцев пилонов вида "как положено/в зубы пилоту"
		private _noGunner = uiNamespace getVariable "noGunner"; // если пилоны только у стрелка - не понадобится переключать владельцев
		if (_col > 0 && _col < _cols - 2) then { // Если попадаем в столбец с пилоном
			private _class = _control lnbData [_row, 0];
			if (_control lnbValue [_row, _col] > 0) then {_setup set [_col - 1, _class]}; // lnbValue - можно ли вешать. Если можно - вешаем.
			if (_ctrl && !_noGunner) then {_forcePilot set [_col - 1, !(_forcePilot select (_col - 1))]}; // переключатель "как положено/в зубы пилоту"
			if (_alt) then { // При нажатом Alt - пробуем отзеркалить
				private _mirrorList = uiNamespace getVariable "mirrorList";
				_col = _mirrorList select (_col);
				if (_col > 0) then {
					if (_control lnbValue [_row, _col] > 0) then {_setup set [_col - 1 , _class]};
					if (_ctrl && !_noGunner) then {_forcePilot set [_col - 1, !(_forcePilot select (_col - 1))]};
				};
			};
		};
		uiNamespace setVariable ["setup", _setup];
		uiNamespace setVariable ["forcePilot", _forcePilot];
		[_control, _setup, _forcePilot] call (uiNamespace getVariable "updateLNB");
	}];

	_display displayAddEventHandler ["Unload", {
		// Подчистить за собой
		uiNamespace setVariable ["updateLNB", nil];
		uiNamespace setVariable ["curVeh", nil];
		uiNamespace setVariable ["setup",nil];
		uiNamespace setVariable ["noGunner", nil];
		uiNamespace setVariable ["forcePilot", nil];
		uiNamespace setVariable ["mirrorList", nil];
		uiNamespace setVariable ["lnb", nil];

	}];

	// Сортировка непосредственно при смене подвеса выдёргивает строку из-под курсора. Чтобы не бесило - сортировка на отдельной кнопке.
	private _sort = _display ctrlCreate ["RscButton", -1];
	_sort ctrlSetPosition [0, 0.91, 0.15, 0.09];
	_sort ctrlCommit 0;
	_sort ctrlSetText "SORT";
	_sort ctrlAddEventHandler ["ButtonDown", {
		uiNamespace getVariable "lnb" lnbSortByValue [0, true];
	}];

	private _apply = _display ctrlCreate ["RscButton", 1];
	_apply ctrlSetPosition [0.69, 0.91, 0.15, 0.09];
	_apply ctrlCommit 0;
	_apply ctrlSetText "APPLY";
	_apply ctrlAddEventHandler ["ButtonDown", {
		params ["_control"];
		_veh = uiNamespace getVariable "curVeh";
		_driver = driver _veh;
		if ([ _veh, _driver, 1 ] call pylon_manager_fnc_pylonmanagercheck) then {
			if (_veh isEqualType objNull) then { // Если передавался класс, а не объект - применять некуда
				private _pylons = uiNamespace getVariable "setup";
				private _forcePilot = uiNamespace getVariable "forcePilot";
	
				// Выставление пилонов по рецепту с https://community.bistudio.com/wiki/Arma_3:_Vehicle_Loadouts#Saving_and_restoring
				private _pylonPaths = ("true" configClasses (configOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons")) apply {getArray (_x >> "turret")};
				{ 
					private _wpn = getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
					_veh removeWeaponGlobal _wpn;
					_veh removeWeaponTurret [_wpn, [-1]];
				} forEach getPylonMagazines _veh;
				{ _veh setPylonLoadOut [_forEachIndex + 1, _x, true, [_pylonPaths select _forEachIndex, [-1]] select (_forcePilot select _forEachIndex)] } forEach _pylons;
			};
		}else{
			"Не выполнены условия смены пилонов" remoteExec ["hint", clientOwner];
		};
		
		ctrlParent _control closeDisplay 1;
	}];

	private _cancel = _display ctrlCreate ["RscButton", 2];
	_cancel ctrlSetPosition [0.85, 0.91, 0.15, 0.09];
	_cancel ctrlCommit 0;
	_cancel ctrlSetText "CANCEL";
	_cancel ctrlAddEventHandler ["ButtonDown", {
		params ["_control"];
		ctrlParent _control closeDisplay 1;
	}];
};