/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_undrawSelectionPositions;
*/
#include "MRH_C_Path.hpp"

_allHandles = missionNamespace getVariable ["MRH_DebugTools_allSelectionsDrawnHandles",[]];
[_allhandles] FUNC(batchRemovePFEH);
missionNamespace setVariable ["MRH_DebugTools_allSelectionsDrawnHandles",nil];
true