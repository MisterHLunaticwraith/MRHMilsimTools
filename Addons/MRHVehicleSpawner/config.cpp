class CfgPatches {
	class MRHSpawner{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

#include "\MRHVehicleSpawner\DialogsHPP\definesSPAWNER.hpp"
#include "\MRHVehicleSpawner\DialogsHPP\dialogsSPAWNER.hpp"

/////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHVehicleSpawner\cfghpp\cfgfunctions.hpp"
};
////=============fincfgFunctions
////=============fincfgFunctions
class Extended_PreInit_EventHandlers
{
   class MRHSpawnerInit
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHVehicleSpawner\Functions\fn_Spawner_SpawnerInit.sqf'";
   };
};