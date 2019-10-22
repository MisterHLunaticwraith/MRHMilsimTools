class MRH_USB_ThumbDrive : Items_base_F {
	author = "Mr H";
	mapSize = 0.07;
	class SimpleObject {
		eden = 1;
		animate[] = {};
		hide[] = {};
		verticalOffset = 0.131;
		verticalOffsetWorld = 0;
		init = "''";
	};
	editorPreview = "\MRHMiscItems\Models\UsbThumbDrive\Data\MRH_USB_ThumbDrive.jpg";
	//_generalMacro = "Land_BottlePlastic_V2_F";
	scope = 2;
	scopeCurator = 2;
	displayName = $STR_MRH_MRHMiscItems_USBDriveDisp;
	model = "\MRHMiscItems\Models\UsbThumbDrive\MRH_usbDrive.p3d";
	
	icon = "iconObject_circle";
	editorCategory = "EdCat_MRH_Misc";
	editorSubcategory = "EdSubcat_MRH_Props";
	vehicleClass = "Small_items";
	destrType = "DestructNo";
	cost = 100;
	hiddenSelections[] = {};
	hiddenSelectionTextures[] = {};
	// ThingX
	simulation = "thingX";
	
	/*
	class ACE_Actions {
		class USB_ThumbAce 
		{
			displayName = "test";
			icon = "";
			distance = 2;
			selection = "mem01";
				class Connect {
					displayName = "test";
					condition = "true";
					exceptions[] = {};
					statement = "hint 'ok'";
					icon = "";
					//selection = "mem01";
					//distance = 2;
				};
				
		}; 
	};
	*/
	
	
	
};