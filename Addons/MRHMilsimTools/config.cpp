class CfgPatches {
	class MRHMilsimTools{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_settings"};

	};
		version = 1.0.0;
		versionStr = "1.0.0";
		versionAr[] = {1,0,0};
};

#include "\MRHMilSimTools\cfgSettings.hpp"

class Extended_PreInit_EventHandlers
{
   class MRHMilsimTools_CBA_Settings
   {
      init = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\SettingsPreInit\CBASettings.sqf'";
   }; 
   class MRHMilsimTools_CBA_Settings_keybinds
   {
      init = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\SettingsPreInit\CBAKeys.sqf'";
   };     
};
class Extended_PostInit_EventHandlers
{
   class MRHMilsimTools_Core_SetPlayerIntel
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\fn_MilsimTools_Core_SetPlayerIntel.sqf'";
   };
   
   class MRHMilsimTools_Core_InitPlayerLocal
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\fn_MilsimTools_Core_InitPlayerLocal.sqf'";
   };
   
   class MRHMilsimTools_Core_PlayersRegistry
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\fn_MilsimTools_Core_PlayersRegistry.sqf'";
   };
   
};

/////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHMilSimTools\Functions\cfgFunctions.hpp"
};
////=============fincfgFunctions
// =============CFG======================================================

/////=========cfgNotifications=====
class cfgNotifications
{
#include"\MRHMilSimTools\cfghpp\cfgnotifications.hpp"
};
////=============fincfgNotifications
//===cfgMRHRanks
#include"\MRHMilSimTools\cfghpp\cfgMRHrankpictures.hpp"
//==========
/*
/////=========cfgDebriefings=======
class CfgDebriefing
{
#include "\MRHMilSimTools\cfghpp\cfgdebriefing.hpp"
};
////=============fincfgDebriefings=



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

*/

