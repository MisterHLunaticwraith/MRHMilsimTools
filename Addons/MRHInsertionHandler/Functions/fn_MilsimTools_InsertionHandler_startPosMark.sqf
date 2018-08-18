/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_startPosMark;
*/
#include "MRH_C_Path.hpp"
[] spawn {
	_mapCtrl = FDIS(1200);


	_markerName = str player;
	createMarkerLocal [_markerName , [(position player) select 0,(position player) select 1]];
	_markerName setMarkerTypeLocal "MRH_Admin_PositionMarker";
	//_markerName setMarkerPosLocal [(position player) select 0,(position player) select 1];
	_mapCtrl ctrlmapAnimAdd [2, 0.5, markerPos _markerName];
	ctrlmapAnimCommit _mapCtrl;
	waitUntil {!(ctrlShown _mapCtrl)};
	deleteMarkerLocal _markerName;
};