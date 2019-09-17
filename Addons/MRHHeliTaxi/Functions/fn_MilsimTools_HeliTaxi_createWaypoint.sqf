/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_createWaypoint;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_createWaypoint;
*/
#include "MRH_C_Path.hpp"
params ["_ctrlMap","_pos"];
_setWaypoints = MRH_player GVARDef(setWaypoints,[]);
_waypointNumber = (count _setWaypoints) +1;
_marker = createMarkerLocal ["MRH_WP_Marker_"+(str _waypointNumber), _pos];

_marker setMarkerTypeLocal "MRH_waypoint";
_marker setMarkerTextLocal ((localize "STR_MRH_HeliTaxi_waypointsemicol")+(str _waypointNumber));
_marker setMarkerColorLocal "ColorYellow";
_marker setMarkerAlphaLocal 1;
_wpsNew = +_setWaypoints;
_wpsNew pushBackUnique _marker;
MRH_player SVAR(setWaypoints,_wpsNew,false);
FUNC(refreshWaypointslist);
