	#include "MRH_C_Path.hpp"
/*
["H_PilotHelmetFighter_B","H_HelmetB","ItemCore","Default"]
class H_PilotHelmetFighter_B 
{
	MRH_hypoxiaRebreather = 1;
};
*/
class Bag_Base;
class B_Parachute : Bag_Base
{};
class MRH_AADEquippedParachute : B_Parachute
{
	displayName = $STR_MRH_MRHHaloGear_AADChute;
	scope = 2;
};
class ACE_NonSteerableParachute;
class MRH_AADEquippedNSParachute : ACE_NonSteerableParachute
{
	displayName = $STR_MRH_MRHHaloGear_AADChuteNS;
	scope = 2;
};

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

				class MRH_SetAAS
				{
					displayName = $STR_MRH_MRHHaloGear_AADSettingSelfAC;
					condition = "(([player] call MRH_fnc_MilsimTools_HaloGear_hasAADParachute) && (['MRH_MilsimTools_HaloGear_allowManualAADSetting']call cba_settings_fnc_get))";
					exceptions[] = {"isNotSitting","isNotInside"};
					statement = "createDialog 'MRH_AAS_Cypres2Menu'";
					icon = "";
					
				};
				
			};

		};
	};