/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_medEvacFindSafePos;
*/
#include "MRH_C_Path.hpp"
params ["_pos"];
_suitablePos = [_pos, 100, 250, 10,0,0.3, 0, [], [_pos,_pos]] call BIS_fnc_findSafePos;
_suitablePos