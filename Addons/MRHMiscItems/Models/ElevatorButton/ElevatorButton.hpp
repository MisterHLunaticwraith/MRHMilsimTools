
class MRH_ElevatorButton_Base: Static 
{};
class MRH_ElevatorButton : MRH_ElevatorButton_Base
{
	author = "Mr H";
	mapSize = 0.07;
	/*
	class SimpleObject 
    {
		eden = 1;
		animate[] = {};
		hide[] = {};
		verticalOffset = 0.131;
		verticalOffsetWorld = 0;
		//init = "''";
	};
	*/
	editorPreview = "\MRHMiscItems\Models\ElevatorButton\Data\MRH_ElevatorButton.jpg";
	//_generalMacro = "Land_BottlePlastic_V2_F";
	scope = 2;
	scopeCurator = 2;
	displayName = $STR_MRH_MRHMiscItems_ElButtonDis;
	model = "\MRHMiscItems\Models\ElevatorButton\MRH_EL_Button.p3d";
	
	icon = "iconObject_circle";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Props";
	//vehicleClass = "Small_items";
	destrType = "DestructNo";
	cost = 100;
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {
    "\MRHMiscItems\Models\ElevatorButton\Data\button_co.paa"
    };
	vehicleClass="signs";
	_generalMacro="MRH_ElevatorButton";
	// ThingX
	//simulation = "thingX";
};
/*
class MRH_ElevatorButton_TestHS : MRH_ElevatorButton
{
	hiddenSelections[] = {"camo"};
	hiddenSelectionsTextures[] = {
    "\MRHMiscItems\button_co.paa"
    };
};
*/