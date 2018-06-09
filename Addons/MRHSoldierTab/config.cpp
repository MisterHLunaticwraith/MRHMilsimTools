class CfgPatches {
	class SoldierTab{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_settings","MRHMilsimTools"}; //
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

