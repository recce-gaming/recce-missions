/*
	Description:
	Get an array containing all engineers that don't currently have any of the given
	current actions and that are within a certain distance from the given player.

	Parameter(s):
	0: ARRAY - Array of strings of current_action variables to exclude based on.
	1: OBJECT - Player to get distance from.
	2: NUMBER - Distance from the player that enginners must be within.

	Returns:
	ARRAY - Array of objects representing engineers.
*/
params ["_filter_actions", "_player", "_distance"];

private _engineers = [];
{
	private _current_action = _x getVariable ["current_action", ""];

	if (
		("is_engineer" in (allVariables _x)) and
		{!(_current_action in _filter_actions)} and
		{(_player distance _x) <= _distance}
	) then {
		_engineers pushBackUnique _x;
	};
} forEach allUnits;

_engineers