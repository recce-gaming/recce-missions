nul = [] spawn {
    waitUntil {time > 10};
    setViewDistance 4000;
    setObjectViewDistance 4000;
};

[] execVM "recce\disable_jip_respawn.sqf";
[] execVM "recce\log_difficulty.sqf";
[] execVM "recce\log_killed.sqf";
// BRV: tS AAR Logger
enableSaving [false, false]; 
[] execVM "dzn_brv\dzn_brv_init.sqf";

// Date and time Parameters
/*
[
    "month" call BIS_fnc_getParamValue,
    "day" call BIS_fnc_getParamValue,
    "hour" call BIS_fnc_getParamValue,
    "minute" call BIS_fnc_getParamValue
]  call zamf_fnc_setDateTime;
*/
