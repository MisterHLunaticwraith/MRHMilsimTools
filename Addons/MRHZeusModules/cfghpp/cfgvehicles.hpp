#include "MRH_C_Path.hpp"

	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription
		{
			class AnyPlayer;
			class AnyBrain;
			class EmptyDetector;
			class AnyPerson;
		};
	};

	class MRH_Module_Base : Module_F
	{
		mapSize = 1;
		author = "Mr H.";
		vehicleClass = "Modules";
		category = "MRH_MilsimTools_Modules";
		side = 7;

		scope = 1;				// Editor visibility; 2 will show it in the menu, 1 will hide it.
		scopeCurator = 1;		// Curator visibility; 2 will show it in the menu, 1 will hide it.

		displayName = "MRH Base Module";	// Name displayed in the menu
		icon = "";		// Map icon. Delete this entry to use the default icon
		picture = "";
		portrait = "";

		function = "";			// Name of function triggered once conditions are met
		functionPriority = 1;	// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 2;			// 0 for server only execution, 1 for remote execution on all clients upon mission start, 2 for persistent execution
		isTriggerActivated = 0;	// 1 for module waiting until all synced triggers are activated
		isDisposable = 0;		// 1 if modules is to be disabled once it's activated (i.e., repeated trigger activation won't work)
		// curatorInfoType = "RscDisplayAttributeModuleNuke";	// Menu displayed when the module is placed or double-clicked on by Zeus

        dlc = "MRHMilsimTools";

		class Arguments {};
		class ModuleDescription: ModuleDescription
		{
			description = "MRH Milsim Tools Module Base";
		};
	};

	class MRH_HeliTaxiControls : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_HeliTaxiControls";
			displayName = $STR_MRH_MRHMRHZeusModules_HeliTaxiSettingsMName;
			function = QFUNC(heliPerSideModule);
			icon = PAAPATH(ModuleHeli);
			portrait = PAAPATH(ModuleHeli);
	};

		class MRH_SimpleConv : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_SimpleConv";
			displayName = $STR_MRH_MRHMRHZeusModules_SimpleConvIntMName;
			curatorCanAttach = 1;
			function = QFUNC(simpleConvModule);
			icon = PAAPATH(ModuleSimpleConv);
			portrait = PAAPATH(ModuleSimpleConv);
	};

		class MRH_AttributeVar : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_AttributeVAr";
			displayName = $STR_MRH_MRHMRHZeusModules_AttributeVarNameMName;
			curatorCanAttach = 1;
			function = QFUNC(attributeVariableNameModule);
			icon = PAAPATH(ModuleCodeRelated);
			portrait = PAAPATH(ModuleCodeRelated);
	};

	class MRH_AddObjectToHalo : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_AddObjectToHalo";
			displayName = $STR_MRH_MRHMRHZeusModules_SelectObjectForHaloMName;
			curatorCanAttach = 1;
			function = QFUNC(addObjectToHaloModule);
			icon = PAAPATH(ModuleHaloDrop);
			portrait = PAAPATH(ModuleHaloDrop);
	};

		class MRH_SimpleHaloJump : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_SimpleHaloJump";
			displayName = $STR_MRH_MRHMRHZeusModules_SimpleHaloJumpMName;
			function = QFUNC(simpleHaloJumpModule);
			icon = PAAPATH(ModuleHaloDrop);
			portrait = PAAPATH(ModuleHaloDrop);
	};

	class MRH_attributeData : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_attributeData";
			displayName = $STR_MRH_MRHMRHZeusModules_AttributeDataName;
			curatorCanAttach = 1;
			function = QFUNC(attributeDataModule);
			icon = PAAPATH(ModuleDataSource);
			portrait = PAAPATH(ModuleDataSource);
	};

		class MRH_createData : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_createData";
			displayName = $STR_MRH_MRHMRHZeusModules_CreateDataName;
			function = QFUNC(dataCreatorModule);
			icon = PAAPATH(ModuleData);
			portrait = PAAPATH(ModuleData);
	};

	class MRH_attributeDataForHack : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_attributeDataForHack";
			displayName = $STR_MRH_MRHMRHZeusModules_CreateHackName;
			curatorCanAttach = 1;
			function = QFUNC(attributeDataForHackModule);
			icon = PAAPATH(ModuleHack);
			portrait = PAAPATH(ModuleHack);
	};

		class MRH_setForSurrender : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_setForSurrender";
			displayName = $STR_MRH_MRHMRHZeusModules_SetSurrName;
			curatorCanAttach = 1;
			function = QFUNC(setForSurrenderModule);
			icon = PAAPATH(ModuleSurrender);
			portrait = PAAPATH(ModuleSurrender);
	};

	class MRH_setZeus : MRH_Module_Base
	{
			scopeCurator = 2;
			_generalMacro = "MRH_setZeus";
			displayName = $STR_MRH_MRHMRHZeusModules_setZeusName;
			curatorCanAttach = 1;
			function = QFUNC(setZeus);
			icon = PAAPATH(ModuleZeus);
			portrait = PAAPATH(ModuleZeus);
	};