/*
Function name:MRH_fnc_MilsimTools_RHS_CBPS_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RHS_CBPS_;
*/
#include "MRH_C_Path.hpp"

params ["_veh"];
_comp = _veh getVariable ["MRH_CBPS_spawnedComp",[]];
[_veh,_comp] call MRH_fnc_deleteComposition;
["mrh_milsimtools_CBPS_repacked", [_veh,_comp]] call CBA_fnc_globalEvent;