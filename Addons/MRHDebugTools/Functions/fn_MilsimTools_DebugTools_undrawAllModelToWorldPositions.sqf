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
TRACE("Called");
_allhandles = missionNamespace getVariable ["MRH_DebugTools_allModelToWOrldHandles",[]];
[_allhandles] FUNC(batchRemovePFEH);
missionNamespace setVariable ["MRH_DebugTools_allModelToWOrldHandles",nil];
true