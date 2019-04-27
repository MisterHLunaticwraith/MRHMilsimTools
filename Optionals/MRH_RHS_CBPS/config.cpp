
class CfgPatches {
	class MRH_RHS_CBPS{
		units[] = {"MRH_RHS_CBPS_module"}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_main","MRHMilsimTools","rhsusf_c_fmtv","A3_Soft_F_HEMTT","MRHZeusModules"};
		version = 1.0.0;
		versionStr = "1.0.0";
		versionAr[] = {1,0,0};
		versionDesc = "MRH Milsim Tools -Optionals RHS CBPS";
		versionAct = "call compile preProcessFileLineNumbers '\MRHMilSimTools\about.sqf'";
		author = "Mr H.";
      authors[]= {"Mr H."};
		url = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
	};
};

class CfgMods {
    class MRHMilsimToolsOPT_RHS_CBPS {
        dir = "@MRHMilsimTools - Optionals - RHS_CBPS";
        name = "Mister H's Milsim Tools -Optionals";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
        description = "Issue Tracker: https://github.com/MisterHLunaticwraith/MRHMilsimTools/issues";
    };
};

#include "\MRH_RHS_CBPS\cfgSettings.hpp"


//----------addon dialogs
//#include "MRH_RHS_CBPS\Dialogs\.hpp"

//---------- addon cfgs
class cfgFunctions
{
#include "\MRH_RHS_CBPS\Functions\cfgFunctions.hpp"
};

class Extended_PreInit_EventHandlers
{
   class MRHMilsimTools_RHS_CBPS_CBA_Settings
   {
      init = "call compile preProcessFileLineNumbers '\MRH_RHS_CBPS\XEH_preinit.sqf'";
   };  
	   
};
/*
class cfgSounds
{
	#include "MRH_RHS_CBPS\Sounds\cfgsounds.hpp"
};
*/
class ctrlCombo;
class ctrlStatic;
class cfg3DEN
{
	#include "\MRH_RHS_CBPS\cfg3DEN.hpp"
};

class cfgVehicles
{
	#include "\MRH_RHS_CBPS\cfghpp\cfgvehicles.hpp"
	#include "\MRH_RHS_CBPS\cfghpp\zeusModule.hpp"
};

class cfgMRHcompositions
{
	#include "\MRH_RHS_CBPS\cfgMRHcompositions.hpp"
};

#include "\MRH_RHS_CBPS\Dialogs\zeuscbps.hpp"

class Extended_Init_EventHandlers {
    class rhsusf_M1083A1P2_B_fmtv_usarmy {
        class MRH_RHS_CBPS_init_eh {
            init = "_this call MRH_fnc_MilsimTools_RHS_CBPS_deployedInit";
        };
    };
};
/*
class cfgWeapons
{
	#include "MRH_RHS_CBPS\cfghpp\cfgweapons.hpp"
};
*/
//------------Extended XEH
/*
class Extended_PostInit_EventHandlers
{
   
   class MRH_RHS_CBPS_
   {
      clientInit = "call compile preProcessFileLineNumbers 'MRH_RHS_CBPS\Functions\fn_.sqf'";
   };
      
	
};
*/
