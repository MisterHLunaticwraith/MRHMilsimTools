/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_debugHintboxInit;
*/
#include "MRH_C_Path.hpp"
_display = uiNamespace getVariable ["MRHDebugHintBox",displayNull];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
if (IS_DEBUG) then {
290119 cutRsc ["MRHDebugHintBox", "PLAIN"];


} else {_display closedisplay 2};