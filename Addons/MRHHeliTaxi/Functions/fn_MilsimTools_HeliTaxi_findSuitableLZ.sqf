/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_findSuitableLZ
Author: Mr H.
Description: Finds the nearest safe position near the provided position
Return value:
<ARRAY> position format
Public: No
Parameters:
0-<ARRAY> position
Example(s):
[position player]call MRH_fnc_MilsimTools_HeliTaxi_findSuitableLZ;
*/
#include "MRH_C_Path.hpp"

params ["_pos"];
_suitablePos = [_pos, 0, 50, 25,0,0.1, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
_suitablePos

