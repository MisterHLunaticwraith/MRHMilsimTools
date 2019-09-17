/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
params ["_mainVeh","_escort","_LZ","_index"];


private _wp = (group _escort) addWaypoint [_LZ, 0,1];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType (["CIRCLE","CIRCLE_L"] select _index);
_wp setWaypointLoiterRadius 50;
