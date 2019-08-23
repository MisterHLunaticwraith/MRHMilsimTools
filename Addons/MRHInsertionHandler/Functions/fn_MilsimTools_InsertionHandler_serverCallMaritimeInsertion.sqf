/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_;
*/
#include "MRH_C_Path.hpp"
	if !(isServer) exitWith {};
	params ["_units","_side","_position"];

	_startPos = [_position] call MRH_fnc_MilsimTools_InsertionHandler_randomPosOnWaterWithinDepth;
	_arraySubs = [_startPos,_side] call MRH_fnc_MilsimTools_InsertionHandler_spawnSub;
	_arraySubs params ["_proteus","_sdvCTRL","_sdv","_sdv2"];
	[_units,_sdv,_sdv2] call MRH_fnc_MilsimTools_InsertionHandler_boardSDVs;
	
	[_sdvCTRL,_position] spawn {
		params ["_sdvCTRL","_position"];

		while {(count (waypoints _sdvCTRL) isEqualTo 1)} do {
			_wp = (group _sdvCTRL) addWaypoint [_position, 20];
			_wp setWaypointStatements ["true", "[this] call MRH_fnc_MilsimTools_InsertionHandler_subWaypointStatement;"];
		};
	};//sometimes it would'n't get the wp so this is a failsafe/workaround