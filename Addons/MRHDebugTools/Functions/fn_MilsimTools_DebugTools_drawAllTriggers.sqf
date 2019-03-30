/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_drawAllTriggers;
*/
#include "MRH_C_Path.hpp"
_allTriggers = allMissionObjects "EmptyDetector";

_check = missionNamespace getVariable ["MRH_DebugTools_AllDrawnTriggersHandles",[]];
if !(_check isEqualTo []) then {FUNC(undrawAllTriggers);TRACE("previews triggers removed")};


TRACE("Drawing all triggers");
_handles = [];
{
	private _handle = [_x] FUNC(drawTrigger);
	_handles pushBackUnique _handle;
} forEach _allTriggers;

missionNamespace setVariable ["MRH_DebugTools_AllDrawnTriggersHandles",_handles];
_toTrace = format ["Handles of drawTrigger PFEHs: %1",_handles];
TRACE(_toTrace);
_handles