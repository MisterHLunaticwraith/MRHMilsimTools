#include "MRH_C_Path.hpp"
//["H_PilotHelmetFighter_B","H_HelmetB","ItemCore","Default"]
class H_HelmetB;
class H_PilotHelmetFighter_B : H_HelmetB
{
	MRH_hypoxiaRebreather = 1;
};

class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
//class InventoryItem_Base_F;
    
class MRH_AAD_Item: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_MRHHaloGear_AADINvItem;
	model = "\MRHHaloGear\Models\cypres2aad.p3d";
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	 //simulation= "ItemMineDetector"
	editorCategory = "EdCat_Equipment";
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
	editorSubcategory = "EdSubcat_InventoryItems";
	picture = "\MRHHaloGear\paa\aadPreview.paa";
	descriptionShort = $STR_MRH_CFGWP_TabletDescription;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=1;//en lb*10
			};

};
