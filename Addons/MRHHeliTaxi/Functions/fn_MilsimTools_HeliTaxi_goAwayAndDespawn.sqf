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
_this spawn {
params["_heli"];
_heli setVehicleLock "LOCKED";
//--clear waypoints
_oldWaypoints = waypoints group _heli;
_hadWaypoints =false;
if (count _oldWaypoints >1) then {
	_testArrAy= [];
	_waypoint0 = (group _heli) addwaypoint [getpos _heli,0];
	(group _heli) setCurrentWaypoint _waypoint0;
	for "_i" from 0 to ((count _oldWaypoints)+1) do
	{
		
		deleteWaypoint [group _heli, 1];
		
	};
	
	_hadWaypoints = true;
};
_ownerGrp = _heli GVAR(ownerGroup);
_destination = _heli GVAR(userSetDestination);

[_ownerGrp,_destination,"",true]FUNC(createDeleteMarkerForGroup);
sleep 10;
_heli commandMove (_heli modelToWorld [0,-1000,0]);
_heli flyInHeight 60;
_heli limitSpeed 99999;
// make heli available again 
[_heli]FUNC(resetVariables);
sleep 40;
[_heli]CFUNC(deleteVehicleAndCrew);
};