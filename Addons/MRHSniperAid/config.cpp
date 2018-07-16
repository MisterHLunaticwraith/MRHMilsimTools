class CfgPatches {
	class MRHSniperAid{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_settings","MRHMilsimTools","A3_Modules_F"}; //
	};
};

class Extended_PostInit_EventHandlers
{
   class MRHSniperAidInit
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHSniperAid\Functions\fn_MilsimTools_SniperTraining_initMakeTargets.sqf'";
   };
};
class CfgFunctions
{
	#include "\MRHSniperAid\Functions\cfgfunctions.hpp"
};

////MRHSniperAid dialogs
#include "\MRHSniperAid\dialogsHPP\targetspawnerDefines.hpp"
#include "\MRHSniperAid\dialogsHPP\targetspawnerDialogs.hpp"