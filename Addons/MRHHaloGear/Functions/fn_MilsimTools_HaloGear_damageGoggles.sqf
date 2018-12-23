/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HaloGear_damageGoggles;
*/
#include "MRH_C_Path.hpp"
_glassesState = player getVariable"ace_goggles_condition"; 
_setBroken = [_glassesState select 0, _glassesState select 1,true]; 
player setVariable ["ace_goggles_condition",_setBroken]; 
[player, goggles player] call ace_goggles_fnc_applyGlassesEffect;
["ace_glassesCracked", [player]] call CBA_fnc_localEvent;