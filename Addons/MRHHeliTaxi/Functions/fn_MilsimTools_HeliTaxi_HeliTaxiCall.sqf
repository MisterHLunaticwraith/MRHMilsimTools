/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"

openMap [true,true];
[] spawn MRH_fnc_MilsimTools_EnhancedMap_temporaryMap;
hint localize "STR_MRH_HeliTaxi_HintSelectLZ";
onMapSingleClick {
	onMapSingleClick "";
	_availableDoubleCheck = FUNC(isHeliTaxiAvailable);
	if !(_availableDoubleCheck) ExitWith {hint (localize "STR_MRH_HeliTaxi_HintUnavailable");openMap [false,false];};
	deleteMarkerLocal "MRH_LZ_Marker";
	hint localize "STR_MRH_HeliTaxi_HintLZSet";
	_suitablePos = [_pos] FUNC(findSuitableLZ);
	_marker = createMarkerLocal ["MRH_LZ_Marker", _suitablePos];
	_marker setMarkerTypeLocal "MRH_Heli";
	_marker setMarkerTextLocal (localize "STR_MRH_HeliTaxi_MarkerSelectedLz");
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerAlphaLocal 1;
	[] Spawn {sleep 5; openMap [false,false]; deleteMarkerLocal "MRH_LZ_Marker";};
	[[_suitablePos,player],MRH_fnc_MilsimTools_HeliTaxi_HeliOnTheWay] remoteExec ["Spawn",2];
	
};