/*
Function name:MRH_fnc_MilsimTools_Core_clearAllWaypoints
Author: Mr H.
Description: Deletes all waypoints for a given group
Return value: None
Public: No
Parameters:
0-<GROUP> to delete waypoints to

Example(s):
[group player]call MRH_fnc_MilsimTools_Core_clearAllWaypoints;
*/
#include "MRH_C_Path.hpp"
params ["_grp"];
{
	deleteWaypoint [_grp,_forEachIndex];
} forEach (waypoints _grp);