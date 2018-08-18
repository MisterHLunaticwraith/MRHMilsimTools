/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_onMapDoubleClick;
*/
#include "MRH_C_Path.hpp"

params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

_pos= _control ctrlMapScreenToWorld [_xPos,_yPos];

deleteMarkerLocal "MRH_LZ_Marker";
hint localize "STR_MRH_HeliTaxi_HintLZSet";
_marker = createMarkerLocal ["MRH_LZ_Marker", _pos];
_marker setMarkerTypeLocal "MRH_paradrop";
_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerAlphaLocal 1;

[]spawn {
_mapCtrl = FDIS(1200);
waitUntil {!(ctrlShown _mapCtrl)};
deleteMarkerLocal "MRH_LZ_Marker";
};
FUNC(checkListUpdate);