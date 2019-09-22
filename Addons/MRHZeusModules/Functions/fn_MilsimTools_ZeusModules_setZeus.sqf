/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_startHaloJump;
*/
#include "MRH_C_Path.hpp"
#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_unit = attachedTo _logic;
//systemChat format ["%1 %2",_logic,attachedObjects _logic];

if (isNull _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORNOUNSELECTED"]FUNC(deleteAndError)};
if !(isPlayer _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRMUSTBEPLAYER"]FUNC(deleteAndError)};
if !(alive _unit) exitWith {[_logic,localize "STR_MRH_MRHMRHZeusModules_ERRORMUSTBEALIVE"]FUNC(deleteAndError)};
["MRH_EventsCuratorAssigned", [_unit],_unit] call CBA_fnc_targetEvent;
deleteVehicle _logic;
_message = format [(localize "STR_MRH_MRHMRHZeusModules_ZEUSPOWERSGRANTED"),name _unit];
[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
[localize "STR_MRH_MRHMRHZeusModules_setZeusName", _message, 5] call BIS_fnc_curatorHint;