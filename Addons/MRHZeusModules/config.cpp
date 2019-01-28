
class CfgPatches {
	class MRHZeusModules{
		units[] = {
			"MRH_Module_Base",
			"MRH_HeliTaxiControls",
			"MRH_SimpleConv",
			"MRH_AttributeVar",
			"MRH_AddObjectToHalo",
			"MRH_SimpleHaloJump",
			"MRH_attributeData",
			"MRH_attributeDataForHack",
			"MRH_createData",
			"MRH_setForSurrender"
		}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools","A3_Modules_F"}; //
	};
};
//addondialogs

#include "\MRHZeusModules\Dialogs\HeliNumberPerSide.hpp"
//the above contains the link to defines.hpp and must always be left 1st
#include "\MRHZeusModules\Dialogs\SimpleAceConv.hpp"
#include "\MRHZeusModules\Dialogs\ChangeVar.hpp"
#include "\MRHZeusModules\Dialogs\simpleHalo.hpp"
#include "\MRHZeusModules\Dialogs\attributeDataMenu.hpp"
#include "\MRHZeusModules\Dialogs\attributeDataForHackMenu.hpp"
#include "\MRHZeusModules\Dialogs\dataCreator.hpp"
#include "\MRHZeusModules\Dialogs\setSurrenderMenu.hpp"

//
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
