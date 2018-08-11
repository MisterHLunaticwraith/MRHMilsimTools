/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_randomPosAroundAt;

*/
#include "MRH_C_Path.hpp"

params ["_pos","_distance"];
_t = random [0,500,1000];
_x = (_pos select 0)+ _distance*(cos _t);
_y = (_pos select 1) + _distance*(sin _t);
_return = [_x,_y,0];
_return