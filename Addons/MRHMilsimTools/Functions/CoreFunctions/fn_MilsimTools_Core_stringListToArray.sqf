/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_stringListToArray;
*/
#include "MRH_C_Path.hpp"
params ["_string"];

_resultingArray = _string splitString ",";
_resultingArray