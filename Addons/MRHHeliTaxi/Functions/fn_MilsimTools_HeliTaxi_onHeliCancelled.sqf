/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_onHeliCancelled;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_onHeliCancelled;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];

_veh setVehicleLock "LOCKED";
[_veh,"Cancelled"]FUNC(handleMessages);
_ownerGrp = _veh GVAR(ownerGroup);
_destination = _veh GVAR(userSetDestination);
[_ownerGrp,_destination,true]FUNC(createDeleteMarkerForGroup);
[_veh]FUNC(resetVariables);
//-- clear previous waypoints for the vehicle
_oldWaypoints = waypoints group _veh;
_hadWaypoints =false;
if (count _oldWaypoints >1) then {
	_testArrAy= [];
	_waypoint0 = (group _veh) addwaypoint [getpos _veh,0];
	(group _veh) setCurrentWaypoint _waypoint0;
	for "_i" from 0 to ((count _oldWaypoints)+1) do
	{
		
		deleteWaypoint [group _veh, 1];
		
	};
	
	_hadWaypoints = true;
};
//-- send it packing
_veh commandMove (_veh modelToWorld [0,2000,0]);
_veh flyInHeight 60;
_veh limitSpeed 99999;
// make heli available again 

sleep 40;
{deleteVehicle _x;}forEach crew _veh;
deleteVehicle _veh;