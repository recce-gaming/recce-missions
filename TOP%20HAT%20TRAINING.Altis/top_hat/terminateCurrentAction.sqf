/*
	Description:
	Terminate whatever special mission action that the given unit is currentlyh
	performing, thus preparing it for other actions.

	Parameter(s):
	0: OBJECT - Unit to prepare for future actions.

	Returns:
	Nothing
*/
params ["_engineer"];

private _current_action = _engineer getVariable ["current_action", ""];

if (count (units _engineer) > 1) then {
	private _group = createGroup (side _engineer);
	[_engineer] join _group;
	_group deleteGroupWhenEmpty true;
} else {
	{deleteWaypoint _x} forEach (waypoints (group _engineer));
};

_engineer setUnitPos "UP";
(group _engineer) setCombatMode "BLUE";
(group _engineer) setBehaviour "CARELESS";
(group _engineer) setSpeedMode "FULL";
_engineer disableAI "FSM";
_engineer disableAI "AUTOCOMBAT";
_engineer disableAI "AUTOTARGET";

switch (_current_action) do {
	case "working" : {
		_engineer call BIS_fnc_ambientAnim__terminate;
		_engineer playMoveNow "";
		_engineer switchMove "";  // To try and make sure
		[_engineer] allowGetIn true;
	};
	case "in_cover" : {
		_engineer stop false;
		[_engineer] allowGetIn true;
	};
};

_engineer setVariable ["current_action", "nothing", true];
