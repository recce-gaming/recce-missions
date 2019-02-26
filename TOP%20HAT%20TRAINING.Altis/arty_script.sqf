if !(isServer) exitWith {};

get_error = {
    /* 
    *   Returns a number randomly up to the given number (ceiling) or up to it's negative 
    *   (floor)
    *
    *   Params:
    *       0 : Number - The number that is the ceiling or floor
    *  
    *   Returns:
    *       Number
    *
    *   Example: 
    *       [100] call get_error 
    *       => A number from -100 to 100
    */
    params ["_error"];
    (random (2 * _error)) - _error
};

do_fire_mission = {
    /* 
    *   Performs the given fire mission the given number of times with the given delay
    *   and inserts an error.
    *
    *   Params:
    *       0: Object - Artillery variable as named in eden editor.
    *       1: String - Name of marker representing the target.
    *       2: Integer - Which ammo to use in the array given by `getArtilleryAmmo`.
    *       3: Integer - The number of rounds to fire per fire mission.
    *       4: Number - The max random circular error to introduce to each fire mission.
    *       5: Integer - The number of fire fire missions to do.
    *       6: Integer - The delay in seconds between fire missions.
    *       
    *   Example:
    *       [mortar_1, "target_1", 0, 10, 200, 5, 120] call do_fire_mission
    *       => mortar_1 will fire at marker target_1 with the first ammo type given by
    *          `getArtilleryAmmo` with each fire mission being 10 rounds and it's own 
	*		   cirular error of up to 200 meters. It will do 5 of these fire missions 120 
	*          seconds apart.
    */
    params ["_arty", "_tgt_marker", "_ammo_index", "_round_count",
            "_error_circular", "_num_of_missions", "_mission_delay"];
    private _ammo = getArtilleryAmmo [_arty] select _ammo_index;
    private _tgt = getMarkerPos _tgt_marker;
    private _mission_num = 1;
    while {alive _arty and _mission_num <= _num_of_missions} do {
        private _tgt_with_error = [
            (_tgt select 0) + ([_error_circular] call get_error),
            (_tgt select 1) + ([_error_circular] call get_error),
            0
        ];
        _arty doArtilleryFire [_tgt_with_error, _ammo, _round_count];
        sleep _mission_delay;
        _mission_num = _mission_num + 1;
    };
};


// Fire missions
[StalinOrgan1, "StalinTarget1", 0, 24, 100, 8, 60] call do_fire_mission;
if (alive Mortar1) then {sleep ((random 60) + 540)};
[Mortar1, "MortarTarget1", 0, 2, 50, 10, 12] call do_fire_mission;
if (alive StalinOrgan2) then {sleep 300};
[StalinOrgan2, "StalinTarget2", 0, 24, 100, 8, 60] call do_fire_mission;
if (alive Mortar2) then {sleep ((random 60) + 540)};
[Mortar2, "MortarTarget2", 0, 2, 50, 10, 12] call do_fire_mission;
if (alive StalinOrgan3) then {sleep 300};
[StalinOrgan3, "StalinTarget3", 0, 24, 100, 8, 60] call do_fire_mission;
if (alive Mortar3) then {sleep ((random 60) + 540)};
[Mortar3, "MortarTarget3", 0, 2, 50, 10, 12] call do_fire_mission;
if (alive Mortar4) then {sleep 300};
[Mortar4, "MortarTarget4", 0, 2, 50, 10, 12] call do_fire_mission;
