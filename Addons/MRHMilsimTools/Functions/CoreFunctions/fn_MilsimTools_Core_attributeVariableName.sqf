/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: Attributes global variable name to provided object 
Return value: <BOOL> false if object already exists true otherwise 
Public: No
Parameters:
0- <OBJECT> - The object to name
1 - <STRING> - The name to use
Example(s):
[]call MRH_fnc_MilsimTools_Core_attributeVariableName;
*/
#include "MRH_C_Path.hpp"

params ["_object","_string"];
if ([_string]FUNC(isExistingVariableName)) exitWith {diag_log format ["MRH_MilsimToolsCore_attributeVarName: error variable name %1 already exists",_string];false};
[_this,
{
	params ["_object","_string"];
	_object setVehicleVarName _string;
}] remoteExec ["Call",0,true];
missionNamespace setVariable [_string,_object,true];
true