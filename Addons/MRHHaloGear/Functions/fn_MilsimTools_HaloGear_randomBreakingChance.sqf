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
if (goggles player != "MRH_HaloMask") exitWith {};
_odds = ["MRH_MilsimTools_HaloGear_haloMaskBreakingChancePerc"] call cba_settings_fnc_get;
_seed = [1,101] call BIS_fnc_randomInt;
if (_seed > _odds) exitWith {};

[
    {
        FUNC(maskBreakingAnim);
    }, 
    [], 
    (random [4,10,25])
] call CBA_fnc_waitAndExecute;

