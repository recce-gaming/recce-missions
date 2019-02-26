/*
	Description:
	Waits for the given unit to arrive at the given position and be ready for orders.

	Parameter(s):
	0: OBJECT - Unit to wait for.
	1: ARRAY - Position to arrive at.

	Returns:
	Nothing
*/
params ["_engineer", "_position"];

waituntil {
	sleep 1;
	(alive _engineer) and 
		{_engineer inArea [_position, 2, 2, 0, false]} and 
		{unitReady _engineer}
};
