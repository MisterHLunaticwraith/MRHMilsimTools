class CBA_MiscItem;
class CBA_MiscItem_ItemInfo;
//class InventoryItem_Base_F;
    
class MRH_SoldierTab: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_CFGWP_TabletDisplayName;
	model = "\MRHSoldierTab\models\Tablet\soldiertab.p3d";
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	 //simulation= "ItemMineDetector"
	editorCategory = "EdCat_Equipment";
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
	editorSubcategory = "EdSubcat_InventoryItems";
	picture = "\MRHSoldierTab\models\Tablet\tableticon.paa";
	descriptionShort = $STR_MRH_CFGWP_TabletDescription;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=6.6;//en lb*10
			};

};
