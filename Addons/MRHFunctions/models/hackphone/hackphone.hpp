class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
//class InventoryItem_Base_F;
    
class MRH_HackingTool: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_HP_HackphoneDisplayName;
	model = "\MRHFunctions\models\hackphone\hackphone.p3d";
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	 //simulation= "ItemMineDetector"
	editorCategory = "EdCat_Equipment";
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
	editorSubcategory = "EdSubcat_InventoryItems";
	picture = "\MRHFunctions\models\hackphone\hackphoneIcon.paa";
	descriptionShort = $STR_MRH_HP_HackphoneDescShort;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=5.6;//en lb*10
			};

};
