class CfgPatches {
	class SoldierTab{
		units[] = {}; //
		weapons[] = {"MRH_SoldierTab"}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
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