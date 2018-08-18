#include "MRH_C_Path.hpp"
class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
//class InventoryItem_Base_F;
    
class MRH_Map: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_EnhancedMap_MAP_INVNAME;
	model = "\A3\Structures_F\Items\Documents\Map_F.p3d";
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	 //simulation= "ItemMineDetector"
	editorCategory = "EdCat_Equipment";
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
	editorSubcategory = "EdSubcat_InventoryItems";
	picture = PAAPATH(mapicon.paa);
	descriptionShort = "A map";
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=2;//en lb*10
			};

};
