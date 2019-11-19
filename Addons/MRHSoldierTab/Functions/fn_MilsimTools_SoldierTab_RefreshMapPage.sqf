/*
Function name: MRH_fnc_MilsimTools_SoldierTab_RefreshMapPage
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_RefreshMapPage;
*/
#include "MRH_C_Path.hpp"
FUNC(AllCtrlsHide);
_pageSpecificCtrls = [1205];
{
ctrlShow [_x,true];
}ForEach _pageSpecificCtrls;

[] spawn {
	_mapCtrl = FDIS(1205);
	_markerName = str MRH_player;
	createMarkerLocal [_markerName , [(position MRH_player) select 0,(position MRH_player) select 1]];
	_markerName setMarkerTypeLocal "MRH_Admin_PositionMarker";
	_mapCtrl ctrlmapAnimAdd [0, 0.1, markerPos _markerName];
	ctrlmapAnimCommit _mapCtrl;
	while 
	{
	ctrlShown _mapCtrl
	} 
	do 
	{
	_markerName setMarkerPosLocal [(position MRH_player) select 0,(position MRH_player) select 1];
	sleep 1;
	};
	deleteMarkerLocal _markerName;
};
if ([MRH_player] CFUNC(isConnectedToAntenna)) then 
{
	private _unitsToShow = [allUnits,side MRH_player] CFUNC(SortUnitsBySide);
	private _Map = ((findDisplay 03062018 )displayCtrl 1205);

	[_unitsToShow,_Map]CFUNC(BFT)
};