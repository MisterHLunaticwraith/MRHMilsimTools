
class CfgPatches {
	class MRHCustomAdminMenu{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {}; //
	};
};


#include "\MRHAdminMenu\functions\MRH_Components.hpp"
#include "\MRHAdminMenu\dialogs\defines.hpp"
#include "\MRHAdminMenu\dialogs\MRHAdminMenuDialogs.hpp"
class Extended_PostInit_EventHandlers
{
   class MRHValuesInit
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHAdminMenu\functions\fn_CBA_variables_Init.sqf'";
   };
};
class cfgFunctions
{
	#include "\MRHAdminMenu\functions\cfgFunctions.hpp"
};
