
class CfgPatches {
	class MRHZeusModules{
		units[] = {
			"MRH_Module_Base",
			"MRH_HeliTaxiControls"
		}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools","A3_Modules_F"}; //
	};
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class MRH_MilsimTools_Modules: NO_CATEGORY
	{
		displayName = "MRH Modules";
		//priority = 2;
		//side = 7;
	};
};

//----------addon dialogs
//#include "\MRHZeusModules\Dialogs\.hpp"

//---------- addon cfgs

class cfgFunctions
{
#include "\MRHZeusModules\Functions\cfgFunctions.hpp"
};

/*
class cfgSounds
{
	#include "\MRHZeusModules\Sounds\cfgsounds.hpp"
};
*/

class cfgVehicles
{
	#include "\MRHZeusModules\cfghpp\cfgvehicles.hpp"
};

/*
class cfgWeapons
{
	#include "\MRHZeusModules\cfghpp\cfgweapons.hpp"
};
*/
//------------Extended XEH
/*
class Extended_PostInit_EventHandlers
{
   
   class \MRHZeusModules_
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHZeusModules\Functions\fn_.sqf'";
   };
      
	
};
*/
