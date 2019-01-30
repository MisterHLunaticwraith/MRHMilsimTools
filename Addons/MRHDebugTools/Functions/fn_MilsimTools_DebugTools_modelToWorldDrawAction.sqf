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
TRACE("Draw modelToWorld menu opened");
createDialog "MRHimputDistDial";
true