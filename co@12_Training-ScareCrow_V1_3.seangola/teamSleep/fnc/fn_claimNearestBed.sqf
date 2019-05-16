/*
	Description:
	Gets the closest of the given beds. If no beds are given, then they will be given 
	they're own object.
	The bed will be claimed by returning the given array of beds minus the claimed bed.
	

	Parameter(s):
	0: OBJECT - Man to claim a bed.
	1: ARRAY - Bed objects

	Returns:
	ARRAY - Of format [<Bed object>, <Array of bed objects>]
*/
params ["_man", "_beds"];

_beds = +_beds;
if (count _beds == 0) exitWith {
	[_man, _beds]
};
private _bed = [_beds, _man] call BIS_fnc_nearestPosition;
_beds deleteAt (_beds find _bed);
[_bed, _beds]