private _player = _this # 0;
_playerType = typeOF _player;

//===================================OPFOR===============================
_opGroundTroops = [
    "O_engineer_F",
    "O_medic_F",
    "O_G_medic_F",
    "O_soldier_M_F",
    "O_Soldier_F",
    "O_Soldier_AR_F",
    "O_Sharpshooter_F",
    "O_Soldier_AA_F",
    "O_Soldier_LAT_F"
    ];    
_opPilots = [
    "O_T_Medic_F",
    "O_helipilot_F",
    "O_T_Pilot_F"
];
_opTankMan = [
    "O_soldierU_medic_F",
    "O_soldierU_repair_F"
];
//==========================================================================

uiSleep 1;
if (side player == east) then {
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeHeadgear player;
    removeGoggles player;

    player linkItem "ItemMap";
    player linkItem "ItemCompass";
    player linkItem "ItemWatch";
    player linkItem "ItemRadio";
    player linkItem "ItemGPS";

    switch true do {
    case (_playerType in _opGroundTroops):{
        //снаряга пехоты
        player forceAddUniform "U_I_CombatUniform_shortsleeve";
        player addHeadgear "H_Cap_blk_Raven";
        };
    case (_playerType in _opPilots):{
         //снаряга пилотов
        player forceAddUniform "U_I_pilotCoveralls";
        player addHeadgear "H_Cap_blk";
        };
    case (_playerType in _opTankMan):{
        //снаряга танкистов
        player forceAddUniform "U_I_CombatUniform";
        player addVest "V_TacVest_oli";
        player addHeadgear "H_Watchcap_camo";
        };
    };

};