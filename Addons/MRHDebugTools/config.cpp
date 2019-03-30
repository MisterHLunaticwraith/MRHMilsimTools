
class CfgPatches {
	class MRHDebugTools{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"MRHMilsimTools"}; //
	};
};



//----------addon dialogs
//#include "MRHDebugTools\Dialogs\.hpp"

//---------- addon cfgs
class cfgFunctions
{
#include "\MRHDebugTools\Functions\cfgFunctions.hpp"
};

class RscTitles
{
	#include "\MRHDebugTools\Dialogs\debugHintBox.hpp"	
};
#include "\MRHDebugTools\Dialogs\logViewer.hpp"
#include "\MRHDebugTools\Dialogs\inputDistDial.hpp"
/*
class cfgSounds
{
	#include "MRHDebugTools\Sounds\cfgsounds.hpp"
};
*/

class cfgVehicles
{
	#include "\MRHDebugTools\cfghpp\cfgvehicles.hpp"
};

/*
class cfgWeapons
{
	#include "MRHDebugTools\cfghpp\cfgweapons.hpp"
};
*/
//------------Extended XEH
/*
class Extended_PostInit_EventHandlers
{
   
   class MRHDebugTools_
   {
      clientInit = "call compile preProcessFileLineNumbers 'MRHDebugTools\Functions\fn_.sqf'";
   };
      
	
};
*/
