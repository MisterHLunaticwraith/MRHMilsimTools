
class CfgPatches {
	class MRHHaloGear
	{
		units[] = {"MRH_AADEquippedParachute","MRH_AADEquippedNSParachute"}; //
		weapons[] = {"MRH_AAD_Item","MRH_HaloMaskNoESS","MRH_HaloMask","MRH_HaloMaskBroken"}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};

#include "\MRHHaloGear\Models\cfgGlasses.hpp"

//----------addon dialogs
#include "\MRHHaloGear\Dialogs\AASDialogs.hpp"

//---------- addon cfgs

class cfgFunctions
{
#include "\MRHHaloGear\Functions\cfgFunctions.hpp"
};


class cfgSounds
{
	#include "\MRHHaloGear\Sounds\cfgsounds.hpp"
};


class cfgVehicles
{
	#include "\MRHHaloGear\cfghpp\cfgvehicles.hpp"
};


class cfgWeapons
{
	#include "\MRHHaloGear\cfghpp\cfgweapons.hpp"
};

class Extended_PostInit_EventHandlers
{

   class MRHHaloGear_parseSettings
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHHaloGear\Functions\fn_MilsimTools_HaloGear_parseSettings.sqf'";
   };
      
	
};
