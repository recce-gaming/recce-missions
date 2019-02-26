/*
	Description:
	Makes given unit (assuming a man) take cover (simulates forces to stay in cover) at
	the unit's stored position for cover. A teleport position is also added for tricky
	bunkers, which will be used after the cover position is reached.

	Parameter(s):
	0: OBJECT - Unit to go take cover.

	Returns:
	Nothing
*/
params ["_engineer"];

[_engineer] call topHat_fnc_terminateCurrentAction;

_engineer setVariable ["current_action", "taking_cover", true];
[_engineer] allowGetIn false;
private _group = group _engineer;
private _spot_cover = _engineer getVariable "spot_cover";
_group move _spot_cover;
[_engineer, _spot_cover] call topHat_fnc_waitForArrival;
if (_engineer getVariable ["current_action", ""] != "taking_cover") exitWith {};
_engineer setUnitPos "DOWN";
_engineer stop true;
sleep 2.75;  // Make transition smoother
_engineer setPosATL (_engineer getVariable "spot_teleport");  // To get into tricky bunker

_engineer setVariable ["current_action", "in_cover", true];
