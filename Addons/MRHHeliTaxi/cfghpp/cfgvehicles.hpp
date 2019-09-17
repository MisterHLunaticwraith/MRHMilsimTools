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
        class MRH_HeliTaxi_cancelMedEvac
        {
            displayName = $STR_MRH_HeliTaxi_CancelMedEvac;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionsCancelMedEvac";
            exceptions[] = {"isNotSwimming"};
            statement = "call MRH_fnc_MilsimTools_HeliTaxi_cancelMedEvacAction";
            icon = "";
        };

        class MRH_HeliTaxi_SendMedEvacToBase
        {
            displayName = $STR_MRH_HeliTaxi_MedEvacSendToHeal;
            condition = "call MRH_fnc_MilsimTools_HeliTaxi_conditionsSendMedEvac";
            exceptions[] = {"isNotSwimming","isNotInside"};
            statement = "[[MRH_player],MRH_fnc_MilsimTools_HeliTaxi_medeVacGoAndHeal] RemoteExec ['Spawn',2];";
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
                        statement = "MRH_player moveinCargo _target";
                        icon = PAAPATH(ladder.paa); 
                        distance = 4; 
                        exceptions[] = {"isNotSwimming"};
                };
            };
    };
};

class Logic;
class Module_F: Logic
{
    class ArgumentsBaseUnits
    {
        class Units;
    };
    class ModuleDescription
		{
			
			class Anything;
			class AnyPerson;
            class AnyVehicle;
			class AnyStaticObject;
			class AnyBrain;
			class AnyAI;
			class AnyPlayer;
			class Curator_F;
			class EmptyDetector;
			class Condition;
		};
    class AttributesBase
    {
        class Default;
        class Edit;
        class Combo;
        class Checkbox;
        class CheckboxNumber;
        class ModuleDescription;
        class Units;
    };
};


class MRH_physicalHeli : Module_F
{
 

		scope = 2;
		scopeCurator = 1;

		displayName = $STR_MRH_HeliTaxi_moduleTaxiName;
		icon = "\MRHHeliTaxi\Paa\heli.paa";
		picture = "\MRHHeliTaxi\Paa\heli.paa";
		portrait = "\MRHHeliTaxi\Paa\heli.paa";
        vehicleClass = "Modules";
		category = "MRH_MilsimTools_Modules";
		function = "MRH_fnc_MilsimTools_HeliTaxi_isTaxiModuleInit";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;

        dlc = "MRHMilsimTools";


        class Attributes: AttributesBase
		{
			class Units: Units
			{
				property="MRH_HeliModule_Synched";
			};
            class ModuleDescription : ModuleDescription 
            {};
        };

		class Arguments: ArgumentsBaseUnits
		{
            
			class Units: Units
			{
			};
			
		};
       
        class ModuleDescription : ModuleDescription
        {
            description= $STR_MRH_HeliTaxi_moduleTaxiDesc;
            position = 0;
			direction = 0;
			optional = 0;
			duplicate = 0;
			synced[] = {"AnyVehicle","AnyPerson"};
			sync[]=
			{
				"AnyVehicle","AnyPerson"
			};

        };
        
		
};
