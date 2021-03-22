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
(group MRH_player)SVAR(someoneIsSettingCourse,false,true);
_setWaypoints = MRH_player GVARDef(setWaypoints,[]);
{
	deleteMarkerLocal _x;
} foreach _setWaypoints;
MRH_player SVAR(setWaypoints,[],false);
deleteMarkerLocal "MRH_LZ_Marker";
FUNC(refreshWaypointslist);
true