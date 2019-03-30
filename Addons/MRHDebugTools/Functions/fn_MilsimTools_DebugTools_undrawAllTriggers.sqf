/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_undrawAllTriggers;
*/
#include "MRH_C_Path.hpp"
TRACE("Called");
_allhandles = missionNamespace getVariable ["MRH_DebugTools_AllDrawnTriggersHandles",[]];
[_allhandles] FUNC(batchRemovePFEH);
missionNamespace setVariable ["MRH_DebugTools_AllDrawnTriggersHandles",nil];
true