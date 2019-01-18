/*
Function name:MRH_fnc_MilsimTools_AddonName_attributeVariableNameModule
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_attributeVariableNameModule;
*/
#include "MRH_C_Path.hpp"


_display = findDisplay 14012019;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_vars = _display getVariable "MRH_ZeusModules_displayparams";
_vars params ["_logic","_unit"];
_EDIT = CTRLF(1400);
_newValue = ctrlText _EDIT;
if ([_newValue] CFUNC(isExistingVariableName)) exitWith {
	_errorMessage = localize "STR_MRH_MRHMRHZeusModules_ERRORUSEDNAME";
	[objNull, _errorMessage] call BIS_fnc_showCuratorFeedbackMessage;
["Error", _errorMessage, 5] call BIS_fnc_curatorHint;
};
[_unit,_newValue] CFUNC(attributeVariableName);
closedialog 0;