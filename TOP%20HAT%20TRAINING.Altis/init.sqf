nul = [] spawn {
    waitUntil {time > 10};
    setViewDistance 4000;
    setObjectViewDistance 4000;
};
[] spawn {
    if (hasInterface) then {
        waitUntil {sleep 0.1; (time > 5) and !(isNull player)};
        if (!(isNil "CommandingOfficer") and {player == CommandingOfficer}) then {
            [] execVM "module_chatIntercept\init.sqf";
        };
    };
};

ARTY_MAG = "CUP_30Rnd_122mmHE_D30_M";
ARTY = FoxBat1;
ARTY_CALLSIGN = "Haymaker";
ARTY_ERROR_RADIUS = 50;

[] execVM "disable_jip_respawn.sqf";
[] execVM "log_difficulty.sqf";
