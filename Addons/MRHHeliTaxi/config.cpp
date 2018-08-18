
class CfgPatches {
	class MRHHeliTaxi{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};


#include "\MRHHeliTaxi\Dialogs\helichoice.hpp"
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
   class MRHHeliTaxi_clientInit
   {
      clientinit = "call compile preProcessFileLineNumbers '\MRHHeliTaxi\Functions\fn_MilsimTools_Heli_heliTaxiAction.sqf'";
   }; 
   
	
};