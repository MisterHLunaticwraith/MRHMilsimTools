class MRH_projectionScreenSmall: Banner_01_F {
			author = "Mr H";
			editorPreview = "\MRHMiscItems\Models\ProjectionScreen\Data\screenPreview.jpg";
			_generalMacro = "Banner_01_F";
			scope = 2;
			scopeCurator = 2;
			displayName = $STR_MRH_MRHMiscItems_smallProjScreen;
			model = "\MRHMiscItems\Models\ProjectionScreen\projectionScreenSmall.p3d";
			icon = "iconObject_circle";
			editorCategory = "EdCat_MRH_Misc";
			editorSubcategory = "EdSubcat_MRH_Props";
			vehicleClass = "Small_items";
			destrType = "DestructNo";
			hiddenSelections[] = {"ScreenImg","ScreenOverlay","Camo"};
			hiddenSelectionsTextures[] = {"","","\MRHMiscItems\Models\ProjectionScreen\Data\ProjectionScreen_co.paa"};
		};

class MRH_projectionScreenLarge : MRH_projectionScreenSmall
{
	displayName = $STR_MRH_MRHMiscItems_largeProjScreen;
	model = "\MRHMiscItems\Models\ProjectionScreen\projectionScreenLarge.p3d";
};