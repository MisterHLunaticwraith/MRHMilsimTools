/*
Function name:MRH_fnc_MilsimTools_DebugTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_DebugTools_openShowAddons;
*/
#include "MRH_C_Path.hpp"

createDialog "MRH_Display3DENAddons";

_display = findDisplay 390;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_LOGTEXT = CTRLF(1207);

_logToPrint = ([false,false]call MRH_fnc_MilsimTools_DebugTools_ListModsAndAddons) select 0;



_LOGTEXT ctrlSetText _logToPrint;
[390,1207] CFUNC(SetCtrlSize);
[390,1206] CFUNC(SetCtrlSize);