class teamSleep
{
	tag = "teamSleep";
	class functions
	{
		file = "teamSleep\fnc";
		class init {description = "Begin tasks to classify object, initialize men and monitor triggers"};
		class classifyObjects {description = "Given an array of objects, it will classify them into 3 arrays, for men, beds and triggers"};
		class claimNearestBed {description = "Find the nearest bed to the given man that is not taken"};
		class sleepAtBed {description = "Have the given man go to the given position and fall asleep"};
		class monitorLoop {description = "Monitor all relevant triggers for a wake up call"};
		class wakeUp {description = "Wake the given man up"};
	}
};