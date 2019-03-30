class CfgPatches {
	class MRHFibreScope{
		units[] = {}; //
		weapons[] = {"MRH_FiberScope"}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};
#define IS_DEBUG ["MRH_MilsimTools_DebugTools_isDebugMode"] call cba_settings_fnc_get
#define TRACE(ARG) [(##ARG##)] call MRH_fnc_MilsimTools_DebugTools_trace
class CfgWeapons
{
    class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
    //class InventoryItem_Base_F;
    
    class MRH_FiberScope: CBA_MiscItem
    {
        author = "Mr H.";
        displayName = $STR_MRH_FS_DISPLAYNAME;
        model = "\MRHFiberScope\Models\fiberscope.p3d";
        scope = 2;      
        scopeArsenal = 2;
        scopeCurator = 2;
        //simulation= "ItemMineDetector"
		editorCategory = "EdCat_Equipment";
		editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
		editorSubcategory = "EdSubcat_InventoryItems";
        picture = "\MRHFiberScope\Paa\fibrescope.paa";
        descriptionShort = $STR_MRH_FS_DESCRIPTIONSHORT;
		//type = 0;
        ace_arsenal_hide = 0;
        class ItemInfo: CBA_MiscItem_ItemInfo
        {
            mass=10;
        };
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
			class ACE_Equipment {
				class MRH_Ace_Fibro {
					displayName = $STR_MRH_FS_ACE_DISPLAYNAME;
					condition = "'MRH_FiberScope' in items player";
					exceptions[] = {};
					statement = "call MRH_fnc_FiberScopeCreate";
					icon = "\MRHFiberScope\Paa\fibrescope.paa";
					};
			};
		};
	};
};

#include "\MRHFiberScope\DialogsHPP\defines.hpp"
#include "\MRHFiberScope\DialogsHPP\display.hpp"

class cfgSounds
{
	#include "\MRHFiberScope\Sounds\cfgsounds.hpp"
};

class cfgFunctions
{
	#include "\MRHFiberScope\Functions\cfgFunctions.hpp"
};


class Extended_PreInit_EventHandlers
{
   class MRHFiberScopeInit
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHFiberScope\Functions\fn_cbaKeys.sqf'";
   };
};
