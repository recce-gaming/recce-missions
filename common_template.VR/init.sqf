// Adjust respawn via tickets here (1 means no respawn, as in 1 life)
[player, 1] call BIS_fnc_respawnTickets;  // https://community.bistudio.com/wiki/BIS_fnc_respawnTickets

//// Process ZAMF init
[
// Remove any of these strings to disable a feature. All of these must be in lowercase but can be in any order.

"disable_playable_ai",       // Makes the AI that takes a player slot effectively vacant (wont do anything).
"disable_playable_ai_speak", // Prevent the avatar that the player controls from shouting in game.
//"leave_group",             // Makes the player leave whatever group he/she starts in and join a new one alone.
//"spectate_on_death",       // As soon as a player dies, he/she spectates (even if respawn is enabled).
"zam_res",                   // Enable ZAM Resume.
"disable_chat_channels"      // Disables chat channels. Used here instead of description to allow them in map screen.

] call ZAMF_fnc_init;


//// Recce specific
[] execVM "recce\disable_jip_respawn.sqf";
[] execVM "recce\log_difficulty.sqf";
[] execVM "recce\log_killed.sqf";

//// Youre code here
