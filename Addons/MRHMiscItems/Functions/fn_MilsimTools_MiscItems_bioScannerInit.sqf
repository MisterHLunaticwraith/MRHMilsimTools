/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
this setVariable ["useScanner",[true,[[true,"systemchat 'it worked'"],[false,""],[false,""]]]]
*/
#include "MRH_C_Path.hpp"
if (is3DEN) exitWith {};
params ["_do","_scanner"];

waitUntil {time>1};

if !(_do) exitWith {};
_scanner setVariable ['MRH_ScannerSettings_autoLockNearestDoor',_do,true];

_building = nearestBuilding _scanner;
_doorNumber = [_scanner] CFUNC(nearestDoorNumber);
[_building,_doorNumber] CFUNC(toggleDoorState);