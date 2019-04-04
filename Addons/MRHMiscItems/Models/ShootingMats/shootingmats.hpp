/*
class MRH_ShootingMat_Folded_Khaki : ShootingMat_01_folded_Khaki_F
{
	author = "Mr H";
	scope = 2;
	scopeCurator = 2;
	displayName = "Shooting Mat, Folded";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Utilities";
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_FoldedMatInit;";
		
	};
};

class MRH_ShootingMat_Folded_Olive : ShootingMat_01_folded_Olive_F
{
	author = "Mr H";
	scope = 2;
	scopeCurator = 2;
	displayName = "Shooting Mat, Folded";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Utilities";
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_FoldedMatInit;";
		
	};
};
*/
class MRH_ShootingMat_Khaki  : ShootingMat_01_Khaki_F
{
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Utilities";
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_UnFoldedMatInit;";
		
	};

	
};

class MRH_ShootingMat_Olive  : ShootingMat_01_Olive_F
{
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Utilities";
	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_UnFoldedMatInit;";
		
	};

	
};
