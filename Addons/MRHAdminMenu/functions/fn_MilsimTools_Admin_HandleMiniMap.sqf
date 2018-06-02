/*
Function name: MRH_fnc_MilsimTools_Admin_HandleMiniMap
Author: Mr H.
Description: creates a marker on the admin menu mini map where selected player is and constantly refreshes its position while cenetring the map on it
Return value: none
Public: no
Parameters: <OBJECT> -player to follow
Example(s):
call MRH_fnc_MilsimTools_Admin_HandleMiniMap;
*/
params ["_player"];

[_player] spawn {

	params ["_player"];
	#include "MRH_C_Path.hpp"
	_cameraCtrl = FDIS(1200);
	_mapCtrl = FDIS(1108);


	_markerName = str _player;
	createMarkerLocal [_markerName , [(position _player) select 0,(position _player) select 1]];
	_markerName setMarkerTypeLocal "MRH_Admin_PositionMarker";
	_playerUid = lbdata [1500,(lbCurSel 1500)];
	_playerSelected = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID;
	while 
	{
	_player == _playerSelected && ctrlShown _mapCtrl
	} do 
	{
	_playerUid = lbdata [1500,(lbCurSel 1500)];
	_playerSelected = [_playerUid] call MRH_fnc_MilsimTools_Core_FindPlayerByUID;
	_markerName setMarkerPosLocal [(position _player) select 0,(position _player) select 1];
	_mapCtrl ctrlmapAnimAdd [0, 0.1, markerPos _markerName];
	ctrlmapAnimCommit _mapCtrl;
	};
	deleteMarkerLocal _markerName;
};