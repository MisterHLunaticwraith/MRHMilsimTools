/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
_display = findDisplay 220119;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_TITLE = CTRLF(1400);
_TEXT = CTRLF(1401);
if ((ctrlText _TITLE) isEqualTo "") exitWith {[objNull, localize "STR_MRH_MRHMRHZeusModules_ERRORNOTITLE"] call BIS_fnc_showCuratorFeedbackMessage;};
if ((ctrlText _TEXT) isEqualTo "") exitWith {[objNull, localize "STR_MRH_MRHMRHZeusModules_ERRORNOTEXT"] call BIS_fnc_showCuratorFeedbackMessage;};
[true] call MRH_fnc_MilsimTools_ZeusModules_dataCreatorSaveData;
_TITLE ctrlSetText "";
_TEXT ctrlSetText "";