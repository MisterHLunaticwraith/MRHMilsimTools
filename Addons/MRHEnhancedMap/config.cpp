class CfgPatches {
	class MRHEnhancedMap{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

#include "\MRHEnhancedMap\cfghpp\cfgMRHMapPictures.hpp"


#include "\MRHEnhancedMap\Dialogs\foldmap.hpp"

class cfgFunctions
{
#include "\MRHEnhancedMap\Functions\cfgFunctions.hpp"
};
/*
class cfgSounds
{
	#include "\MRHEnhancedMap\cfghpp\cfgsounds.hpp"
};
*/
class cfgVehicles
{
	#include "\MRHEnhancedMap\cfghpp\cfgvehicles.hpp"
};

class Extended_PostInit_EventHandlers
{
   
   class MRHMilsimTools_EnhancedMap_KeyPress
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHEnhancedMap\Functions\fn_MilsimTools_EnhancedMap_addKeyHandler.sqf'";
   };
      
	
};

class CfgWeapons
{
	#include "\MRHEnhancedMap\cfghpp\cfgweapons.hpp"
};