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
params ["_building","_doorNumber"];
	_DoorString = "BIS_disabled_Door_" + _doorNumber;
	_isLocked = [false,true] select (_building getVariable [_DoorString,0]);
	_isLocked