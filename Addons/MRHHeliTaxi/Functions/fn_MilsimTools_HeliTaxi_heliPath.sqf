/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_heliPath
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
spawn MRH_fnc_MilsimTools_HeliTaxi_heliPath;
*/
#include "MRH_C_Path.hpp"
params ["_heli","_waypoints","_destination"];
[_heli,"Go"]FUNC(handleMessages);
// save new _destination
_heli SVAR(userSetdestination,_destination,true);//destination chosen 
// create the marker for all group members of the caller
//get the calling grp from Heli 
_ownerGrp = _heli GVAR(ownerGroup);
// delete marker created at selection 
[_ownerGrp,_destination,true]FUNC(createDeleteMarkerForGroup);
//and create a new one 
[_ownerGrp,_destination]FUNC(createDeleteMarkerForGroup);
//---
_heli flyInHeight 60;
_heli limitSpeed 99999; // landing pocedure forces the heli to slow, cancel that

//--------prepare statement for the last waypoint
_wpStatement = format ["_lastWaypoint setWaypointStatements ['true', '[(vehicle leader this),%1] %2']",_destination,'spawn MRH_fnc_MilsimTools_HeliTaxi_LandFinal'];

//if !((_heli distance _destination) < 1500) then {[_heli,_destination] FUNC(oneMikeMark);};

//-------------if there are no intermediate waypoints set
if (_waypoints isEqualTo []) ExitWith 
	{ 
		_lastWaypoint =group _heli addWaypoint [_destination, 20];
		call compile  _wpStatement;
	};
//------------if there are intermediate waypoints set 
/*process all other waypoints*/
{
	group _heli addWaypoint [_x, 20];
}forEach _waypoints;
/* Create last waypoint*/
_lastWaypoint =group _heli addWaypoint [_destination, 20];
call compile  _wpStatement;

	


