/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_

*/
#include "MRH_C_Path.hpp"
params ["_Coordinates"];
_CoordinatesArray = _Coordinates splitString "-";
_lat = _CoordinatesArray select 0;
_long = _CoordinatesArray select 1;
_lat = [_lat] FUNC(fiveDigitsGridFormat);
_long = [_long] FUNC(fiveDigitsGridFormat);
_result = [_lat,_long,0];
_result
