class CfgPatches {
	class SoldierTab{
		units[] = {"B_MRH_HQ_Module","O_MRH_HQ_Module","I_MRH_HQ_Module","C_MRH_HQ_Module"}; //
		weapons[] = {"MRH_SoldierTab"}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools","MRHZeusModules","MRHMarkers"}; //
	};
};

//interface components
#include "\MRHSoldierTab\dialogs\defines.hpp"
#include "\MRHSoldierTab\dialogs\dialogsSoldierTablet.hpp"
//

class cfgFunctions
{
#include "\MRHSoldierTab\Functions\cfgFunctions.hpp"
};
class cfgSounds
{
	#include "\MRHSoldierTab\cfghpp\cfgsounds.hpp"
};

class cfgVehicles
{
	#include "\MRHSoldierTab\cfghpp\cfgvehicles.hpp"
};
class Extended_PostInit_EventHandlers
{
   
   class MRHMilsimTools_SoldierTab_parseCfgPictures
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseCfgPictures.sqf'";
   };
      
	class MRHMilsimTools_SoldierTab_parseMissionData
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseMissionData.sqf'";
   };
};

class CfgWeapons
{
	#include "\MRHSoldierTab\models\Tablet\tablet.hpp"
};