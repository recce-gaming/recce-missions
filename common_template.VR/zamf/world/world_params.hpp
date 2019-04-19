#ifndef zamf_world_params_month
	#define zamf_world_params_month -1
#endif
class month {
	title="    Month";
	values[]={-1,1,2,3,4,5,6,7,8,9,10,11,12};
	texts[]={"No change","1","2","3","4","5","6","7","8","9","10","11","12"};
	default = zamf_world_params_month;
};

#ifndef zamf_world_params_day
	#define zamf_world_params_day -1
#endif
class day {
	title="    Day of Month";
	values[]={-1,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
	texts[]={"No change","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
	default = zamf_world_params_day;
};

#ifndef zamf_world_params_hour
	#define zamf_world_params_hour -1
#endif
class hour {
	title="    Hour";
	values[]={-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	texts[]={"No change","0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"};
	default = zamf_world_params_hour;
};

#ifndef zamf_world_params_minute
	#define zamf_world_params_minute -1
#endif
class minute {
	title="    Minute";
	values[]={-1,0,5,10,15,20,25,30,35,40,45,50,55};
	texts[]={"No change","0","5","10","15","20","25","30","35","40","45","50","55"};
	default = zamf_world_params_minute;
};
