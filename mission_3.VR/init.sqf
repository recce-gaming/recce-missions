nul = [] spawn {
    waitUntil {time > 10};
    setViewDistance 4000;
    setObjectViewDistance 4000;
};

[] execVM "recce\disable_jip_respawn.sqf";
[] execVM "recce\log_difficulty.sqf";
[] execVM "recce\log_killed.sqf";

// Date and time Parameters
[
    -1,
    -1,
    "hour" call BIS_fnc_getParamValue,
    "minute" call BIS_fnc_getParamValue
]  call zamf_fnc_setDateTime;
