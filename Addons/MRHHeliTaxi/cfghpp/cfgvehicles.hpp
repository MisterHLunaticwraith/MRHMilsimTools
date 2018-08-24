#include "MRH_C_Path.hpp"
class Man;
class CAManBase: Man 
{

	class ACE_SelfActions 
	{
        class MRH_HeliTaxi_Call
        {
            displayName = $STR_MRH_HeliTaxi_RequestAirTransport;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionCall";
            exceptions[] = {"isNotSwimming"};
            statement = "call MRH_fnc_MilsimTools_HeliTaxi_helicopterChoice";
            icon = PAAPATH(heli.paa);
        };
        class MRH_HeliTaxi_setCourse
        {
            displayName = $STR_MRH_HeliTaxi_SetDestination;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionSetHeliCourse";
            exceptions[] = {"isNotInside"};
            statement = "call MRH_fnc_MilsimTools_HeliTaxi_openSetCourseInterface";
            icon = PAAPATH(waypoint.paa);
        };
         class MRH_HeliTaxi_cancel
        {
            displayName = $STR_MRH_HeliTaxi_HeliCancelAce;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionsCancel";
            exceptions[] = {"isNotSwimming"};
            statement = "call MRH_fnc_MilsimTools_HeliTaxi_cancelHeliAction";
            icon = "";
        };
        class MRH_HeliTaxi_forceLand
        {
            displayName = $STR_MRH_HeliTaxi_forceLandAction;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionForceLand";
            exceptions[] = {"isNotInside"};
            statement = "call MRH_fnc_MilsimTools_HeliTaxi_forceLandAction";
            icon = "";
        };
	

	};

};

class Air;
class Helicopter : Air
{
    class ACE_Actions
    {
        class ACE_MainActions
            {
                class MRH_climb_in
                {
                        displayName = $STR_MRH_HeliTaxi_ClimbInACe;
                        condition = "[_target] call MRH_fnc_MilsimTools_HeliTaxi_conditionClimbIn";
                        statement = "player moveinCargo _target";
                        icon = PAAPATH(ladder.paa); 
                        distance = 4; 
                        exceptions[] = {"isNotSwimming"};
                };
            };
    };
};