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
params ["_className"];
_protectiveGogglesList = missionNamespace getVariable ["MRH_HaloGear_protectiveGear",[]];
if (_className in _protectiveGogglesList) exitWith {true};
false