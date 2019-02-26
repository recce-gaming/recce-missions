/*
	Description:
	Flys the given object (presumed to be a chopper) to the given object (presumed to be a
	helipad) and lands it there by creating waypoints. Should be executed where unit is
	local.

	Parameter(s):
	0: OBJECT - Unit to land at marker
	1: OBJECT - Helipad.
	2: BOOL - Whether or not to keep the engine on after landing.

	Returns:
	Nothing
*/
params ["_chopper", "_lz", "_keepEngineOn"];
if !(local _chopper) exitWith {};

private _grp = group _chopper;
// Make sure there are no old waypoints
{deleteWaypoint _x} forEach (waypoints _grp);
// Land at LZ
_grp move (position _lz);
waituntil {
	sleep 1;
	(alive _chopper) and {unitReady _chopper}
};
_chopper land "LAND";

if (_keepEngineOn) then {
	waitUntil {
		sleep 1;
		(alive _chopper) and {isTouchingGround _chopper} and {unitReady _chopper}
	};
	_chopper engineOn true;
};
