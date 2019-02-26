/*
	Description:
	Have the given unit join the given group

	Parameter(s):
	0: OBJECT - Engineer that needs to join to a group.
	1: GROUP - Group to join.

	Returns:
	Nothing
*/
params ["_engineer", "_group"];

[_engineer] call topHat_fnc_terminateCurrentAction;
[_engineer] join _group;

_engineer setVariable ["current_action", "joined_player", true];
