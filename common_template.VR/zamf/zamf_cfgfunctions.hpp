class ZAMF
{
	tag = "ZAMF";
	class functions
	{
		file = "zamf\fnc";
		class getLoadout {description = "Uses aeroson's get_loadout function.";};
		class setLoadout {description = "Uses aeroson's set_loadout function.";};
	};

	class res
	{
		file = "zamf\res\fnc";
		class res_init {description = "Initializes the mod."; postInit = 1;};
		class res_loop {description = "Main save loop.";};
		class res_restore {description = "Restores player status from prfileNameSpace.";};
		class res_getData {description = "Saves player status to prfileNameSpace.";};
		class res_request {description = "This checks to see if the player is in the save data and restores if so.";};
		class res_killed {description = "Sets the save data to killed for the given player object.";};
	};

	class world
	{
		file = "zamf\world\fnc";
		class setDateTime {description = "Sets date and time. Designed for use with params.";};
	};

	class spectate
	{
		file = "zamf\spectate\fnc";
		class spectateOptions {description = "Gives the target player local only action menu options to spectate and keeps them hidden.";};
	};
};
