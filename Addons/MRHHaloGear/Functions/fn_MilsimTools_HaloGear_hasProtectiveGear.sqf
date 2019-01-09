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

_protectiveGogglesList = missionNamespace getVariable ["MRH_HaloGear_protectiveGear",[]];
if (goggles player in _protectiveGogglesList) exitWith {true};
if (headgear player in _protectiveGogglesList) exitWith {true};
if ((typeOf vehicle player) in _protectiveGogglesList) exitWith {true};
false