class CfgPatches {
	class MRHEnhancedMap{
		units[] = {"MRH_MapObject"}; //
		weapons[] = {"MRH_Map"}; //
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
      clientInit = "call compile preProcessFileLineNumbers '\MRHEnhancedMap\Functions\XEHclient.sqf'";
   };
      
	
};

class CfgWeapons
{
	#include "\MRHEnhancedMap\cfghpp\cfgweapons.hpp"
};

class Extended_Init_EventHandlers {
    class CAManBase {
        class MRH_Soldier_init_eh {
            init = "_this call MRH_fnc_MilsimTools_EnhancedMap_replaceVanillaMap;";
        };
    };
};