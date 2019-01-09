/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
["ace_glassesChanged",{
    _goggles = _this select 1;
    if ([_goggles] FUNC(isProtectiveGear)) then {[_goggles] spawn MRH_fnc_MilsimTools_HaloGear_rebreatherSounds};
    // call the hypoxia effect in case mask is changed in the air
    [] spawn MRH_fnc_MilsimTools_HaloGear_hypoxiaEffects;
    // call mask HUD
    [] spawn MRH_fnc_MilsimTools_HaloGear_haloMaskHud;
	}] call CBA_fnc_addEventHandler;


["ace_glassesCracked",{
    // call the hypoxia effect in case mask gets cracked
   
    if (goggles player == "MRH_HaloMask") then {removeGoggles player;player addGoggles "MRH_HaloMaskBroken"};
    [] spawn MRH_fnc_MilsimTools_HaloGear_hypoxiaEffects;
	}] call CBA_fnc_addEventHandler;