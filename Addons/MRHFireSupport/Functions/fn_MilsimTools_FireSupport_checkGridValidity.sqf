/*
Function name:MRH_fnc_MilsimTools_checkGridValidity
Author: Mr H.
Description: Checks that input grid coordinates are correct (in format E-N where either/and/or E and N are 3,4 or 5 digits long)
Return value:
<BOOL>, true if input is at the coorect format strong otherwise
Public:No
Parameters:
<STRING>
Example(s):
["1234-12345"] call MRH_fnc_MilsimTools_FireSupport_checkGridValidity;// returns true
["12-12345"] call MRH_fnc_MilsimTools_FireSupport_checkGridValidity;// returns false

*/
#include "MRH_C_Path.hpp"
params ["_Coordinates"];
_return = [_Coordinates] CFUNC(checkGridValidity);
_return

