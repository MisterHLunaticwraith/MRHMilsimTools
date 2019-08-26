/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description: create a local marker on the chosen position, removes it when interface is closed
Return value:None
Public:No
Parameters:None 
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_startPosMark;
*/
#include "MRH_C_Path.hpp"
[] spawn {
	_mapCtrl = FDIS(1200);


	_markerName = str MRH_player;
	createMarkerLocal [_markerName , [(position MRH_player) select 0,(position MRH_player) select 1]];
	_markerName setMarkerTypeLocal "MRH_Admin_PositionMarker";
	//_markerName setMarkerPosLocal [(position player) select 0,(position player) select 1];
	_mapCtrl ctrlmapAnimAdd [2, 0.5, markerPos _markerName];
	ctrlmapAnimCommit _mapCtrl;
	waitUntil {!(ctrlShown _mapCtrl)};
	deleteMarkerLocal _markerName;
};