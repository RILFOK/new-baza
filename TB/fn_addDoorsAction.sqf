/*
Author: ToxaBes
Description: add doors actions for vehicles
*/
_veh = _this select 0;

switch (typeOf _veh) do { 
    //case "B_T_VTOL_01_infantry_F";
    //case "B_T_VTOL_01_armed_F";
	case "B_T_VTOL_01_vehicle_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть рампу</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_1_source",1]; 
                _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть рампу</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_1_source",0];  
                _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    }; 
	case "rhs_bmp2k_msv" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть кормовые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["DoorL",1];
                _target animateDoor ["DoorR",1];
                _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть кормовые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["DoorL",0];
                _target animateDoor ["DoorR",0];
                _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    //case "rhsgref_BRDM2_ATGM_vmf";
    //case "rhsgref_BRDM2_HQ_vmf" : {
    //    [_veh,  
    //    [ 
    //        "<t color='#FE2E2E'>Открыть борт</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //            _target animateSource ["back_door",1];
    //            _target setVariable ["Door", true, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && !(_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true]; 
    //     
    //    [_veh,  
    //    [ 
    //        "<t color='#40FF00'>Закрыть борт</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //            _target animateSource ["back_door",0];
    //            _target setVariable ["Door", false, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && (_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true];
    //};
    case "rhsgref_un_m1117": {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть боковые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["door_r",1];
                 _target animateDoor ["door_l",1];
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть боковые двери</t>",
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["door_r",0];
                 _target animateDoor ["door_l",0];
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "rhsgref_un_btr70";
    case "rhs_btr80a_msv";
    case "rhs_btr80_msv" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть бортовые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["r_door",1];
                 _target animateDoor ["l_door",1];
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть бортовые двери</t>",
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["r_door",0];
                 _target animateDoor ["l_door",0];
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "I_APC_Wheeled_03_cannon_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Развернуть волнорез</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["BreakWater",1, 1]; 
                 _target setVariable ["BreakWater", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['BreakWater', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Свернуть волнорез</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["BreakWater",0, 1];  
                 _target setVariable ["BreakWater", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['BreakWater', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "O_T_MRAP_02_hmg_ghex_F";
    case "O_MRAP_02_gmg_F";
    case "O_MRAP_02_hmg_F";
    case "O_T_MRAP_02_ghex_F";
    case "O_T_MRAP_02_gmg_ghex_F";
    case "O_MRAP_02_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_LM" ,1]; 
                 _target animateDoor ["Door_RM",1];
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_LM" ,0]; 
                 _target animateDoor ["Door_RM",0];
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "O_Heli_Attack_02_dynamicLoadout_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_L",1]; 
                 _target animateDoor ["Door_R",1];
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_L",0]; 
                 _target animateDoor ["Door_R",0];
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    //case "rhs_kamaz5350_msv" : {
    //    [_veh,  
    //    [ 
    //        "<t color='#FE2E2E'>Открыть борт</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //             _target animateDoor ["back_door",1];
    //             _target setVariable ["Door", true, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && !(_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true]; 
    //     
    //    [_veh,  
    //    [ 
    //        "<t color='#40FF00'>Закрыть борт</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //             _target animateDoor ["back_door",0];
    //             _target setVariable ["Door", false, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && (_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true];
    //};
    case "C_Heli_Light_01_civil_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"];  
                 _target animateSource ['DoorL_Back_Open', 1];
                 _target animateSource ['DoorR_Back_Open', 1];
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh, 
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ['DoorL_Back_Open', 0];
                 _target animateSource ['DoorR_Back_Open', 0];
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "C_IDAP_Heli_Transport_02_F";
    case "I_Heli_Transport_02_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_Back_L",1]; 
                 _target animateDoor ["Door_Back_R",1]; 
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateDoor ["Door_Back_L",0]; 
                 _target animateDoor ["Door_Back_R",0]; 
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "B_G_Offroad_01_repair_F";
    case "B_GEN_Offroad_01_gen_F";
    case "O_G_Offroad_01_repair_F";
    case "I_G_Offroad_01_repair_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["Doors",1]; 
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["Doors",0];  
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
    case "O_Heli_Light_02_unarmed_F";
    case "O_Heli_Light_02_dynamicLoadout_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["Doors",1]; 
                 _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                 _target animateSource ["Doors",0];  
                 _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];

    };
    //case "rhs_kamaz5350_msv";
    //case "RHS_Ural_MSV_01";
    //case "rhs_zil131_msv" : {
    //    [_veh,  
    //    [ 
    //        "<t color='#FE2E2E'>Открыть двери</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //            _target animateDoor ["Door_LF",1];
    //            _target animateDoor ["Door_RF",1];
    //            _target setVariable ["Door", true, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && !(_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true];
    //     
    //    [_veh,  
    //    [ 
    //        "<t color='#40FF00'>Закрыть двери</t>",  
    //        { 
    //            params ["_target", "_caller", "_actionId", "_arguments"]; 
    //            _target animateDoor ["Door_LF",0];
    //            _target animateDoor ["Door_RF",0];
    //            _target setVariable ["Door", false, true]; 
    //        }, 
    //        [], 
    //        1.5,  
    //        true,  
    //        true,  
    //        "", 
    //        "(_this == driver _target) && (_target getVariable ['Door', false])", 
    //        50, 
    //        false 
    //    ]] remoteExec ["addAction", 0, true];
    //};
    case "O_Heli_Transport_04_medevac_F": {
    [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть боковую дверь</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_4_source",1]; 
                _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть боковую дверь</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_4_source",0];  
                _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];

    [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть рампу</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_6_source",1]; 
                _target setVariable ["Door2", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door2', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть рампу</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_6_source",0];  
                _target setVariable ["Door2", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door2', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];

    };
    case "O_Heli_Transport_04_covered_F" : {
        [_veh,  
        [ 
            "<t color='#FE2E2E'>Открыть боковые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_4_source",1];
                _target animateDoor ["Door_5_source",1]; 
                _target setVariable ["Door", true, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && !(_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
         
        [_veh,  
        [ 
            "<t color='#40FF00'>Закрыть боковые двери</t>",  
            { 
                params ["_target", "_caller", "_actionId", "_arguments"]; 
                _target animateDoor ["Door_4_source",0]; 
                _target animateDoor ["Door_5_source",0];  
                _target setVariable ["Door", false, true]; 
            }, 
            [], 
            1.5,  
            true,  
            true,  
            "", 
            "(_this == driver _target) && (_target getVariable ['Door', false])", 
            50, 
            false 
        ]] remoteExec ["addAction", 0, true];
    };
	default { }; 
};
