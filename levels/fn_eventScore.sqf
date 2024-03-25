params ["_event", "_args"];

private _BaseScores = + SRV_BaseScores;

// УДАЛИТЬ ИЛИ ЗАКОМЕНТИТЬ ДЛЯ РЕЛИЗА
// _BaseScores set ["engineer_veh_default",1];
// _BaseScores set ["engineer_veh_reapir",5];
// _BaseScores set ["engineer_veh_refuel",1];
// _BaseScores set ["engineer_veh_rearm",1];

// (_BaseScores get "")
// // Вызов для обработчика "убиство бота":
// ["kill",[_unit,_killer,_instigator, 0.2]] spawn bt_fnc_eventScore;   // для зевсовых
// ["kill",[_unit,_killer,_instigator, 1]] spawn bt_fnc_eventScore;   // для базовых
// // Вызов для блока МЕДИЦИНЫ
// ["medicine", ["", _player ]] spawn bt_fnc_eventScore;   // для медицины
// // Вызов для блока Задачи
// ["task", ["main", _player ]] spawn bt_fnc_eventScore;   // экспа за основную задачу
// // Вызов блока ремонт техники инженером (reapir/refuel/rearm)
// ["engineer_veh", ["reapir", _curCaller, _amount ]] spawn bt_fnc_eventScore;   // инженер отремонтировал тачку от начальных повреждений _amount


private _sendLog = {    //  Обработчик вывода сообщений в чат кураторам
    params [["_textFormat", "У eventScore проблемы. Неизвестный textFormat в sendLog", [""] ]];
    {
        [getAssignedCuratorUnit _x, _textFormat] remoteExec ["groupChat", getAssignedCuratorUnit _x];
    } forEach allCurators;
};

private _CoeffDifficulty = {    //  Функция расчета конечного коэффициента надбавок за усложнение. чтоб не писать 1 и тотже код
    params [ ["_coefficient", 1, [0]] ];
    if (missionNamespace getVariable ["stamina", false]) then {
        if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
            private _textFormat = format ["Применено coefficient_stamina = %1 к входящему %2",_BaseScores get "coefficient_stamina",_coefficient];
            _textFormat spawn _sendLog;
        };
        _coefficient = _coefficient * (_BaseScores get "coefficient_stamina");
    };
    if (missionNamespace getVariable ["3pw", false]) then {
        if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
            private _textFormat = format ["Применено coefficient_3pw = %1 к входящему %2",_BaseScores get "coefficient_3pw",_coefficient];
            _textFormat spawn _sendLog;
        };
        _coefficient = _coefficient * (_BaseScores get "coefficient_3pw");
    };
    if (missionNamespace getVariable ["traska", false]) then {
        if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
            private _textFormat = format ["Применено coefficient_traska = %1 к входящему %2",_BaseScores get "coefficient_traska",_coefficient];
            _textFormat spawn _sendLog;
        };
        _coefficient = _coefficient * (_BaseScores get "coefficient_traska");
    };
    if (missionNamespace getVariable ["MapNV", false]) then {
        if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
            private _textFormat = format ["Применено coefficient_MapNV = %1 к входящему %2",_BaseScores get "coefficient_MapNV", _coefficient];
            _textFormat spawn _sendLog;
        };
        _coefficient = _coefficient * (_BaseScores get "coefficient_MapNV");
    };
    _coefficient;
};

// Список событий "_event":
// 
switch (_event) do {
    case "task":{   //  дублируется с медициной. ХЗ зачем. 
        _args params ["_type", "_player" ];
        private _coefficient = 1;
        //  Надбавки за усложнения
        _coefficient = _coefficient call _CoeffDifficulty;

        private _score = 0;
        switch (_type) do {
            case "main": {
                _score = (_BaseScores get "Task_main") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_main с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "main_engineer": {
                _score = (_BaseScores get "Task_main_engineer") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_main_engineer с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "main_leader": {
                _score = (_BaseScores get "Task_main_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_main_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "transmitter": {
                _score = (_BaseScores get "Task_hack_transmitter") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_hack_transmitter с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "radar": {
                _score = (_BaseScores get "Task_disable_radar") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_disable_radar с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "radar_engineer": {
                _score = (_BaseScores get "Task_disable_radar_engineer") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_disable_radar_engineer с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            default { // неизвестный вызов по медицине
                _score = (_BaseScores get "Task_default") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван Task_default с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
        };
    };
    case "medicine":{
        _args params ["_type", "_player" ];
        private _coefficient = 1;
        //  Надбавки за усложнения
        _coefficient = _coefficient call _CoeffDifficulty;

        private _score = 0;
        switch (_type) do {
            case "teamkiller": {
                _score = (_BaseScores get "medicine_teamkiller") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_teamkiller с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "suicide": {
                _score = (_BaseScores get "medicine_suicide") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_suicide с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "tankman": {
                _score = (_BaseScores get "medicine_tankman") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_tankman с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "tank_leader": {
                _score = (_BaseScores get "medicine_tank_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_tank_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "pilot": {
                _score = (_BaseScores get "medicine_pilot") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_pilot с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "pilot_leader": {
                _score = (_BaseScores get "medicine_pilot_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_pilot_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "slotother": {
                _score = (_BaseScores get "medicine_slotother") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_slotother с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "slotother_leader": {
                _score = (_BaseScores get "medicine_slotother_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_slotother_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "revive": {
                _score = (_BaseScores get "medicine_revive") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_revive с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "revive_leader": {
                _score = (_BaseScores get "medicine_revive_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_revive_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "executed": {
                _score = (_BaseScores get "medicine_executed") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_executed с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "executed_leader": {
                _score = (_BaseScores get "medicine_executed_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_executed_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "bled": {
                _score = (_BaseScores get "medicine_bled") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_bled с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "bled_leader": {
                _score = (_BaseScores get "medicine_bled_leader") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_bled_leader с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            default { // неизвестный вызов по медицине
                _score = (_BaseScores get "medicine_default") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван medicine_default с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
        };
    };
    case "kill": {
        // _killed - Цель убийства (бот, техника, игрок)
        // _killer - Убийца (если техника то вернет технику)
        // _instigator - Спустивший курок
        // _coefficient - Множитель Экспы от базовой. На пример у техники и ботов от зевса он 0.2
        _args params ["_killed", "_killer", "_instigator", ["_coefficient", 1, [0]] ];

        if (!(isPlayer _killer) && !(isPlayer _instigator)) exitWith {};    //  Если убийца не игрок то выходим

        //Синие превенцыя ТК
        if (side _instigator == west) then {
            if (side group _killed == side _instigator) exitWith {
                [_killed, _instigator] spawn blu_fnc_preventTK;
            };
        };

        If ((side _instigator == east) || (side _killer == east)) then {   // Если убийца из красныйх
            private _slot = _killer getVariable ["slot","null"];    //  Вытаскиваем "слот" убийцы

            if (_slot == "null") then {
                _slot = _instigator getVariable ["slot","null"];
                _killer = _instigator;
            };
            if (side group _killed == east) exitWith {};    // Если тимкил у красных то завершаем выполнения и ничерта не даём
            private ["_nsh","_isnsh"];
            private _leader = leader (group _killer);
            private _isLeader = if (_leader == _killer) then {true} else {false};
            if !(isNil "NASH") then {
                _nsh = NASH;
                _isnsh = if (_nsh == _killer) then {true} else {false};
            } else {
                _isnsh = true;
            };
            private _distance = 0;
            private _role = "";
            private _crew = [];
            if (vehicle _killer != _killer) then {
                private _veh = vehicle _killer;
                _crew = fullCrew _veh select {_x select 1 != "cargo"} apply {_x select 0} select {isPlayer _x}; 
                _crew pushBackUnique _killer;
            } else {
                _crew = [_killer];
            };
            //  Надбавки за усложнения
            _coefficient = _coefficient call _CoeffDifficulty;
            // офицеры и ПТ/ПВО бойцы
            private _targetIcon = ["iconManOfficer","iconManAT","iconManLeader"];
            private _target = "";
            //  обработчик расчета и начисления Экспы
            private _score = 0;
            switch (true) do {
                case (_killed isKindOf "Ship"): {   //  уничтожение катера
                    _score = (_BaseScores get "Ship_Default") * _coefficient;  // Базовая экспа за катер
                    switch (_slot) do {
                        case "pilot":{
                            _score = (_BaseScores get "Ship_pilot") * _coefficient;  // пилот уничтожил катер
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Ship_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Ship_tankman") * _coefficient;  // танкист уничтожил катер
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Ship_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Ship_antitank") * _coefficient; // ПТ/ПВО уничтожил катер
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Ship_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        default {   // любой другой уничтожил катер
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Ship_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
                case (_killed isKindOf "Car"): {    //  уничтожение машины
                    _score = (_BaseScores get "Car_Default") * _coefficient;  // Базовая экспа за машину
                    switch (_slot) do {
                        case "pilot": {
                            _score = (_BaseScores get "Car_pilot") * _coefficient;  // пилот уничтожил машину
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Car_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Car_tankman") * _coefficient;  // танкист уничтожил машину
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Car_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Car_antitank") * _coefficient;  // ПТ/ПВО уничтожил машину
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Car_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        default {   // любой другой уничтожил машину
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Car_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
                case (_killed isKindOf "Tank"): {   //  уничтожение танка
                    _score = (_BaseScores get "Tank_Default") * _coefficient;  // Базовая экспа за танк
                    switch (_slot) do {
                        case "pilot": {
                            _score = (_BaseScores get "Tank_pilot") * _coefficient; // пилот уничтожил танк
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Tank_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Tank_tankman") * _coefficient; // танкист уничтожил танк
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Tank_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Tank_antitank") * _coefficient; // ПТ/ПВО уничтожил танк
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Tank_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        default { // любой другой уничтожил танк
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Tank_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
                case (_killed isKindOf "Helicopter"): {   //  уничтожение вертолета
                    _score = (_BaseScores get "Helicopter_Default") * _coefficient; // Базовая экспа за вертолет
                    switch (_slot) do {
                        case "pilot": {
                            _score = (_BaseScores get "Helicopter_pilot") * _coefficient; // пилот уничтожил вертолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Helicopter_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Helicopter_tankman") * _coefficient; // танкист уничтожил вертолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Helicopter_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Helicopter_antitank") * _coefficient; // ПТ/ПВО уничтожил вертолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Helicopter_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        default { // любой другой уничтожил вертолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Helicopter_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
                case (_killed isKindOf "Plane"): {   //  уничтожение самолета
                    _score = (_BaseScores get "Plane_Default") * _coefficient; // Базовая экспа за самолет
                    switch (_slot) do {
                        case "pilot": {
                            _score = (_BaseScores get "Plane_pilot") * _coefficient; // пилот уничтожил самолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Plane_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Plane_tankman") * _coefficient; // танкист уничтожил самолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Plane_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Plane_antitank") * _coefficient; // ПТ/ПВО уничтожил самолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Plane_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        default { // любой другой уничтожил самолет
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Plane_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
                case (_killed isKindOf "Man"): {   //  уничтожение бота
                    _score = (_BaseScores get "Man_Default") * _coefficient;
                    switch (_slot) do {
                        case "pilot": {
                            _score = (_BaseScores get "Man_pilot") * _coefficient;
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_pilot с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "tankman": {
                            _score = (_BaseScores get "Man_tankman") * _coefficient;
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_tankman с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            {[_x,_score] spawn bt_fnc_addExp;}forEach _crew;
                        };
                        case "antitank": {
                            _score = (_BaseScores get "Man_antitank") * _coefficient;
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_antitank с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        case "medic": {
                            _score = (_BaseScores get "Man_medic") * _coefficient;
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_medic с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        case "engineer": {
                            _score = (_BaseScores get "Man_engineer") * _coefficient;
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_engineer с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                        case "sniper": {
                            _score = (_BaseScores get "Man_sniper_low") * _coefficient;
                            _distance = _killer distance _killed;
                            if (_distance >= (_BaseScores get "Man_sniper_distance")) then {
                                _score = (_BaseScores get "Man_sniper_start") * _coefficient * _distance / (_BaseScores get "Man_sniper_distance");
                                [_killer,_score] spawn bt_fnc_addExp;
                            } else {
                                [_killer,_score] spawn bt_fnc_addExp;
                            };
                            
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_sniper на дистанции %1 с очками %2", _distance, _score ];
                                _textFormat spawn _sendLog;
                            };
                            //Дополнение за офицера и ПТ/ПВО бойца
                            _target  = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "icon");
                            if (_target in _targetIcon) then {
                                _score = (_BaseScores get "Man_sniper_officer") * _coefficient;
                                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                    private _textFormat = format ["Вызван Man_sniper_officer с очками %1", _score ];
                                    _textFormat spawn _sendLog;
                                };
                                [_killer,_score] spawn bt_fnc_addExp;
                            };
                        };
                        case "marksman": {
                            _score = (_BaseScores get "Man_marksman_low") * _coefficient;
                            _distance = _killer distance _killed;
                            if (_distance >= (_BaseScores get "Man_marksman_distance")) then {
                                _score = (_BaseScores get "Man_marksman_start") * _coefficient * _distance / (_BaseScores get "Man_marksman_distance");
                                [_killer,_score] spawn bt_fnc_addExp;
                            } else {
                                [_killer,_score] spawn bt_fnc_addExp;
                            };
                            
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_marksman на дистанции %1 с очками %2", _distance, _score ];
                                _textFormat spawn _sendLog;
                            };
                            //Дополнение за офицера и ПТ/ПВО бойца
                            _target  = getText (configFile >> "CfgVehicles" >> typeOf _killed >> "icon");
                            if (_target in _targetIcon) then {
                                _score = (_BaseScores get "Man_marksman_officer") * _coefficient;
                                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                    private _textFormat = format ["Вызван Man_marksman_officer с очками %1", _score ];
                                    _textFormat spawn _sendLog;
                                };
                                [_killer,_score] spawn bt_fnc_addExp;
                            };
                        };
                        default {
                            if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                                private _textFormat = format ["Вызван Man_Default с очками %1", _score ];
                                _textFormat spawn _sendLog;
                            };
                            [_killer,_score] spawn bt_fnc_addExp;
                        };
                    };
                    if !(_isLeader) then {  //  командиру группы
                        [_leader,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    }; 
                    if !(_isnsh) then { //  Начальнику штаба
                        [_nsh,_score * (_BaseScores get "coefficient_сommander") ] spawn bt_fnc_addExp;
                    };
                };
            };


        };
    };
    case "engineer_veh":{
        _args params ["_type", "_player", "_amount"];
        private _amountN = 1;
        if (typeName _amount == "STRING" ) then {_amountN = parseNumber _amount;} else {_amountN = _amount;};
        private _coefficient = 1;
        //  Надбавки за усложнения
        _coefficient = _coefficient call _CoeffDifficulty;
        private _localAmount = 0.1; 
        
        _localAmount = _amountN * 10;
        private _score = 0;
        switch (_type) do {
            case "reapir": {
                _score = (_BaseScores get "engineer_veh_reapir") * _localAmount * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван engineer_veh_reapir с очками %1 за восстановление %2 % прочности", _score, (_amountN * 100) toFixed 0];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "refuel": {
                _score = (_BaseScores get "engineer_veh_refuel") * _localAmount * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван engineer_veh_refuel с очками %1 за заправку %2 % топлива", _score, (_amountN * 100) toFixed 0 ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            case "rearm": {
                _score = (_BaseScores get "engineer_veh_rearm") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван engineer_veh_rearm с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
            default { // неизвестный вызов по медицине
                _score = (_BaseScores get "engineer_veh_default") * _coefficient;
                if (missionNamespace getVariable ["#DEBUGLOG_eventScore", false]) then {
                    private _textFormat = format ["Вызван engineer_veh_default с очками %1", _score ];
                    _textFormat spawn _sendLog;
                };
                [_player, _score] spawn bt_fnc_addExp;
            };
        };
    };
};



















