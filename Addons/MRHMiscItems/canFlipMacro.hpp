class ACE_Actions
{
			
	class ACE_MainActions
	{
		
		displayName = $STR_MRH_MRHMiscItems_AceInteractionsMain;
            icon = "";
            distance = 3;
            selection = "mem01";
		
		class ACE_flip {
			displayName = $STR_MRH_MRHMiscItems_FlipAction;
			condition = "[([_target] call ace_interaction_fnc_canFlip),true] select (_target isKindOf 'MRH_FOB_container')";
			statement = "['ace_interaction_flip',_target,_target] call CBA_fnc_targetEvent";
		};
	};
};