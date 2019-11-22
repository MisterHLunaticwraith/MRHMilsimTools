class ACE_Actions
{
			
	class ACE_MainActions
	{
		
		displayName = $STR_MRH_MRHMiscItems_AceInteractionsMain;
            icon = "";
            distance = 3;
            selection = "mem01";
		
		class MRH_SatCom {
			displayName = $STR_MRH_core_connectToVehSat;
			condition = "([_target]call MRH_fnc_MilsimTools_Core_vehHasSatCom)&& !([MRH_player] call MRH_fnc_MilsimTools_Core_isConnectedToAntenna)";
			statement = "[_target,MRH_player] call MRH_fnc_MilsimTools_MiscItems_handleAntennaConnection";
			icon = "\MRHMarkers\paa\icoantenna.paa";
		};
	};
};