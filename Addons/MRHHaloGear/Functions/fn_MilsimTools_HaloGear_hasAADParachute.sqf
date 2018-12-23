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
params ["_unit"];

_parachutesWithAAD = ["MRH_AADEquippedParachute","MRH_AADEquippedNSParachute"];
if (backpack _unit in _parachutesWithAAD) exitWith {true};
false