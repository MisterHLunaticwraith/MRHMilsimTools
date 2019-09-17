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
params ["_heli","_waypoints","_destination","_behaviorType"];
[_heli,"Go"]FUNC(handleMessages);
// save new _destination
_heli SVAR(userSetdestination,_destination,true);//destination chosen
_heli SVAR(isBusy,true,true);
// create the marker for all group members of the caller
//get the calling grp from Heli 
_ownerGrp = _heli GVAR(ownerGroup);
if !(isEngineOn _heli) then
{
	private _pilot = driver _heli;
	_pilot action ["engineOn",_heli];
	waitUntil {isEngineOn _heli};
};
//---
_heli flyInHeight 60;
_heli limitSpeed 99999; // landing pocedure forces the heli to slow, cancel that

//--------prepare statement for the last waypoint
_toCall = 'spawn MRH_fnc_MilsimTools_HeliTaxi_LandFinal';//default value just in case

switch (true) do {
	case (_behaviorType == "MRH_heli") : {_toCall = 'spawn MRH_fnc_MilsimTools_HeliTaxi_LandFinal'};
	case (_behaviorType == "MRH_wait") : {_toCall = 'spawn MRH_fnc_MilsimTools_HeliTaxi_landAndWaitFinal';};
	case (_behaviorType == "MRH_loiter") : {_toCall ='call MRH_fnc_MilsimTools_HeliTaxi_loiterFinal';};
	case (_behaviorType == "MRH_rope") : {_toCall ='spawn MRH_fnc_MilsimTools_HeliTaxi_fastRopeFinal';};
	case (_behaviorType == "MRH_pause") : {_toCall ='call MRH_fnc_MilsimTools_HeliTaxi_hoverFinal';};
};
//systemChat format ["%1 %2",_behaviorType,_toCall];
_wpStatement = format ["_lastWaypoint setWaypointStatements ['true', '[(vehicle leader this),%1] %2']",_destination,_toCall];
// delete marker created at selection 
[_ownerGrp,_destination,_behaviorType,true]FUNC(createDeleteMarkerForGroup);
//and create a new one 
[_ownerGrp,_destination,_behaviorType]FUNC(createDeleteMarkerForGroup);
//if !((_heli distance _destination) < 1500) then {[_heli,_destination] FUNC(oneMikeMark);};

//-------------if there are no intermediate waypoints set
if (_waypoints isEqualTo []) ExitWith 
	{ 
		_lastWaypoint =group _heli addWaypoint [_destination, 20,(count (waypoints group _heli))+1];
		call compile  _wpStatement;
	};
//------------if there are intermediate waypoints set 
/*process all other waypoints*/
{
	group _heli addWaypoint [_x, 20];
}forEach _waypoints;
/* Create last waypoint*/
_lastWaypoint =group _heli addWaypoint [_destination, 20,(count (waypoints group _heli))+1];
call compile  _wpStatement;

	


