/*
	Description:
	Adds an action to the given unit (presumed chopper) then when activated makes the
	chopper fly to and land at the given helipad. This action is only visible when the
	chopper is outside of the given distance of the given helipad.

	Parameter(s):
	0: OBJECT - Unit to add the addaction to.
	1: OBJECT - Helipad to land at.
	2: STRING - Text to use in addaction
	3: NUMBER - Distance the choper must be past in meters for the action to be valid.
	2: BOOL - Whether or not to keep the engine on after landing.

	Returns:
	Nothing
*/
params ["_chopper", "_lz", "_prompt", "_min_distance", "_keepEngineOn"];

_chopper addaction [
	format ["<t color=""#FE0105"">" + ("%1") + "</t>", _prompt],
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[
			_target,
			_arguments select 0,
			_arguments select 1
		] remoteExec ["topHat_fnc_flyToAction", _target];
	},
	[_lz, _keepEngineOn],
	6,
	true,
	true,
	"",
	format ["(_target distance2D %1) > %2", _lz, _min_distance]
];
