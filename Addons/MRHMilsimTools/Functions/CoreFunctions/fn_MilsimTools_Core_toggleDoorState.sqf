/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_toggleDoorState;
*/
#include "MRH_C_Path.hpp"

params ["_building","_doorNumber"];
_isLocked = _this FUNC(isLockedDoor);
[_building,_doorNumber,(_isLocked)] FUNC(lockDoor);