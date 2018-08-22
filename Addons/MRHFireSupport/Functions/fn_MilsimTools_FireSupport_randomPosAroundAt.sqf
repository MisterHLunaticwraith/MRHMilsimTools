/*
Function name:MRH_fnc_MilsimTools_FireSupport_randomPosAroundAt
Author: Mr & Mrs H. (she did the maths)
Description: Returns a position at random at the exact distance from origin point (unlike bis fnc find safe pos)
Return value:
0-<ARRAY> format position where z is 0
Public:No, maybe , we'll see
Parameters:
0-<ARRAY>  position format
1-<NUMBER> distance in meters
Example(s):
[position player,1000] call MRH_fnc_MilsimTools_FireSupport_randomPosAroundAt; // will return a random point a km from the player

*/
#include "MRH_C_Path.hpp"

params ["_pos","_distance"];
_t = random [0,500,1000];
_x = (_pos select 0)+ _distance*(cos _t);
_y = (_pos select 1) + _distance*(sin _t);
_return = [_x,_y,0];
_return