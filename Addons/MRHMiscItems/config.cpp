
class CfgPatches {
	class MRHMiscItems{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

class CfgEditorCategories
{
	class EdCat_MRH_Misc // Category class, you point to it in editorCategory property
	{
		displayName = $STR_MRH_MRHMiscItems_ItemEdCat; // Name visible in the list
	};
};

class CfgEditorSubcategories
{
	class EdSubcat_MRH_Props // Category class, you point to it in editorSubcategory property
	{
		displayName = $STR_MRH_MRHMiscItems_propsEdSubCat; // Name visible in the list
	};
	class EdSubcat_MRH_InvIt // Category class, you point to it in editorSubcategory property
	{
		displayName = $STR_MRH_MRHMiscItems_InvItEdSubCat; // Name visible in the list
	};

};

//----------addon dialogs
//#include "\MRHMiscItems\Dialogs\.hpp"

//---------- addon cfgs
/*
class cfgFunctions
{
#include "\MRHMiscItems\Functions\cfgFunctions.hpp"
};
*/
/*
class cfgSounds
{
	#include "\MRHMiscItems\Sounds\cfgsounds.hpp"
};
*/

class cfgVehicles
{
	#include "\MRHMiscItems\cfgvehicles.hpp"
};


class cfgWeapons
{
	#include "\MRHMiscItems\cfgweapons.hpp"
};

//------------Extended XEH
/*
class Extended_PostInit_EventHandlers
{
   
   class MRHMiscItems_
   {
      clientInit = "call compile preProcessFileLineNumbers 'MRHMiscItems\Functions\fn_.sqf'";
   };
      
	
};
*/
