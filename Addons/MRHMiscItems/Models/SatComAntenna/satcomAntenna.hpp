class MRH_MT_SatCom_Antenna_Base: Items_base_F {
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
	editorPreview = "\MRHMiscItems\Models\SatComAntenna\Data\antennaPreview.jpg";
	//_generalMacro = "Land_BottlePlastic_V2_F";
	scope = 1;
	scopeCurator = 0;
	displayName = $STR_MRH_MRHMiscItems_TrivecAventSATCOMAnt;
	model = "\MRHMiscItems\Models\SatComAntenna\MRH_SatCom_2.p3d";
	
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
	////


	
	
};

class MRH_MT_SatCom_Antenna: MRH_MT_SatCom_Antenna_Base {

	scope = 2;
	scopeCurator = 2;

	////
	ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
        ace_dragging_dragPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo)
        ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo)

        // Carrying
        ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
        ace_dragging_carryPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo)
        ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo)
	/////
	class ACE_Actions
	{
		class ACE_MainActions
		{
			displayName = $STR_MRH_MRHMiscItems_AceInteractionsMain;
			icon = "";
			distance = 2;
			selection = "mem01";
			
			
			class AntennaConnectTablet {
					displayName = $STR_MRH_MRHMiscItems_connectantennatab;
					condition = "('MRH_SoldierTab' in items MRH_player) && ((MRH_player getVariable ['MRH_AntennaLinkedToSoldierTablet',objNull]) != _target)";
					exceptions[] = {};
					statement = "[_target,MRH_player] call MRH_fnc_MilsimTools_MiscItems_handleAntennaConnection;";
					icon = "\MRHMarkers\paa\iconconnect";
					
				};
			class AntennaFold {
					displayName = $STR_MRH_MRHMiscItems_foldAntenna;
					condition = "true";
					exceptions[] = {};
					statement = "_storePos = getPosATL _target; deleteVehicle _target; [_storePos] call MRH_fnc_MilsimTools_MiscItems_foldAntenna;";
					icon = "\MRHMiscItems\Models\SatComAntenna\Data\bagIco_ca.paa";
					//selection = "mem01";
					//distance = 2;
				};
			
		};
	};
	/*
	class ACE_Actions {
		class ACE_AntennaOptions 
		{
			displayName = $STR_MRH_CFGACEINTERACT;
			icon = "\MRHSatellite\Paa\iconantenna.paa";
			distance = 2;
			selection = "mem01";
				class Connect {
					displayName = $STR_MRH_CFGACECONNECTTOUTD;
					condition = "('MRH_TacticalDisplay' in items player) && ((player getVariable ['MRH_AntennaLinkedToTablet',objNull]) != _target)";
					exceptions[] = {};
					statement = "player setVariable ['MRH_AntennaLinkedToTablet',_target];_target say3d 'MRH_SAT_AntennaLinked';";
					icon = "\MRHSatellite\Paa\iconconnect.paa";
					//selection = "mem01";
					//distance = 2;
				};
				
				class Fold {
					displayName = $STR_MRH_CFGACEFOLDANTENNA;
					condition = "true";
					exceptions[] = {};
					statement = "_storePos = getPosATL _target; deleteVehicle _target; [_storePos] call MRH_fnc_foldAntenna;";
					icon = "\MRHSatellite\Models\Antenna\antennaInvIcon.paa";
					//selection = "mem01";
					//distance = 2;
				};
		}; 
	};
	*/
	
	
	
};