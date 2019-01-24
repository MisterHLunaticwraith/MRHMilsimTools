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
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORNOUNSELECTED"]FUNC(deleteAndError)};
createDialog "MRHChangeVarNameDialog";
_display = findDisplay 14012019;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
_CURNAME = CTRLF(1002);
_CURTYPE =  CTRLF(1004);
_PREV = CTRLF(1200);
_PREV ctrlSetText (getText (configFile>>"cfgVehicles">>typeOf _unit>>"editorPreview"));
_CURNAME ctrlSetText (str _unit);
_CURTYPE ctrlSetText (typeOf _unit);
deleteVehicle _logic;
