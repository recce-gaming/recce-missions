/*
	Description:
	Sends the given man to sleep at the given bed.
	This should be executed where the unit is local.

	Parameter(s):
	0: OBJECT - Man to send to sleep.
	1: OBJECT - Bed object to go to.

	Returns:
	Nothing
*/
params ["_man", "_bed"];

_man doMove (getPos _bed);

_this spawn {
	params ["_man", "_bed"];
	waitUntil {unitReady _man};
	_man setBehaviour "CARELESS";
	_man disableAI "CHECKVISIBLE";
	_man setPos (getPos _bed);
	_man setDir ((getDir _bed) + 180);   // Sleeping animation is backwards.
	[_man, "PRONE_INJURED", "FULL"] remoteExec ["BIS_fnc_ambientAnim", 0, false];
};
