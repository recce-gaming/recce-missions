/*
	Author: Phoenix of Zulu-Alpha

	Description:
		Gives the target player local only action menu options to spectate and keeps them
		hidden.

	Params:
		0 : OBJECT - The player to give options to.

	Returns:
		Nothing
*/
_this spawn {

	params ["_unit"];

	// Make sure the unit is initialized
	waitUntil {(time > 5) and {!(isNull _unit)}};

	// Permanent hide (to resolve unhiding by ace spectator)
	if (isServer) then {
		_unit spawn {
			while {alive _this} do {
				sleep 0.1;
				if !(isObjectHidden _this) then {
					_this hideObjectGlobal true;
				};
			};
		};
	};

	// Make sure addactions only exist for the player in the slot.
	if !(local _unit) exitWith {};

	_teleport_map_click = {
		onMapSingleClick "player setPos _pos; onMapSingleClick ''; hint ''";
		hintSilent "Open your map and left click on where you want to teleport to.";
	};

	_unit addAction [
		"Spectate",
		{
			[true, false, true] call ace_spectator_fnc_setSpectator;
			[allPlayers, [player]] call ace_spectator_fnc_updateUnits;
			[[1, 2], [0]] call ace_spectator_fnc_updateCameraModes;
			[[-2, -1, 0, 1, 2, 3, 4, 5, 6, 7], []] call ace_spectator_fnc_updateVisionModes;
			[false] call acre_api_fnc_setSpectator;
			(getpos player) spawn {
				while {!(isNil "ace_spectator_isSet") and {ace_spectator_isSet}} do {
					sleep 0.25;
					if (!(isNil "ace_spectator_camFocus") and {ace_spectator_camFocus != attachedTo player}) then {
						detach player;
						player attachTo [ace_spectator_camFocus, [0,0,2]];
					};
				};
				if !(isNull (attachedTo player)) then { 
					detach player;
					player setPos _this;
				};
			};
		}
	];
	_unit addAction ["Teleport", _teleport_map_click];

};
