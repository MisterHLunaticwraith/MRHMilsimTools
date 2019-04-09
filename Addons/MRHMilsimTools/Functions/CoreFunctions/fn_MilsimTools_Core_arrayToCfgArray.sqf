/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_input"];
_array = str _input;
_step1 = [_array, "[","{"] call CBA_fnc_replace;
_step2 = [_step1, "]","}"] call CBA_fnc_replace;
_step2