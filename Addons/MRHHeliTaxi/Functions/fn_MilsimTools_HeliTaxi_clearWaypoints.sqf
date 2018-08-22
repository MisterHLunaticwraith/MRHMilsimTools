/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_clearWaypoints
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_clearWaypoints;
*/
#include "MRH_C_Path.hpp"
(group player)SVAR(someoneIsSettingCourse,false,true);
_setWaypoints = player GVARDef(setWaypoints,[]);
{
	deleteMarkerLocal _x;
}forEach _setWaypoints;
player SVAR(setWaypoints,[],false);
deleteMarkerLocal "MRH_LZ_Marker";
FUNC(refreshWaypointslist);
true