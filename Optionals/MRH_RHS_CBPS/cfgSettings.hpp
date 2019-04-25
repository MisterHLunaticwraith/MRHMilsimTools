class CfgSettings {
   class CBA {
      class Versioning {
         
         class MRHMilsimTools {
           // Optional: Manually specify the Main Addon for this mod
           main_addon = "MRHMilsimTools"; // Uncomment and specify this to manually define the Main Addon (CfgPatches entry) of the mod

           // Optional: Add a custom handler function triggered upon version mismatch
           handler = "MRH_fnc_MilsimTools_RHS_CBPS_handleIncorrectVersion"; // Adds a custom script function that will be triggered on version mismatch. Make sure this function is compiled at a called preInit, not spawn/execVM

           // Optional: Dependencies
           // Example: Dependency on CBA
           /*
            class Dependencies {
               CBA[]={"cba_main", {0,8,0}, "true"};
            };
           */

           // Optional: Removed addons Upgrade registry
           // Example: myMod_addon1 was removed and it's important the user doesn't still have it loaded
           //removed[] = {"myMod_addon1"};
		
         };
      };
   };
};