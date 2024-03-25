if(!local player) exitWith {};

if(player getVariable "SaveInventory") then
{
  [player] call srv_fnc_loadInventory;
}else{
    switch true do {
	    case (VANILAPODKL):{[player] call srv_fnc_DefaultLoadOut_a};
    };  
};
