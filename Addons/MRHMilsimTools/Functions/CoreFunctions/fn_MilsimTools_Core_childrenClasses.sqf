/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
_allFlyingClasses = ["Air"]call MRH_fnc_MilsimTools_Core_childrenClasses;
copytoclipboard str _allFlyingClasses
*/
#include "MRH_C_Path.hpp"
params ["_parentClass",["_cfg","cfgVehicles"],["_ignoreHidden",true]];
private _all = (configFile>>_cfg) call BIS_fnc_getCfgSubClasses;
private _result = [];
{
	if (_ignoreHidden && ((getNumber (configFile >> _cfg >> _x>>"scope"))<2)) then {}
	else
	{
		if (_parentClass in ([(configFile >> _cfg >> _x),true ] call BIS_fnc_returnParents)) then {_result pushBackUnique _x};	
	};
	
}forEach _all;
_result
