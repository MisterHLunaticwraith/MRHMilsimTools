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
_suitablePos = [_pos] FUNC(findSuitableLZ);
_marker = createMarkerLocal ["MRH_LZ_Marker", _suitablePos];
_marker setMarkerTypeLocal "MRH_Heli";
_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerAlphaLocal 1;
player SVAR(setDestination,getMarkerPos _marker,false);
FUNC(refreshWaypointslist);
