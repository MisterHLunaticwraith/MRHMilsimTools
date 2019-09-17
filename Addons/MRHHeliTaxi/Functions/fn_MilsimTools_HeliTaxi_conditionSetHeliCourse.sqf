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
if (vehicle MRH_player == MRH_player) ExitWith {false};
_ownerGrp = (vehicle MRH_player) GVARDef(ownerGroup,grpNull);
if (isNull _ownerGrp) ExitWith {false};
if (_ownerGrp != group MRH_player) ExitWith {false};
true