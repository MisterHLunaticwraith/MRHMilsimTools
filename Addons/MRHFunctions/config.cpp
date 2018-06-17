class CfgPatches {
	class MRHFunctions{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_settings","MRHMilsimTools"}; //
	};
};

//////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHFunctions\functions\cfgfunctions.hpp"
};
////=============fincfgFunctions

/////=========cfgSounds==========
class CfgSounds
{
	#include "\MRHFunctions\sounds\cfgsounds.hpp"
};
////=============fincfgSounds=====

class cfgWeapons
{
	#include "\MRHFunctions\models\hackphone\hackphone.hpp"
};
////=====================FinDesCFG=================================================



///==========composants des menusCORE====

/////////////////======Ressources MRHHACKPHONE
#include "\MRHFunctions\dialogsHPP\definesHACKPHONE.hpp"
#include "\MRHFunctions\dialogsHPP\dialogsHACKPHONE.hpp"
/////////////////======Fin Ressources MRHRoster

///==========FINcomposants des menusCORE====



