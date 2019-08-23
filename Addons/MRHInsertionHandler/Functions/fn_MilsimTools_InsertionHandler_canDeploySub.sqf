/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
params ["_pos2D"];
_pos = [(_pos2D select 0),(_pos2D select 1),0];
_isOnSea = [_pos] call MRH_fnc_MilsimTools_HeliTaxi_lzIsOnWater;
if !(_isOnSea) exitWith {[false,(localize "STR_MRH_MRHInsertionHandler_PosIsNotWater")]};
_depth = [_pos] CFUNC(returnDepth);

if ((abs _depth) < 20) exitWith {[false,(format [(localize "STR_MRH_MRHInsertionHandler_PosIsToShallow"),(round (abs _depth))])]};
[true,(format [(localize "STR_MRH_MRHInsertionHandler_WaterDepthMess"),round (abs _depth)])]