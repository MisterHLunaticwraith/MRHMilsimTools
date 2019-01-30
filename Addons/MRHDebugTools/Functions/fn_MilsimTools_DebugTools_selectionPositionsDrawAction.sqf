/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_selectionPositionsDrawAction;
*/
#include "MRH_C_Path.hpp"
if (isNull cursorTarget) exitWith {TRACE("No cursorTarget")};
_handle = [cursorTarget] FUNC(drawSelectionsPositions);
_allHandles = missionNamespace getVariable ["MRH_DebugTools_allSelectionsDrawnHandles",[]];
_allHandles pushBackUnique _handle;
missionNamespace setVariable ["MRH_DebugTools_allSelectionsDrawnHandles",_allHandles];
true