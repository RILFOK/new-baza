if(!local player) exitWith {};

private _datapoint = Gamer getVariable ["datapoint",[]];

if(_datapoint isEqualTo []) exitWith {};

_bash1 = missionNamespace getVariable "Bash111";
_bash2 = missionNamespace getVariable "Bash222";
_bash3 = missionNamespace getVariable "Bash333";

_localb1 = missionNamespace getVariable "LocalB1";
_localb2 = missionNamespace getVariable "LocalB2";
_localb3 = missionNamespace getVariable "LocalB3";
_datapoint params ["_Point","_NamePoint"];
private ["_task","_task1","_task2","_task3","_doptask","_taskG1"]; 

if (side (group player) == EAST) then
{
    _task = player createSimpleTask [_Point];
    _task setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1",_NamePoint],format[localize "STR_CONF_NEWTASK2",_NamePoint],localize "STR_CONF_NEWTASK3"];
    _task setSimpleTaskDestination getMarkerPos _Point;
    _task setTaskState "Assigned";
    _task setSimpleTaskType "attack";

    if (_bash1 == 0) then {
        _task1 = player createSimpleTask ["MarkerBash1",_task];
        _task1 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_1",_NamePoint],format[localize "STR_CONF_NEWTASK2_1",_NamePoint],localize "STR_CONF_NEWTASK3_1"];
        _task1 setSimpleTaskDestination getMarkerPos _Point;
        //_task1 setTaskState "Assigned";
        _task1 setSimpleTaskType "destroy";
        missionnamespace setVariable ["task1",_task1];
    };

    if (_bash2 == 0) then {
        _task2 = player createSimpleTask ["MarkerBash2",_task];
        _task2 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_2",_NamePoint],format[localize "STR_CONF_NEWTASK2_2",_NamePoint],localize "STR_CONF_NEWTASK3_2"];
        _task2 setSimpleTaskDestination getMarkerPos _Point;
        //_task2 setTaskState "Assigned";
        _task2 setSimpleTaskType "destroy";
        missionnamespace setVariable ["task2",_task2];
    };

    if (_bash3 == 0) then {
        _task3 = player createSimpleTask ["MarkerBash3",_task];
        _task3 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_3",_NamePoint],format[localize "STR_CONF_NEWTASK2_3",_NamePoint],localize "STR_CONF_NEWTASK3_3"];
        _task3 setSimpleTaskDestination getMarkerPos _Point;
        //_task3 setTaskState "Assigned";
        _task3 setSimpleTaskType "destroy";
        missionnamespace setVariable ["task3",_task3];
    };

    //Доп задача

    waitUntil{sleep 1; (missionNameSpace getvariable ["_dop_radar_pos1",""]) isNotEqualTo ""};

    if ((missionNameSpace getvariable ["_sidemission_hn_type",1]) == 1) then {

        _doptask = player createSimpleTask ["Дополнительная задача"];
        _doptask setsimpletaskdescription [
            "Взломайте и отключите радар, чтобы скрыть боевые самолеты сил UTF от вражеской авиации, тем самым обеспечив преимущество в воздухе. Чтобы отключить радар, двум любым бойцам с ремонтными наборами нужно подойти к радару и одновременно зажать кнопки питания.",
        "Отключите радар","Отключите радар"];
        _doptask setSimpleTaskDestination (missionNameSpace getvariable "_dop_radar_pos1");
        _doptask setSimpleTaskType "destroy";
        missionnamespace setVariable ["_dop_task4",_doptask];

    } else {
        _doptask = player createSimpleTask ["Дополнительная задача"];
        _doptask setsimpletaskdescription [
        "Враг пытается развернуть и подключить новейший радар к своей системе ПВО. Зачистите периметр и остановите процесс подключения. Для остановки развертывания радар, двум любым бойцам с ремонтными наборами нужно подойти к радару и одновременно зажать кнопки питания.",
        "Остановите развертывание радара","Остановите развертывание радара"];
        _doptask setSimpleTaskDestination (missionNameSpace getvariable "_dop_radar_pos1");
        _doptask setSimpleTaskType "destroy";
        missionnamespace setVariable ["_dop_task4",_doptask];
    };

    player setCurrentTask _task;

    ["TaskAssigned",["","Отключите радар"]]call BIS_fnc_showNotification;
    ["TaskAssigned",["",format [localize "STR_CONF_NEWTASK4",_NamePoint]]]call BIS_fnc_showNotification;

    missionnamespace setVariable ["task",_task];
    
    
    
    
}
else
{
    _taskG1 = player createSimpleTask ["MarkerBash4"];
    _taskG1 setsimpletaskdescription [format[localize "STR_CONF_NEWTASK1_G1",_NamePoint],format[localize "STR_CONF_NEWTASK2_G1",_NamePoint],localize "STR_CONF_NEWTASK3_G1"];
    _taskG1 setSimpleTaskDestination getMarkerPos _Point;
    _taskG1 setTaskState "Assigned";
    _taskG1 setSimpleTaskType "download";

    player setCurrentTask _taskG1;
    ["TaskAssigned",["",format [localize "STR_CONF_NEWTASK4_G1",_NamePoint]]]call BIS_fnc_showNotification;

    missionnamespace setVariable ["taskG1",_taskG1];
};