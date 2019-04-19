/*
	Description:
	Begin tasks to classify object, initialize men and monitor triggers.
	
	Usage:
	Place a game logic, sleeping bags (or any other object), men to sleep in them and
	triggers to wake them up and sync all of those to the game logic. Then in the game
	logic call this function in it's init with:
	    nul = [this] call teamSleep_fnc_init;
	Note that if there are too few beds, then the remaining men will just sleep on the
	ground.

	Parameter(s):
	0: OBJECT - The object that all men, triggers and beds are synced to.

	Returns:
	Nothing
*/
if !(isServer) exitWith {};
_this spawn {
	params ["_logic"];
	waitUntil {time > 3};  // For safety.
	(
		[synchronizedObjects _logic] call teamSleep_fnc_classifyObjects
	) params ["_men", "_beds", "_triggers"];
	{
		(
			[_x, _beds] call teamSleep_fnc_claimNearestBed
		) params ["_bed", "_remaining_beds"];
		[_x, _bed] remoteExec ["teamSleep_fnc_sleepAtBed", _x];
		_beds = _remaining_beds;
	} forEach _men;
	[_men, _triggers] call teamSleep_fnc_monitorLoop
};
