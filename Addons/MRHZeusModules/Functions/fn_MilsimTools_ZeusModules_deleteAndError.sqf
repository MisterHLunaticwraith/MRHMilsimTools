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
params ["_logic",["_errorMessage","Undefined error message"]];
deleteVehicle _logic;
[objNull, _errorMessage] call BIS_fnc_showCuratorFeedbackMessage;
[localize "STR_MRH_MRHMRHZeusModules_GENERROR", _errorMessage, 5] call BIS_fnc_curatorHint;