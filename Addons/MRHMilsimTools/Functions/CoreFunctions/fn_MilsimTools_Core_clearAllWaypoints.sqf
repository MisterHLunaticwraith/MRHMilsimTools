/*
Function name:MRH_fnc_MilsimTools_Core_clearAllWaypoints
Author: Found on Biki & modified by Mr H.
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

//--sets current waypoint on group position
[_grp,(currentWaypoint _grp)] setWaypointPosition [getPosASL ((units _grp) select 0), -1];

//---deleting all waypoints needs a slight delay
[
    {
		params ["_grp"];
        for "_i" from count waypoints _grp - 1 to 1 step -1 do 
		{
			deleteWaypoint [_grp, _i];
		};
    }, 
    _this, 
    0.1
] call CBA_fnc_waitAndExecute;
/*
{
	deleteWaypoint [_grp,_forEachIndex];
} forEach (waypoints _grp);
*/
