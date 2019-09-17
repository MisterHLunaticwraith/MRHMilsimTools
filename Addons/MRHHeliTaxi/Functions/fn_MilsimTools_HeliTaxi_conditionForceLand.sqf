/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_conditionForceLand;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionForceLand;
*/
#include "MRH_C_Path.hpp"
if (isTouchingGround (vehicle MRH_player)) exitWith {false};
_result = (vehicle MRH_player)GVARDef(heliShouldHaveLanded,false);
_result
