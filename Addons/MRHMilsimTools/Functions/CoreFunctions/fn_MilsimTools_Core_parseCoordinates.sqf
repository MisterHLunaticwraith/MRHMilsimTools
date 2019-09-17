/*
Function name:MRH_fnc_MilsimTools_Core_ParseCoordinates
Author: Mr H.
Description:(A DUPLICATE of MRH_fnc_MilsimTools_FireSupport_ParseCoordinates) Converts string coordiantes text in format "01234-01234" to actual game position
Return value:
<ARRAY> format position (where z is 0)
Public:No
Parameters:
0-<STRING> of 2 series of 3 to 5 digits numbers separated by -
Example(s):
["12345-12345"] call MRH_fnc_MilsimTools_Core_ParseCoordinates //returns [12345,12345,0]

*/
#include "MRH_C_Path.hpp"
	params ["_Coordinates"];
_CoordinatesArray = _Coordinates splitString "-";
_lat = _CoordinatesArray select 0;
_long = _CoordinatesArray select 1;
_lat = [_lat] FUNC(fiveDigitsGridFormat);
_long = [_long] FUNC(fiveDigitsGridFormat);
//result = [_lat,_long,0];//the ace function is way better, use it instead
_combined = _lat + _long;
[_combined] call ace_common_fnc_getMapPosFromGrid
/*
//----orginal func for safekeeping
params ["_Coordinates"];
_CoordinatesArray = _Coordinates splitString "-";
_lat = _CoordinatesArray select 0;
_long = _CoordinatesArray select 1;
_lat = [_lat] FUNC(fiveDigitsGridFormat);
_long = [_long] FUNC(fiveDigitsGridFormat);
_result = [_lat,_long,0];
_result
*/