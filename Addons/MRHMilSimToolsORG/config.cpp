class CfgPatches {
	class MRHMilsimTools{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {}; //
	};
};

class Extended_PostInit_EventHandlers
{
   class MRHMilsimTools
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\fn_init.sqf'";
   };
};
// =============CFG======================================================

/////=========cfgNotifications=====
class cfgNotifications
{
#include"\MRHMilSimTools\cfghpp\cfgnotifications.hpp"
};
////=============fincfgNotifications
/*
/////=========cfgParams============
class Params
{
#include "\MRHMilSimTools\cfghpp\cfgparams.hpp"
};
////=============fincfgParams======
*/
/////=========cfgDebriefings=======
class CfgDebriefing
{
#include "\MRHMilSimTools\cfghpp\cfgdebriefing.hpp"
};
////=============fincfgDebriefings=

/////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHMilSimTools\cfghpp\cfgfunctions.hpp"
};
////=============fincfgFunctions

/////=========cfgSounds==========
class CfgSounds
{
	#include "\MRHMilSimTools\cfghpp\cfgsounds.hpp"
};
////=============fincfgSounds=====


////=====================FinDesCFG=================================================



///==========composants des menusCORE====

/////////////////======Ressources MRHRoster
#include "\MRHMilSimTools\dialogsHPP\definesROSTER.hpp"
#include "\MRHMilSimTools\dialogsHPP\dialogsROSTER.hpp"
/////////////////======Fin Ressources MRHRoster

/////////////////======Ressources MRHRoster
#include "\MRHMilSimTools\dialogsHPP\definesJIP.hpp"
#include "\MRHMilSimTools\dialogsHPP\dialogsJIP.hpp"
/////////////////======Fin Ressources MRHRoster

/////////////////======Ressources MRHACCMenu
#include "\MRHMilSimTools\dialogsHPP\definesACC.hpp"
#include "\MRHMilSimTools\dialogsHPP\dialogsACC.hpp"
/////////////////======Fin Ressources MRHACCMenu
///==========FINcomposants des menusCORE====



