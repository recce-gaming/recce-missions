/*
	Description:
	Add addActions to a player that allows them to give special orders to engineers.
	Make sure to execute with spawn.

	Parameter(s):
	0: OBJECT - Player to get distance from.
	1: NUMBER - Distance from the player that enginners must be within.

	Returns:
	Nothing
*/
params ["_player", "_distance"];

waitUntil {(time > 5) and {!(isNull _player)}};
if !(local _player) exitWith {};

_player addaction [
	"<t color=""#0901FF"">" + ("Everyone, get to work!") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _engineers = [
			["going_to_work", "working"], _caller, _arguments
		] call topHat_fnc_getAllAppropriateEngineers;
		{
			[_x] remoteExec ["topHat_fnc_goToWork", _x];
		} forEach _engineers
	},
	_distance,
	5,
	true,
	true,
	"",
	format ["
		(count ([
			['going_to_work', 'working'],
			_this,
			%1
		] call topHat_fnc_getAllAppropriateEngineers) > 0) and 
		(_this == _target)
	", _distance]
];

_player addaction [
	"<t color=""#0901FF"">" + ("Everyone, follow me!") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _engineers = [
			["joined_player"], _caller, _arguments
		] call topHat_fnc_getAllAppropriateEngineers;
		private _group = group _caller;
		{
			[_x, _group] remoteExec ["topHat_fnc_joinPlayer", _x];
		} forEach _engineers
	},
	_distance,
	5,
	true,
	true,
	"",
	format ["
		(count ([
			['joined_player'],
			_this,
			%1
		] call topHat_fnc_getAllAppropriateEngineers) > 0) and 
		(_this == _target)
	", _distance]
];

_player addaction [
	"<t color=""#0901FF"">" + ("Everyone, take cover!") + "</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _engineers = [
			["taking_cover", "in_cover"], _caller, _arguments
		] call topHat_fnc_getAllAppropriateEngineers;
		private _group = group _caller;
		{
			[_x] remoteExec ["topHat_fnc_takeCover", _x];
		} forEach _engineers
	},
	_distance,
	5,
	true,
	true,
	"",
	format ["
		(count ([
			['taking_cover', 'in_cover'],
			_this,
			%1
		] call topHat_fnc_getAllAppropriateEngineers) > 0) and 
		(_this == _target)
	", _distance]
];
