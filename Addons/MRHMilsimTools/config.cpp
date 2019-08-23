class CfgPatches {
	class MRHMilsimTools{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_main"};
		version = 1.17.3;
		versionStr = "1.17.3";
		versionAr[] = {1,17,3};
		versionDesc = "MRH Milsim Tools";
		versionAct = "call compile preProcessFileLineNumbers '\MRHMilSimTools\about.sqf'";
		author = "Mr H.";
      authors[]= {"Mr H."};
		url = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
	};
		
		
};

class CfgMods {
    class MRHMilsimTools {
        dir = "@MRHMilsimTools";
        name = "Mister H's Milsim Tools";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
        description = "Issue Tracker: https://github.com/MisterHLunaticwraith/MRHMilsimTools/issues";
    };
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
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\XEHclient.sqf'";
   };
   
   class MRHMilsimTools_Core_PlayersRegistry
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\XEHserver.sqf'";
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

#include"\MRHMilSimTools\cfghpp\cfgMRHcompositions.hpp"
#include"\MRHMilSimTools\cfghpp\cfg3DEN.hpp"

class CfgUnitInsignia
{
	class MRH_MedicShoulderPatch
	{
		author = "Mr H.";
		displayName = $STR_MRH_MISC_MedicPatchInsignia;
		texture = "\MRHMilSimTools\paa\medicpatch.paa";
	};
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class MRH_MedicPatch_init {
            init = "_this call MRH_fnc_MilsimTools_Core_assignMedicPatch;";
        };
    };
};