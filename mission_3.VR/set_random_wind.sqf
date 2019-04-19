/*
	Description:
	Sets the wind in a radom direction at a random strength within the given range. 

	Parameter(s):
	0: NUMBER - Min wind speed in m/s.
	0: NUMBER - Max wind speed in m/s.

	Returns:
	Nothing
*/
if !(isServer) exitWith {};

_this spawn {
	params ["_min", "_max"];
	private _strength = _min + (random (_max - _min));
	private _direction = random 360;
	private _x_component = _strength * sin _direction;
	private _y_component = _strength * cos _direction;
	waitUntil {time > 3};  // Just to be safe.
	diag_log format ["set_random_wind: _strength: %1", _strength];
	diag_log format ["set_random_wind: _direction: %1", _direction];
	diag_log format ["set_random_wind: _x_component: %1", _x_component];
	diag_log format ["set_random_wind: _y_component: %1", _y_component];
	setWind [_x_component, _y_component, true];
	sleep 0.1;
	forceWeatherChange;
	sleep 0.1;
	simulWeatherSync;
};
