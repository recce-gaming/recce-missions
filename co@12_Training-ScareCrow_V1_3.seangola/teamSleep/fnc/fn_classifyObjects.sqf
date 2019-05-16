/*
	Description:
	Given an array that contains men, triggers and objects intended to be used as beds,
	return an array that contains 3 arrays, where each array only contains one of those
	types of objects.
	Any object that is not a man or trigger will be considered a bed.

	Parameter(s):
	0: ARRAY - Objects in array to classify.

	Returns:
	ARRAY - Of format [<Men array>, <Beds array>, <Trigger array>].
*/
params ["_to_categorize"];
private _men = [];
private _beds = [];
private _triggers = [];

{
	if (_x isKindOf "man") then {
		_men pushBackUnique _x;
	};
	if (_x isKindOf "EmptyDetector") then {
		_triggers pushBackUnique _x;
	};
	if !((_x isKindOf "man") or (_x isKindOf "EmptyDetector")) then {
		_beds pushBackUnique _x;
	};
} forEach _to_categorize;

[_men, _beds, _triggers]