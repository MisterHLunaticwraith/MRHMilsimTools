/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
 if (!isTouchingGround _unit && (isNull objectParent _unit) &&  (((getPosASL _unit) select 2) >0.1) &&(((getPosATL _unit) select 2) >50)) exitWith {true};
 false