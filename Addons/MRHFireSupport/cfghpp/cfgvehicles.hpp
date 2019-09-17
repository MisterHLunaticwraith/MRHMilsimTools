#include "MRH_C_Path.hpp"

class Man;
class CAManBase: Man 
{

	class ACE_SelfActions 
	{
		class MRH_FireSupports_Base_Action
		{
			
				displayName = $STR_MRH_FireSupport_AceBaseActionCall;
				condition = "";
				exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
				statement = "";
				icon = PAAPATH(radiocall.paa);
				

				class MRH_FS_CallArty
				{
					displayName = $STR_MRH_FireSupport_CallArtilleryStrikeAceAction;
					condition = "['Arty'] call MRH_fnc_MilsimTools_FireSupport_conditions";
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_FireSupport_OpenArtyInterface;";
					icon = PAAPATH(mortar.paa);
				};
				
				class MRH_FS_CallCAS
				{
					displayName = $STR_MRH_FireSupport_CallCASACEAction;
					condition = "['CAS'] call MRH_fnc_MilsimTools_FireSupport_conditions";
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_FireSupport_OpenCASInterface;";
					icon = PAAPATH(fighterjet.paa);
				};
				class MRH_FS_CallSupply
				{
					displayName = $STR_MRH_FireSupport_SC_AskSupplyAceAction;
					condition = "['SupplyD'] call MRH_fnc_MilsimTools_FireSupport_conditions";
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_FireSupport_openSuppliesInterface;";
					icon = PAAPATH(paradrop.paa);
				};
				class MRH_FS_CallMedEvac
				{
					displayName = $STR_MRH_HeliTaxi_callMedEvac;
					condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionsMEDEVAC";
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_HeliTaxi_openMedEvacInterface;";
					icon = PAAPATH(medical.paa);
				};
				class MRH_FS_ShowSupportsAvailabilities
				{
					displayName = $STR_MRH_FireSupport_AceShowAvailabilities;
					condition = "call MRH_fnc_MilsimTools_FireSupport_conditionsShowAvailability";
					exceptions[] = {"isNotInside", "notOnMap", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_FireSupport_displayAvailability";
					//icon = PAAPATH(medical.paa);
				};


			
	
		}	

	}

};