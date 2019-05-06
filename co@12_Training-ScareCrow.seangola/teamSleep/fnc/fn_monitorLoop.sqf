/*
	Description:
	Monitors the given triggers and wakes up the given men when one of them is activated.

	Parameter(s):
	0: ARRAY - Objects of men to wake up.
	1: ARRAY - Triggers to monitor.

	Returns:
	Nothing
*/
_this spawn {
	params ["_men", "_triggers"];
	private _max_wake_delay = 30;
	private _min_wake_delay = 2;
	waitUntil {sleep 0.5; {triggerActivated _x} count _triggers > 0};
	{
		[_x, _max_wake_delay, _min_wake_delay] spawn {
			params ["_man", "_max", "_min"];
			sleep (_min + (random (_max - _min)));  // Stagger their wake up.
			[_man] remoteExec ["teamSleep_fnc_wakeUp", _man];
		};
	} forEach _men;
};
