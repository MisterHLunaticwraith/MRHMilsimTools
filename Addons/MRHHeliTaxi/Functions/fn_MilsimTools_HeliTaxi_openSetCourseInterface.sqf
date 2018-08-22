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
if (_isAlreadyOpened) exitWith {hintC "Someone in your group is already setting up a course."};
(group player)SVAR(someoneIsSettingCourse,true,true);
_handle = createdialog "MRHHeliTaxiWayPoints";
hint "Double click on map to set final destination, you can set intermediate waypoints by holding CTRL and double clicking on map";