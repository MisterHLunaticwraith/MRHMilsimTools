/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORNOUNSELECTED"]FUNC(deleteAndError)};
if !(_unit isKindOf "Man") exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEMAN"]FUNC(deleteAndError)};
if (!alive _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEALIVE"]FUNC(deleteAndError)};
_logic setVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",_unit];
createDialog "MRHZeusSimpleConv";
_display = findDisplay 11011982;
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_NAME = CTRLF(1000);
_PIC = CTRLF(1200);
_DELETE = CTRLF(2800);
_CANCEL = CTRLF(1601);
_NAME ctrlSetText name _unit;
_PIC ctrlSetText (getText (configFile>>"cfgVehicles">>typeOf _unit>>"editorPreview"));
_DELETE cbSetChecked true;
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
_CANCEL buttonSetAction "
((findDisplay 11011982) getVariable 'MRH_ZeusModules_displayparams') params ['_logic','_unit'];
deleteVehicle _logic; closeDialog 0;
";
