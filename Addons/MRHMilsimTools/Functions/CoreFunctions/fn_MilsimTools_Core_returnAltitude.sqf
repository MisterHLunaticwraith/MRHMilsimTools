/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: Returns altitude above sea level in meters
Return value: Altitude in meters above sea level
Public: No
Parameters:
0- <OBJECT>
Example(s):
[]call MRH_fnc_MilsimTools_Core_returnAltitude;
*/
#include "MRH_C_Path.hpp"
params ["_object"];
_altitude = (getPosASL _object) select 2;
_altitude