
class CfgPatches {
	class MRHMiscItems{
		units[] = {"MRH_BioScanner_Base","MRH_BioScanner","MRH_ElevatorButton_Base","MRH_ElevatorButton","MRH_USB_ThumbDrive","MRH_ShootingMat_Khaki","MRH_ShootingMat_Olive","MRH_emptyBox","MRH_emptySupplyBox","MRH_AcexFoodSuppliesCrate","MRH_MedicalTent","MRH_MedicalTent_Special","MRH_FOB_container","MRH_camp_container"}; //
		weapons[] = {"MRH_FoldedMedicalTent","MRH_ShootingMat_Base","MRH_ShootingMat_Khaki","MRH_ShootingMat_Olive"}; //
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
	class EdSubcat_MRH_Utilities // Category class, you point to it in editorSubcategory property
	{
		displayName = $STR_MRH_MRHMiscItems_EdSubCatUtilities; // Name visible in the list
	};
	class EdSubcat_MRH_InvIt // Category class, you point to it in editorSubcategory property
	{
		displayName = $STR_MRH_MRHMiscItems_InvItEdSubCat; // Name visible in the list
	};

};

//----------addon dialogs
//#include "\MRHMiscItems\Dialogs\.hpp"

//---------- addon cfgs

class cfgFunctions
{
#include "\MRHMiscItems\Functions\cfgFunctions.hpp"
};

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

class Cfg3DEN
{
	#include "\MRHMiscItems\cfg3DEN.hpp"
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
