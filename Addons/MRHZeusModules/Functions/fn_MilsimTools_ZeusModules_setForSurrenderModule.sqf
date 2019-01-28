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
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"

_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORNOUNSELECTED"]FUNC(deleteAndError)};
if !(_unit isKindOf "Man") exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEMAN"]FUNC(deleteAndError)};
if (!alive _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEALIVE"]FUNC(deleteAndError)};
_logic setVariable ["MRH_fnc_MilsimTools_ZeusModules_attachedUnit",_unit];
createDialog "MRHSetSurrenderMenu";
_display = findDisplay 250119;
_display setVariable ["MRH_ZeusModules_displayparams",[_logic,_unit]];
#define CTRLF(ARG) ((_display) displayCtrl ARG)
_UNITNAME=CTRLF(1004);
_UNITCLASS =CTRLF(1006);
_UNITPIC = CTRLF(1200);
_UNITNAME ctrlSetText name _unit;
_UNITPIC ctrlSetText (getText (configFile>>"cfgVehicles">>typeOf _unit>>"editorPreview"));
_UNITCLASS ctrlSetText (typeOf _unit);
