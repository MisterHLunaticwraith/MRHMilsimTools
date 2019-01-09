class CfgPatches {
	class MRHFireSupport{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools","ace_interact_menu"}; //
	};
};

class Extended_PostInit_EventHandlers
{
   class MRHSFireSupportSettingsParser
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHFireSupport\Functions\fn_MilsimTools_FireSupport_parseSettings.sqf'";
   };

};

class cfgVehicles
{
    #include "\MRHFireSupport\cfghpp\cfgvehicles.hpp"
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