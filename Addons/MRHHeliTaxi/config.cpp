
class CfgPatches {
	class MRHHeliTaxi{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools","MRHZeusModules"}; //
	};
};


#include "\MRHHeliTaxi\Dialogs\helichoice.hpp"
#include "\MRHHeliTaxi\Dialogs\waypointchoice.hpp"
#include "\MRHHeliTaxi\Dialogs\medevacDialogs.hpp"

class cfgFunctions
{
	#include "\MRHHeliTaxi\Functions\cfgFunctions.hpp"
};

class cfgSounds
{
	#include "\MRHHeliTaxi\cfgsounds.hpp"
};

class Extended_PostInit_EventHandlers
{
   class MRHHeliTaxiSettingsParser
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHHeliTaxi\Functions\fn_MilsimTools_HeliTaxi_parseSettings.sqf'";
   };

};

class cfgVehicles
{
	#include "\MRHHeliTaxi\cfghpp\cfgvehicles.hpp"
};
class RscTitles
{
    #include "\MRHHeliTaxi\Dialogs\HudIntelDialogs.hpp"
};