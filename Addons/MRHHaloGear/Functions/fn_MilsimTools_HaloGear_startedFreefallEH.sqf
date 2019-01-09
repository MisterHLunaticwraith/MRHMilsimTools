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
if !(hasInterface) exitWith {};

_EH = [] spawn {
waitUntil {([player] call MRH_fnc_MilsimTools_HaloGear_isFreeFalling)};
["MRH_StartedFreefall_eh", [player]] call CBA_fnc_localEvent;
FUNC(freeFallEndedEH);
};