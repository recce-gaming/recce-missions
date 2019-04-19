/*
	Author: Phoenix of Zulu-Alpha

	Description:
		To prevent people from circumventing the effective no respawn by using the jip 
		system (exiting and rejoining after dying).

	Params:
		0 : OBJECT - The player to give options to.

	Returns:
		Nothing
*/

if (isServer) then {
	killed_player_ids = [];
	publicVariable "killed_player_ids";
};

if (hasInterface) then {
	player addEventHandler [
		"killed", {
			if !((getPlayerUID player) in killed_player_ids) then {
				killed_player_ids set [count killed_player_ids, getPlayerUID player];
				publicVariable "killed_player_ids";
			};
		}
	];
};
