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
params ["_displayIDD","_lisBoxIDD"];
_display = findDisplay _displayIDD;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_listBox = CTRLF(_lisBoxIDD);

_data = _listBox lbData (lbCurSel _listBox);
if (_data == "") exitWith {[objNull,localize "STR_MRH_MRHMRHZeusModules_ERRORNODATASEL"] call BIS_fnc_showCuratorFeedbackMessage;};

_listBox lbDelete (lbCurSel _listBox);