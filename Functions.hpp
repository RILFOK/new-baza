class srv
{	
	tag = "srv";


    class server_function {
		file = "server\function";
		class bk {};
		class delgr {};
		class stamina {};
		class disstamina {};
		class InitStart {PreInit = 1;};
		class reinforcementsSpawnPoint {};
        class findSafePos {};
		class KKisFlatEmpty {};
		class findEmptyPos {};
		class InfantryTasckPatrol {};
        class taskPatrol {};
		class searchSpawnPos {};
		class HandleDamage {};		
		class deletedeadman {};
		class DeleteWreckVehicle {};
        class DeleteAttachedObjCargo {};
		class getValue {};
		class fset_AISkill {};
		class createenemyunit {};
		class createenemyvehicle {};
		class createenemyvehiclecsat {};
		class PlayerConnected {};
		class playerdisconnected {};
		class createname {};
		class setVehicleName {};
		class minefield {};
		class nvgoggles {};
		class createMinefieldPoint {};
		class rearmbot {};
		class checkfuel {};
		class recongroup {};
		class getconfiggroup {};
		class reconPatrol {};
		class spawnrecongroup {};
		class deadreconunit {};
		class nearshore {};
		class addWaypoint {};
		class rptr {};
		class deletebasevert {};
		class createPlayerBox {};
		class numberfor {};
		class MoveBaseToPoint {};
		class addactionflag {};
		class holdactionbash {};
		class zeusaddobjects {};
		class veh_hn_respawn {};
		class veh_handle_respawn {};
		class addlocalhandler {};
		class veh_hn_delete {};
		class AIenemydetected{}; // для арты
	};

	class server_function_HC_handle {
		file = "server\Point\HC";
		class spawnAIpoint {};
		class spawnAIrec {};
		class spawnAIreinfor {};
		class spawnAIside {};
		class spawnAIartydefence {};
	}; 

	class server_function_arty {
		file = "server\point\Arty";
		class artPos {};
		class fireScorcher {};
	};

	class server_function_tr_hn {
		file = "server\function\tr_hn_button";
		class tr_hn_handle {};
	};

    class server_Point {
        file = "server\Point";
        class createPoint {};
        class DefencePoint {};
        class createenemyairCycle {};
        class enemyairCycle {};
        class createenemyairCycleAA {};
        class enemyairCycleAA {};
        class Paras {};
		class Parascsat {};
		class Parasgosta {};
		class Parasgostacsat {};
        class createenemyair {};
        class enemyair {};
		class desant1 {};
		class desantcsat {};
		class desantgosta1 {};
		class desantgostacsat {};
        class Spr_cobra {};
		class Spr_cobracsat {};
        class ReinforcePatrol {};
        class ReinforPoint {};
		class ReinforPointCSAT {};
		class ReinforPointBash {};
        class ReinforVehicle {};
		class ReinforVehiclecsat {};
		class ReinforAir {};
        class TransitionPoint {};
		class event {};
		class Revengecobra {};
		class createsidemission {};
	};
    class server_Point_Radio_Bash {
        file = "server\Point\Bash";
		class createBash {};
		class createBash2 {};
		class createBash3 {};
		class createManBash {};
        class createManForGunBash {};
        class createMineBash {};
        class createVehBash {};
		class defenceBash {};
		class minedBash {};
        class naearPosBash {};
        class placeEXPBash {};
		class destroyBash {};
		class createUkrep {};
    };		
	class client_FAQ {
		file = "client\FAQ";
        class diary {};
    };
	class client_function {
		file = "client\function";
		class respawn {};
		class respawnrp {};
	};

    class client_scripts {
		file = "client\scripts";
        class DefaultLoadOut_a {};
		class DefaultLoadOut_rp {};
		class gearload {};
		class NewTask {};
		class noarsenalkey {};
		class TaskDone {};
		class TaskDone1 {};
		class TaskDone2 {};
		class TaskDone3 {};
		class TaskDoneG1 {};
		class TaskNotDoneG1 {};
		class variableDefaultLoadOut {};
		class variableDefaultLoadOutrp {};
	};
	class FPS {
        file = "FPS";
        class init_fps {};
        class missionfps {};
    };	
};


class blue
	{
		tag = "blu";
		class blue
		{
			file = "server\function\blue";
			class condition {};
			class createTeleport {};
			class createTeleportSecond {};
			class dzoneil {};
			class deadZone{};
			class preventTK{};
			class artyblu{};
		};
	};	
	

class BT
{
	tag = "BT";

	class functions
	{
		file = "BT_GUI\functions";
		class playerSpawn {};
		class main_menu {};
		class green {};
		class delo {};
		class ierarh {};
		class info {};
	};

	class DB
	{
		file = "client";
		class ToQu {};
	};

	class level
	{
		file = "levels";
		class addExp {};
		class addScore {};
		class eventScore {};
		class getExpNeed {};
		class getZvanie {};
		class levels {};
	};

	class s_player
	{
		file = "s_player\BT_func";
		class check_pilot {};
		class zvanie {};
		class enablejetdynsim {};
	};

	class level_up
	{
		file = "s_player\BT_func\level_up";
		class time_in_sky {};
		class time_in_veh {};
	};
	
	class adminka
	{
		file = "s_player\BT_func\adminka";
		class adminka {};	
		class adm_main_menu {};	
		class adm_specmission {};
		class specmission_call_db {};
		class spec_save_db {};
		class kick_menu {};
	};
};

class BT_GUI
{
	tag = "bt_gui";

	class circleMenu
	{
		file = "BT_GUI\circleMenu";
		class circleMenuOpen {};
	};
	class progressBar
	{
		file = "BT_GUI\progressBar";
		class init {};
	};
};

class playerData
{
	tag = "bt_pdata";

	class pData
	{
		file = "s_player";
		class playerGetData {};
	};
};

class BT_ADMINMENU
{
	tag = "bt_admin";

	class adminMenu 
	{
		file = "BT_GUI\adminMenu";
		class adminInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
	};
};

class BT_AVIAMENU
{
	tag = "bt_avia";

	class aviaMenu 
	{
		file = "BT_GUI\aviaMenu";
		class aviaInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
		class cam {};
	};
};

class BT_TANKMENU
{
	tag = "bt_tank";

	class tankMenu 
	{
		file = "BT_GUI\tankMenu";
		class tankInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
	};
};

class BT_GREENMENU
{
	tag = "bt_green";

	class greenMenu 
	{
		file = "BT_GUI\greenMenu";
		class greenInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
	};
};

class BT_LEVELMENU
{
	tag = "bt_level";

	class levelMenu 
	{
		file = "BT_GUI\levelMenu";
		class levelInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
		class expButtonPlus {};
		class expButtonMinus {};
		class changeButton {};
	};
};

class BT_KICKMENU
{
	tag = "bt_kick";

	class kickMenu 
	{
		file = "BT_GUI\kickMenu";
		class kickInit {};
		class comboChange {};
		class listChange {};
		class checkChange {};
		class kickButton {};
	};
};

class BT_ANIMMENU
{
	tag = "bt_anim";

	class animMenu 
	{
		file = "BT_GUI\animMenu";
		class animInit {};
		class comboChange {};
		class animPlay {};
	};
};

class BT_KMBMENU
{
	tag = "bt_kmenu";

	class kmbMenu 
	{
		file = "BT_GUI\kmbMenu";
		class kmbMenuInit {};
		class comboChange {};
		class kmbMenuButton {};
	};
};

class BT_MEDALMENU
{
	tag = "bt_medal";

	class medalMenu
	{
		file = "BT_GUI\medalMenu";
		class medalButton {};
		class medalInit {};
		class comboChange1 {};
		class checkChange1 {};
	};
};

class BT_MEDALPLAYER
{
	tag = "bt_medalPlayer";

	class medalPlayer
	{
		file = "BT_GUI\medalPlayer";
		class medalInit1 {};
		class backButton {};
		class medalPlayerButton {};
		class giveButton {};
		class takeButton {};
		class info {};
	}
};
class CUSTOM_SERVICE
{
	tag = "custom_service";
	class service
	{
		file = "server\function\service";
		class vehserviceload {};
		class vehservicescript {};
		class vehserviceadd {};
		class vehservicerearm {};
	};
};
class PYLON_MANAGER
{
	tag = "pylon_manager";
	class pylon_manager
	{
		file = "server\function\pylonmanager";
		class pylonmanageradd {};
		class pylonmanagercheck {};
		class pylonmanagerscript {};
		class pylonmanagerload {};
	}
};

class ANTI_BTV
{
	tag = "anti_btv";
	class anti_btv
	{
		file = "server\function\antiBTV";
		class createShip {};
		class tankload {};
		class tankCount {};
	}
};
class APS
{
	tag = "aps";
	class aps
	{
		file = "server\function\APS";
		class attachaps {};
		class apscycle {};
		class aps_enable {};
	}
};