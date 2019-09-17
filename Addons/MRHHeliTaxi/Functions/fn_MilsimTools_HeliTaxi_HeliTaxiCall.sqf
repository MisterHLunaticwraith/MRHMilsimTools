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
	_groupOwnsHeli = (group MRH_player)GVARDef(ownsPhysicalHeli,false);
	_availableDoubleCheck = true;
	if !(_groupOwnsHeli) then {_availableDoubleCheck = FUNC(isHeliTaxiAvailable);};
	
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
	
	if (_groupOwnsHeli) exitWith {
		_assignedHeli = (group MRH_player) GVARDef(slavedHeli,objNull);
		[[_suitablePos,MRH_player,_assignedHeli],MRH_fnc_MilsimTools_HeliTaxi_PhysicalHeliOnTheWay] remoteExec ["Spawn",2];
		};
	[[_suitablePos,MRH_player],MRH_fnc_MilsimTools_HeliTaxi_HeliOnTheWay] remoteExec ["Spawn",2];
	
};