/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
[] spawn {
waitUntil{visibleMap};
hint localize "STR_MRH_EnhancedMap_SelectFoldHint";
MRH_player setVariable ["MRH_MilsimTools_EnhacedMap_isChoosingPos",true];
deleteMarkerLocal "MRH_SelectedFoldMapZone_Marker";
_marker = createMarkerLocal ["MRH_SelectedFoldMapZone_Marker", MRH_player getVariable ['MRH_EHMAP_Mapsection',[worldSize / 2, worldsize / 2, 0]]];
	//_marker setMarkerTypeLocal "MRH_Heli";
	_marker setMarkerShapeLocal "RECTANGLE";
	//_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
	//ORG//_marker setMarkerSizeLocal [(worldSize /2)*0.184, (worldSize/2)*0.21]; 
	//test//_marker setMarkerSizeLocal [(0.252656 * safezoneW)*3000,(0.495 * safezoneH)*3000];
	_zoomRatio = ["MRH_MilsimTools_Map_ZoomRatio"] call cba_settings_fnc_get;
		_marker setMarkerSizeLocal [(worldSize /2)*((0.184/0.3)*_zoomRatio), (worldSize/2)*((0.21/0.3)*_zoomRatio)];
	_marker setMarkerBrushLocal "Border"; 
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerAlphaLocal 1;
	while {(MRH_player getVariable ["MRH_MilsimTools_EnhacedMap_isChoosingPos",true]) && visibleMap} do
	{
	"MRH_SelectedFoldMapZone_Marker" setMarkerPosLocal (((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld getMousePosition);
	};
	deleteMarkerLocal "MRH_SelectedFoldMapZone_Marker";
	hint localize "STR_MRH_EnhancedMap_FoldSelectedHint";
};
onMapSingleClick {
	onMapSingleClick "";
	MRH_player setVariable ["MRH_EHMAP_Mapsection",_pos];
	MRH_player setVariable ["MRH_MilsimTools_EnhacedMap_isChoosingPos",false];
	FUNC(refreshFoldableMapCenter);
};