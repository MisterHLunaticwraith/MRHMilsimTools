/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_createDestinationWP
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_createDestinationWP;
*/
#include "MRH_C_Path.hpp"
params ["_pos"];
deleteMarkerLocal "MRH_LZ_Marker";
_markerType = lbData [2110,lbCursel 2110];
_markerText = lbText [2110,lbCursel 2110];


_suitablePos = [_pos] FUNC(findSuitableLZ);
if (_markerType in ["MRH_loiter","MRH_rope","MRH_pause"]) then {_suitablePos = _pos}; //no need to find a safe pos in these situation
_marker = createMarkerLocal ["MRH_LZ_Marker", _suitablePos];
_marker setMarkerTypeLocal _markerType;//"MRH_Heli";
_marker setMarkerTextLocal  _markerText;//(localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerAlphaLocal 1;
MRH_player SVAR(setDestination,getMarkerPos _marker,false);
FUNC(refreshWaypointslist);
