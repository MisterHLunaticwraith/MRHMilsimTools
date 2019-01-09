/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_conditionSetHeliCourse;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionSetHeliCourse;
*/
#include "MRH_C_Path.hpp"
if (vehicle player == player) ExitWith {false};
_ownerGrp = (vehicle player) GVARDef(ownerGroup,grpNull);
if (isNull _ownerGrp) ExitWith {false};
if (_ownerGrp != group player) ExitWith {false};
true