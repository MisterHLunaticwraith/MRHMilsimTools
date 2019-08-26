	#include "MRH_C_Path.hpp"
class Boat_F;
class SDV_01_base_F : Boat_F
{
	class ACE_SelfActions {
            class ACE_Passengers {
                displayName = $STR_MRH_MRHInsertionHandler_detachSDVAceAction;
                condition = "[_target] call MRH_fnc_MilsimTools_InsertionHandler_canDetachSDV";
                statement = "[_target] call MRH_fnc_MilsimTools_InsertionHandler_detachSDV";
                
            };
        };
};