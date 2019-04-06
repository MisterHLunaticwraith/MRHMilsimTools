	#include "MRH_C_Path.hpp"
	
	class Man;
    class CAManBase: Man 
	{
		/*
		class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_EnhancedMap_replaceVanillaMap;";
		
		};
		*/
        class ACE_SelfActions 
		{
			class ACE_Equipment {

				class MRH_Ace_UnFoldMap
				{
					displayName = $STR_MRH_EnhancedMap_UnfoldACE;
					condition = "('MRH_Map' in items MRH_player) && !(call MRH_fnc_MilsimTools_EnhancedMap_isFoldedMapOpen)";
					exceptions[] = {"isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_EnhancedMap_unfoldMap;";
					icon = PAAPATH(unfold.paa);
					
				};
				class MRH_Ace_ShowMiniMap
				{
					displayName = $STR_MRH_EnhancedMap_ShowFoldACE;
					condition = "('MRH_Map' in items MRH_player) && !(call MRH_fnc_MilsimTools_EnhancedMap_isFoldedMapOpen)";
					exceptions[] = {"isNotSitting","notOnMap","isNotInside"};
					statement = "call MRH_fnc_MilsimTools_EnhancedMap_showFoldableMap";
					icon = PAAPATH(map.paa);
					
				};
				class MRH_Ace_CloseMiniMap
				{
					displayName = $STR_MRH_EnhancedMap_CloseFoldACE;
					condition = "(call MRH_fnc_MilsimTools_EnhancedMap_isFoldedMapOpen)";
					exceptions[] = {"isNotSitting","notOnMap","isNotInside"};
					statement = "call MRH_fnc_MilsimTools_EnhancedMap_closeFoldableMap";
					icon = PAAPATH(fold.paa);
					
				};
			
				class MRH_Ace_CenterMiniMap
				{
					displayName = $STR_MRH_EnhancedMap_ChooseFoldZACE;
					condition = "('MRH_Map' in items MRH_player) && (visibleMap)";
					exceptions[] = {"isNotSitting","notOnMap","isNotInside"};
					statement = "call MRH_fnc_MilsimTools_EnhancedMap_setFoldableMapCenter";
					icon = PAAPATH(select.paa);
					
				};
			};

		};
	};

class Land_Map_blank_F;
class MRH_MapObject: Land_Map_blank_F {
	author = "Mr H";
	scope = 2;
	scopeCurator = 2;
	displayName = $STR_MRH_EnhancedMap_MRHMapObject;



		class EventHandlers {
		init = "_this call MRH_fnc_MilsimTools_EnhancedMap_mapInit;";
		
	};
	/////
	/*
	class ACE_Actions {
		class ACE_MainActions;
		
		
		class ACE_MRH_MapActions : ACE_MainActions
		{
			displayName = "Map actions";
			icon = "";
			distance = 2;
			selection = "mem01";
				class LookAt {
					displayName = "Look at the map";
					condition = "true";
					exceptions[] = {};
					statement = "call MRH_fnc_MilsimTools_EnhancedMap_lookAtMap";
					icon = "";
					//selection = "mem01";
					//distance = 2;
				};
				
				class Fold {
					displayName = "Fold and collect map";
					condition = "true";
					exceptions[] = {};
					statement = "[_target] call MRH_MilsimTools_EnhancedMap_collectMap;";
					icon = "";
					//selection = "mem01";
					//distance = 2;
				};
		};
					
		
	};
	*/
		ace_dragging_canDrag = 1;  // Can be dragged (0-no, 1-yes)
        ace_dragging_dragPosition[] = {0, 1.2, 0};  // Offset of the model from the body while dragging (same as attachTo)
        ace_dragging_dragDirection = 0;  // Model direction while dragging (same as setDir after attachTo)

        // Carrying
        ace_dragging_canCarry = 1;  // Can be carried (0-no, 1-yes)
        ace_dragging_carryPosition[] = {0, 1.2, 1.6};  // Offset of the model from the body while dragging (same as attachTo)
        ace_dragging_carryDirection = 0;  // Model direction while dragging (same as setDir after attachTo)
	

};
