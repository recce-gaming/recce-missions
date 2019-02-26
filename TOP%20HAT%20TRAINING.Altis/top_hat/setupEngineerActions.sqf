/*
	Description:
	Add all the addactions that need to be on the engineer.
	It also saves the 

	Parameter(s):
	0: OBJECT - Engineer.
	1: STRING - Marker name for where to work.
	2: STRING - Marker name for where to take cover.
	3: STRING - Marker name for where to teleport to when at cover.

	Returns:
	Nothing
*/
params ["_engineer", "_marker_work", "_marker_cover", "_marker_teleport"];

_engineer setVariable ["is_engineer", true];
_engineer setVariable ["spot_work", getMarkerPos _marker_work];
_engineer setVariable ["spot_cover", getMarkerPos _marker_cover];
_engineer setVariable ["spot_teleport", getMarkerPos _marker_teleport];

if (local _engineer) then {
	[_engineer] call topHat_fnc_terminateCurrentAction;
};

_engineer addaction [
	"<t color='#1FFD01'>" + ("Go to work") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] remoteExec ["topHat_fnc_goToWork", _target];
	},
	nil,
	6,
	true,
	true,
	"",
	"
		_action = _target getVariable ['current_action', ''];
		(_action != 'going_to_work') and (_action != 'working')
	"
];

_engineer addaction [
	"<t color='#1FFD01'>" + ("Follow me") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target, group _caller] remoteExec ["topHat_fnc_joinPlayer", _target];
	},
	nil,
	6,
	true,
	true,
	"",
	"
		_action = _target getVariable ['current_action', ''];
		(_action != 'joined_player')
	"
];

_engineer addaction [
	"<t color='#1FFD01'>" + ("Take cover") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		[_target] remoteExec ["topHat_fnc_takeCover", _target];
	},
	nil,
	6,
	true,
	true,
	"",
	"
		_action = _target getVariable ['current_action', ''];
		(_action != 'taking_cover') and (_action != 'in_cover')
	"
];
