/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_;
*/
#include "MRH_C_Path.hpp"

if (isNull cursorTarget) exitWith {TRACE("No cursorTarget")};
TRACE("Drawing called");
_display = findDisplay 330119;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_EDIT = CTRLF(1400);
_handle = [cursortarget,(parseNumber ctrlText _EDIT)] FUNC(drawModelToWorldPositions);
_allHandles = missionNamespace getVariable ["MRH_DebugTools_allModelToWOrldHandles",[]];
_allHandles pushBackUnique _handle;
missionNamespace setVariable ["MRH_DebugTools_allModelToWOrldHandles",_allHandles];