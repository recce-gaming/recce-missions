/*
	Description:
	Wakes up the given man and makes him ready for combat. Should be executed where the
	man is local.

	Parameter(s):
	0: OBJECT - Man to wake up

	Returns:
	Nothing
*/
params ["_man"];

_man remoteExec ["BIS_fnc_ambientAnim__terminate", 0, false];
_man setDir ((getDir _man) + 180);  // Sleeping animation was backwards.
_man switchMove "amovppnemstpsraswrfldnon";
_man setBehaviour "AWARE";
_man enableAI "CHECKVISIBLE";
