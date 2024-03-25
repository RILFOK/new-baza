/*
Author: ToxaBes
Description: create radio channels
*/
if (isServer) then {
    OPERATIVE_RADIO_CHANNEL = radioChannelCreate [[0.58,0,0.827,1], "Оперативный канал (ЦУП)", "%UNIT_NAME", []];
    COMMAND_RADIO_CHANNEL = radioChannelCreate [[0.988,0.337,0.01,1], "Командный канал (наземка)", "%UNIT_NAME", []];
    RP_RADIO_CHANNEL = radioChannelCreate [[1,0,0,1], "РП канал", "%UNIT_NAME", []];
    publicVariable "OPERATIVE_RADIO_CHANNEL";
    publicVariable "COMMAND_RADIO_CHANNEL";
    publicVariable "RP_RADIO_CHANNEL";
};

if (!isDedicated) then {
    [] spawn {
        waitUntil {!isNull player};
        waitUntil {player == player};
        waitUntil {!isNil "OPERATIVE_RADIO_CHANNEL"};
        _type = typeOf player;
        OPERATIVE_RADIO_CHANNEL radioChannelRemove [player];
        COMMAND_RADIO_CHANNEL radioChannelRemove [player]; 
        RP_RADIO_CHANNEL radioChannelRemove [player];  
        while {true} do {   	
            if (side player == EAST) then {             
                if (_type == "O_T_Medic_F" || _type == "O_helipilot_F" || _type == "O_T_Pilot_F") then {
                    OPERATIVE_RADIO_CHANNEL radioChannelAdd [player];
                    COMMAND_RADIO_CHANNEL radioChannelRemove [player];
                } else {
                    if (leader (group player) == player) then {                 	
                        OPERATIVE_RADIO_CHANNEL radioChannelAdd [player];
                        COMMAND_RADIO_CHANNEL radioChannelAdd [player];          
                    } else {                
                        OPERATIVE_RADIO_CHANNEL radioChannelRemove [player];
                        COMMAND_RADIO_CHANNEL radioChannelRemove [player];  
                    };                  
                };  
            } else {
                OPERATIVE_RADIO_CHANNEL radioChannelRemove [player];
                COMMAND_RADIO_CHANNEL radioChannelRemove [player];  
            };
            //Blue RP Channel Banned
            if (side player != west) then {
            if (leader (group player) == player || side player == independent) then {
                RP_RADIO_CHANNEL radiochannelAdd [player];
            } else {
                RP_RADIO_CHANNEL radioChannelRemove [player];   
            };
            };
            sleep 3;
        };
    };
};