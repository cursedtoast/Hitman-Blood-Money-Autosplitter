//Hitman: Blood Money Autosplitter
//By CursedToast 8/15/2019
//Last updated 8/15/2019
//Requested by Katlink

state("HitmanBloodMoney")
{
	int isLoading : "HitmanBloodMoney.exe", 0x0041F820,  0x7BC, 0x2C4, 0x84, 0x20, 0x4C;
	int levelComplete : "HitmanBloodMoney.exe", 0x005B2A9C,  0x8;
	int levelTime : "HitmanBloodMoney.exe", 0x0041F820,  0x48;
	int targetsKilled : "HitmanBloodMoney.exe", 0x002ADB0C,  0x2C;
	int map : "HitmanBloodMoney.exe", 0x005C6638,  0x5E8;
}

init
{
	vars.trigger = 0;
}


start
{	
	if (current.map == 0 && current.levelTime > 1)
	{
		return true;
	}
}

update
{
	if (timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.trigger = 0;
	}
	
	if (current.levelComplete != 1 && old.levelComplete == 1)
	{
		vars.trigger = 0;
	}
}

split
{
	var cur_segname = timer.CurrentSplit.Name;
	
	if (cur_segname != "Requiem" && vars.trigger == 0 && current.levelComplete == 1)
	{
		vars.trigger = 1;
		return true;
	}
	else
	{
		return current.targetsKilled == 13;
	}
}

