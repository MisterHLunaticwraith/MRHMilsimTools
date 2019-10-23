class CfgPatches {
	class MRHMilsimTools{
		units[] = {}; //
		weapons[] = {}; //
		requiredVersion = 0.1; //
		requiredAddons[] = {"cba_main"};
		version = 1.17.8;
		versionStr = "1.17.8";
		versionAr[] = {1,17,8};
		versionDesc = "MRH Milsim Tools";
		versionAct = "call compile preProcessFileLineNumbers '\MRHMilSimTools\about.sqf'";
		author = "Mr H.";
      authors[]= {"Mr H."};
		url = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
	};
		
		
};

class CfgMods {
    class MRHMilsimTools {
        dir = "@MRHMilsimTools";
        name = "Mister H's Milsim Tools";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://mrhmilsimtools-arma3-mod.wikia.com/wiki/MRHMilsimTools_ARMA3_Mod_Wiki";
        description = "Issue Tracker: https://github.com/MisterHLunaticwraith/MRHMilsimTools/issues";
    };
};

#include "\MRHMilSimTools\cfgSettings.hpp"

class Extended_PreInit_EventHandlers
{
   class MRHMilsimTools_CBA_Settings
   {
      init = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\SettingsPreInit\CBASettings.sqf'";
   }; 
   class MRHMilsimTools_CBA_Settings_keybinds
   {
      init = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\SettingsPreInit\CBAKeys.sqf'";
   };    
	   
};
class Extended_PostInit_EventHandlers
{
   class MRHMilsimTools_Core_SetPlayerIntel
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\fn_MilsimTools_Core_SetPlayerIntel.sqf'";
   };
   
   class MRHMilsimTools_Core_InitPlayerLocal
   {
      clientInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\XEHclient.sqf'";
   };
   
   class MRHMilsimTools_Core_PlayersRegistry
   {
      serverInit = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\XEHserver.sqf'";
   };
   class MRHMilsimTools_Core_Init
   {
      init = "call compile preProcessFileLineNumbers '\MRHMilSimTools\Functions\InitFunctions\XEHinit.sqf'";
   };
   
};

/////=========cfgFunctions========
class CfgFunctions
{
	#include "\MRHMilSimTools\Functions\cfgFunctions.hpp"
};
////=============fincfgFunctions
// =============CFG======================================================

/////=========cfgNotifications=====
class cfgNotifications
{
#include"\MRHMilSimTools\cfghpp\cfgnotifications.hpp"
};
////=============fincfgNotifications
//===cfgMRHRanks
#include"\MRHMilSimTools\cfghpp\cfgMRHrankpictures.hpp"
//==========

#include"\MRHMilSimTools\cfghpp\cfgMRHcompositions.hpp"
#include"\MRHMilSimTools\cfghpp\cfg3DEN.hpp"

class CfgUnitInsignia
{
	class MRH_MedicShoulderPatch
	{
		author = "Mr H.";
		displayName = $STR_MRH_MISC_MedicPatchInsignia;
		texture = "\MRHMilSimTools\paa\medicpatch.paa";
	};
};
class Extended_Init_EventHandlers {
    class CAManBase {
        class MRH_MedicPatch_init {
            init = "_this call MRH_fnc_MilsimTools_Core_assignMedicPatch;";
        };
    };
};
class CfgFontFamilies 
{
   #include "\MRHMilsimTools\Fonts\cfgFontFamilies.hpp"
};

class RscTitles
{
      class MRHEmptyDisplay
   {
      idd=070919;
      movingenable=true;
      onLoad = "uiNamespace setVariable ['MRHEmptyDisplay', _this select 0]";
      duration = "2";
      class controls 
      {
      };
   };
};
#include "\MRHMilSimTools\animations\animations.hpp"
class RscPicture;
//class Watermark;
class RscDisplayCurator 
{
   
	class controls 
	{
      class MRHDummyCuratorCtrl: RscPicture
         {
            idc = 6547;
            show = false;
            text = "";
            x = 1 * safezoneW + safezoneX;
            y = 1 * safezoneH + safezoneY;
            w = 0 * safezoneW;
            h = 0 * safezoneH;
            onLoad = "[(ctrlParent (_this select 0)),'Load'] call MRH_fnc_MilsimTools_Core_curatorViewEH";
            
         };
     
      class Watermark : RscPicture
      {
         onLoad = "(_this select 0) call MRH_fnc_MilsimTools_Core_handleCuratorWaterMark";//to hide check curatorToggleInterface https://community.bistudio.com/wiki/inputAction/actions#Zeus
         
      };
   };
    
};