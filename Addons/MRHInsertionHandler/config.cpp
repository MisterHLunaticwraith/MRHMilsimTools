
class CfgPatches {
	class MRHInsertionHandler{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};



//----------addon dialogs
#include "\MRHInsertionHandler\Dialogs\insertionmenu.hpp"
#include "\MRHInsertionHandler\Dialogs\cargopreparationinterface.hpp"
//---------- addon cfgs
class cfgFunctions
{
#include "\MRHInsertionHandler\Functions\cfgFunctions.hpp"
};

class cfgSounds
{
	#include "\MRHInsertionHandler\Sounds\cfgsounds.hpp"
};

/*
class cfgVehicles
{
	#include "MRHInsertionHandler\cfghpp\cfgvehicles.hpp"
};
*/
/*
class cfgWeapons
{
	#include "MRHInsertionHandler\cfghpp\cfgweapons.hpp"
};
*/
//------------Extended XEH

class Extended_PostInit_EventHandlers
{
   
   class MRHInsertionHandler_settingsParser
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHInsertionHandler\Functions\fn_MilsimTools_InsertionHandler_parseSettings.sqf'";
   };
      
	
};

class Extended_Init_EventHandlers {
    class thingX {
        class MRH_InsertionHandler_Ace_action_thingX {
            init = "_this call MRH_fnc_MilsimTools_InsertionHandler_isLoadableObject";
        };
    };
	class LandVehicle {
        class MRH_InsertionHandler_Ace_action_LandVehicle {
            init = "_this call MRH_fnc_MilsimTools_InsertionHandler_isLoadableObject";
        };
    };
	class Boat_F {
        class MRH_InsertionHandler_Ace_action_Boat_F {
            init = "_this call MRH_fnc_MilsimTools_InsertionHandler_isLoadableObject";
        };
    };
};