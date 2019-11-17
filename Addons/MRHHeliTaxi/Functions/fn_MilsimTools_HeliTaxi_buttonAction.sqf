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
private _veh = vehicle MRH_player;
private _isInFinalApp = _veh GVARDef(isInFinalApproachPhase,false);
if (_isInFinalApp) exitWith {closedialog 0; hintC (localize "STR_MRH_HeliTaxi_LandingChangeDeniedHint");};
private _wayPointsMarkers = MRH_player GVARDef(setWaypoints,[]);
//check that destination is set
private _color = getMarkerColor "MRH_LZ_Marker";
if (_color == "") ExitWith {hint (localize "STR_MRH_HeliTaxi_NoDestError")};
//-- clear previous waypoints for the vehicle
private _oldWaypoints = waypoints group _veh;
private _hadWaypoints =false;
if (count _oldWaypoints >1) then {
	[group _veh] CFUNC(clearAllWayPoints);
	
	_hadWaypoints = true;
};
//convert set waypoints to positions
_processedWP = [];
{
	_pos = getMarkerPos _x;
	_processedWP pushBackUnique _pos;
} forEach _wayPointsMarkers;
_destination = getMarkerPos "MRH_LZ_Marker";
_behaviorType = getMarkerType "MRH_LZ_Marker";

[[_veh,_processedWP,_destination,_behaviorType],MRH_fnc_MilsimTools_HeliTaxi_heliPath] remoteExec ["Spawn",2];
closeDialog 0;
_hintText = (localize "STR_MRH_HeliTaxi_EnRouteHintC");
if (_hadWaypoints) then {_hintText = (localize "STR_MRH_HeliTaxi_NewCourseSetMess");};
hintC _hintText;