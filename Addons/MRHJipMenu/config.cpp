class CfgPatches {
	class MRHJipMenu{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

/////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHJipMenu\Functions\cfgFunctions.hpp"
};
////=============fincfgFunctions

/////////////////======Ressources MRHJip
#include "\MRHJipMenu\dialogsHPP\definesJIP.hpp"
#include "\MRHJipMenu\dialogsHPP\dialogsJIP.hpp"
/////////////////======Fin Ressources MRHJip

