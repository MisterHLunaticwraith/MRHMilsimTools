
class MRH_MedicalTent : ACE_medicalSupplyCrate_advanced

{
	displayname = $STR_MRH_MRHMiscItems_FieldMedicTentVehicleDisp;
	editorPreview = "\MRHMiscItems\Models\MedicalTent\MRH_MedicalTent.jpg";
	scope = 2;
	scopeCurator = 2;
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Utilities";
	//hiddenSelections[] = {"Camo"};
	//hiddenSelectionsTextures[] = {"\MRHMiscItems\Models\MedicalTent\tentdometest_co.paa"};
	model = "\MRHMiscItems\Models\MedicalTent\medicaldometent.p3d";
	ace_dragging_canDrag = 0;  // Can be dragged (0-no, 1-yes)
    ace_dragging_canCarry = 0;  // Can be carried (0-no, 1-yes)

	 class ACE_Actions {
        class ACE_MainActions
        {
            displayName = $STR_MRH_MRHMiscItems_AceInteractionsMain;
            icon = "";
            distance = 2;
            selection = "mem01";  
                
        };
        
    };
};

class MRH_MedicalTent_Special : MRH_MedicalTent
{
	scope = 1;
	scopeCurator = 1;

	class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_MiscItems_medicalTentSpawn;";
		
	};
};