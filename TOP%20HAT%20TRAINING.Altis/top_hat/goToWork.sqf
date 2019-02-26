/*
	Description:
	Makes given unit (assuming a man) go to work (simulates working on something with an
	animation) at the unit's stored position for cover.

	Parameter(s):
	0: OBJECT - Unit to go to work.

	Returns:
	Nothing
*/
params ["_engineer"];

[_engineer] call topHat_fnc_terminateCurrentAction;

_engineer setVariable ["current_action", "going_to_work", true];
[_engineer] allowGetIn false;
private _group = group _engineer;
private _spot_work = _engineer getVariable "spot_work";
_group move _spot_work;
[_engineer, _spot_work] call topHat_fnc_waitForArrival;
if (_engineer getVariable ["current_action", ""] != "going_to_work") exitWith {};
[_engineer, "KNEEL_TREAT", "FULL"] call BIS_fnc_ambientAnim;

_engineer setVariable ["current_action", "working", true];
