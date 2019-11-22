/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
	params ["_unit"];

	private _allowedClasses = missionNamespace getVariable ["MRH_soldierTab_BFT_enabling_items_andVehs",[]];
	if !((_allowedClasses arrayIntersect (items _unit)) isEqualTo []) exitWith {true};
	if !((_allowedClasses arrayIntersect (AssignedItems _unit)) isEqualTo []) exitWith {true};
	private _type = (typeOf (objectParent _unit));
	if (_type in _allowedClasses) exitWith {true};
	if ((getNumber (configFile>>"cfgVehicles">>_type>>"mrh_satcom"))>0) exitWith {true};
	false