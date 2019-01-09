/*
Function name:MRH_fnc_MilsimTools_Core_isAliveAndConscious
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:
Example(s):
[player]call MRH_fnc_MilsimTools_Core_isAliveAndConscious;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
_isMilsimToolsDead = _unit getVariable ["MRH_MilsimTools_Core_HasDied",false];
if (_isMilsimToolsDead) exitWith {false};
_isAceConscious = [_unit] call ace_common_fnc_isAwake;
_isAceConscious