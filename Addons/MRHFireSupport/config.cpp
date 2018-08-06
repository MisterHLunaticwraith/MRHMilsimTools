class CfgPatches {
	class MRHFireSupport{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

class Extended_PostInit_EventHandlers
{
   class MRHSFireSupportSettingsParser
   {
      init = "call compile preProcessFileLineNumbers '\MRHFireSupport\Functions\fn_MilsimTools_FireSupport_parseSettings.sqf'";
   };
   
   class MRH_FireSupport_ArtyAddAceACtion
   {
	   clientInit = "call compile preProcessFileLineNumbers '\MRHFireSupport\Functions\fn_MilsimTools_FireSupport_AddAceAction.sqf'";
   };
};

class cfgSounds
{
	#include "\MRHFireSupport\IncomingSounds\cfgsounds.hpp"
}

#include "\MRHFireSupport\Dialogs\ArtilleryInterface.hpp"

class cfgFunctions
{
	#include "\MRHFireSupport\Functions\cfgFunctions.hpp"
};