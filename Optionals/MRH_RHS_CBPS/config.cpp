
class CfgPatches {
	class MRH_RHS_CBPS{
		units[] = {"MRH_RHS_CBPS_module"}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_main","MRHMilsimTools","rhsusf_c_fmtv","A3_Soft_F_HEMTT","MRHZeusModules"}; //
	};
};



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
