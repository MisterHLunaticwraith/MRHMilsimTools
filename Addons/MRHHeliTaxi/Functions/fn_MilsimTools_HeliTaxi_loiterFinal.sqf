/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_loiterFinal;
*/
#include "MRH_C_Path.hpp"
if !(isServer) exitWith {};
params ["_heli","_destination"];
_heli SVAR(isBusy,false,true);
private _wp = (group _heli) addWaypoint [_destination, 0,(count (waypoints group _heli))+1];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType (selectRandom ["CIRCLE","CIRCLE_L"]);
_wp setWaypointLoiterRadius 50;
[_heli,"Loiter",_destination]FUNC(handleMessages);