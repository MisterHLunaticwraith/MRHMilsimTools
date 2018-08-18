class CfgPatches {
	class MRHRadioChatter{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

class cfgFunctions
{
#include "\MRHRadioChatter\Functions\cfgfunctions.hpp"
};
class cfgSounds
{
#include "\MRHRadioChatter\Sounds\cfgsounds.hpp"
		class MRH_radiochatter_radioclick
	{

	name     = "MRH_radiochatter_radioclick";
	sound[]  = {"\MRHRadioChatter\Sounds\MRH_radiochatter_radioclick.ogg", 2, 1, 100};
	titles[] = {};
	

	};

};
#include "\MRHRadioChatter\cfgMRHFactionSounds.hpp"