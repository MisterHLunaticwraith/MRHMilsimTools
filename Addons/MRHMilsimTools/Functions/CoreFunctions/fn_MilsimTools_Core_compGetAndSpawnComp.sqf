/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_compGetAndSpawnComp;
*/
#include "MRH_C_Path.hpp"
params ["_pivot","_composition"];
_comp =[_composition] call MRH_fnc_MilsimTools_Core_cmpGetComp;
_returned = [_pivot,_comp] call MRH_fnc_MilsimTools_Core_cmpSpawnComp;
_returned