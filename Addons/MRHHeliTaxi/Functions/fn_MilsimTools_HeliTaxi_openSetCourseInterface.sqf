/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_openSetCourseInterface;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_openSetCourseInterface;
*/
#include "MRH_C_Path.hpp"
_isAlreadyOpened = (group player) GVARDef(someoneIsSettingCourse,false);
if (_isAlreadyOpened) exitWith {hintC (localize "STR_MRH_HeliTaxi_SomeoneIsSettingAlready")};
(group player)SVAR(someoneIsSettingCourse,true,true);
_handle = createdialog "MRHHeliTaxiWayPoints";
hint (localize "STR_MRH_HeliTaxi_HintCreateIntermediate");