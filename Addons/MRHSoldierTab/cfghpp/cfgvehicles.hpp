	class Man;
    class CAManBase: Man 
	{
        class ACE_SelfActions 
		{
			class ACE_Equipment {

				class MRH_Ace_USE_SOLDIERPDA
				{
					displayName = $STR_MRH_ST_ACE_EQUIPOPENPDA;
					condition = "'MRH_SoldierTab' in items MRH_player";
					exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
					statement = "call MRH_fnc_MilsimTools_SoldierTab_OpenTablet;";
					icon = "\MRHSoldierTab\models\Tablet\tableticon.paa";
					
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


class MRH_HQ_Module_Base : Module_F
{
 

		scope = 1;
		scopeCurator = 1;

		displayName = "HQBASE";
		icon = "\MRHMarkers\paa\radiocall.paa";
		picture = "\MRHMarkers\paa\radiocall.paa";
		portrait = "\MRHMarkers\paa\radiocall.paa";
        vehicleClass = "Modules";
		category = "MRH_MilsimTools_Modules";
		function = "MRH_fnc_MilsimTools_SoldierTab_HQModuleInit";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;

        dlc = "MRHMilsimTools";


        class Attributes: AttributesBase
		{
			class Edit: Edit
			{
				displayName = $STR_MRH_ST_ModuleAttributeHQNAME;
				property="MRH_HQModule_HQName";
				defaultValue = "'PAPA BEAR'";
				expression = "_this setVariable ['MRH_HQModule_HQName',_value];";
				validate = "none";
				typeName = "STRING";
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
            description= $STR_MRH_ST_moduleDescHQM;
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
class  B_MRH_HQ_Module : MRH_HQ_Module_Base
{
 

		scope = 2;
		//scopeCurator = 1;
		displayName = $STR_MRH_ST_moduleNameHQWEST;
		
};

class  O_MRH_HQ_Module : MRH_HQ_Module_Base
{
 

		scope = 2;
		//scopeCurator = 1;
		displayName = $STR_MRH_ST_moduleNameHQEAST;
};

class  I_MRH_HQ_Module : MRH_HQ_Module_Base
{
 

		scope = 2;
		//scopeCurator = 1;
		displayName = $STR_MRH_ST_moduleNameHQIND;
};

class  C_MRH_HQ_Module : MRH_HQ_Module_Base
{
 

		scope = 2;
		//scopeCurator = 1;
		displayName = $STR_MRH_ST_moduleNameHQCIV;
};