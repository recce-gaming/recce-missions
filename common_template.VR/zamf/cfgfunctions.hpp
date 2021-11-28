class ZAMF
{
	tag = "ZAMF";
	class init
	{
		class preInit {
			file = "preInit.sqf";
			preInit = 1;
			description = "Runs code that needs to be executed extremely early";
		};
	};

	class functions
	{
		file = "zamf\fnc";
		class disableAI {description = "Disables the AI for all the crew of a specified unit."; file = "zamf\ai\disable_ai.sqf";};
		class forceHide {description = "Make sure the given object is hidden perpetually and can never be un-hidden.";};
		class init {
			file = "zamf\init.sqf";
			description = "Initializes many ZAMF functionality in their correct order.";
		};
	};

	class world
	{
		file = "zamf\world\fnc";
		class setDateTime {description = "Sets date and time. Designed for use with params.";};
	};

	class res
	{
		file = "zamf\res\fnc";
		class res_init{description = "Initializes the mod."; postInit = 1;};
		class res_loop{description = "Main save loop.";};
		class res_restore{description = "Restores player status from prfileNameSpace.";};
		class res_getData{description = "Saves player status to prfileNameSpace.";};
		class res_request{description = "This checks to see if the player is in the save data and restores if so.";};
		class res_killed{description = "Sets the save data to killed for the given player object.";};
	};

	class spectate
	{
		file = "zamf\spectate\fnc";
		class startSpectate {description = "Initiates the respawn script with ZA settings and enhancements.";};
		class spectateOnDeath {description = "Initiates spectator on death if respawn timer is long enough (and ends it).";};
		class spectateOptions {description = "Gives the target player local only action menu options to spectate.";};
		class trackingMarkers {description = "Creates and keeps up to date local markers for all units";};
	};
};
