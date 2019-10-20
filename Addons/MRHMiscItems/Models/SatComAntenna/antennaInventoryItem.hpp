class MRH_MT_FoldedSatcomAntenna: CBA_MiscItem
{
	author = "Mr H.";
	displayName = $STR_MRH_MRHMiscItems_satComBagAntennaDisp;
	model = "\MRHMiscItems\Models\SatComAntenna\antennaBag.p3d";
	scope = 2;      
	scopeArsenal = 2;
	scopeCurator = 2;
	 //simulation= "ItemMineDetector"
	editorCategory = "EdCat_Equipment";
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Default\Prop.jpg";
	editorSubcategory = "EdSubcat_InventoryItems";
	picture = "\MRHMiscItems\Models\SatComAntenna\Data\bagIco_ca.paa";
	descriptionShort = $STR_MRH_MRHMiscItems_satcomBagdesc;
	//type = 0;
	ace_arsenal_hide = 0;
	class ItemInfo: CBA_MiscItem_ItemInfo
			{
				mass=50;//en lb*10
			};

};

