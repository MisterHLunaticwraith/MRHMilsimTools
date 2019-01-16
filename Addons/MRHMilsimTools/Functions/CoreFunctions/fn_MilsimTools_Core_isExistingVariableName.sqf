/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: Checks if an object alrealdy as this variable name
Return value: <BOOL> true if object already exists false otherwise 
Public: No
Parameters:
0 - <STRING>
Example(s):
[]call MRH_fnc_MilsimTools_Core_isExistingVariableName;
*/
#include "MRH_C_Path.hpp"
params ["_string"];
_test = (allvariables missionNamespace) find _string;
if (_test != -1) exitWith {true};
false