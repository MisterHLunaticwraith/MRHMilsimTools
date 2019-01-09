/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_buttonAction;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_buttonAction;
*/
#include "MRH_C_Path.hpp"
_veh = vehicle player;
_isInFinalApp = _veh GVARDef(isInFinalApproachPhase,false);
if (_isInFinalApp) exitWith {closedialog 0; hintC (localize "STR_MRH_HeliTaxi_LandingChangeDeniedHint");};
_wayPointsMarkers = player GVARDef(setWaypoints,[]);
//check that destination is set
_color = getMarkerColor "MRH_LZ_Marker";
if (_color == "") ExitWith {hint (localize "STR_MRH_HeliTaxi_NoDestError")};
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
//convert set waypoints to positions
_processedWP = [];
{
	_pos = getMarkerPos _x;
	_processedWP pushBackUnique _pos;
} forEach _wayPointsMarkers;
_destination = getMarkerPos "MRH_LZ_Marker";

[[_veh,_processedWP,_destination],MRH_fnc_MilsimTools_HeliTaxi_heliPath] remoteExec ["Spawn",2];
closeDialog 0;
_hintText = (localize "STR_MRH_HeliTaxi_EnRouteHintC");
if (_hadWaypoints) then {_hintText = (localize "STR_MRH_HeliTaxi_NewCourseSetMess");};
hintC _hintText;