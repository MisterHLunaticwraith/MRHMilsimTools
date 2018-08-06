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
_display = uiNamespace getVariable "MRHFoldMap";
_display closedisplay 2;
player setVariable ["MRH_EnhancedMap_FoldedMapDisplayOpen",false];
FUNC(playRandomSound);