/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_lzIsOnWater;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_lzIsOnWater;
*/
#include "MRH_C_Path.hpp"
params ["_LZ"];
_overWater = !(_LZ isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);
_overWater