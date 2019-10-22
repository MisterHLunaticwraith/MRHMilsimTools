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
if (is3DEN) exitWith {["Is 3Den func exited"] call MRH_fnc_MilsimTools_DebugTools_trace;};
params ["_do","_scanner"];

waitUntil {time>1};

if !(_do) exitWith {private _message = format ["Scanner %1 setting: do not lock ",_scanner]; [_message] call MRH_fnc_MilsimTools_DebugTools_trace;};
_scanner setVariable ['MRH_ScannerSettings_autoLockNearestDoor',_do,true];

private "_building";
_bldStr = _scanner getVariable ["MRH_ScannerSettings_controlledBuilding","<NULL-object>"];
if (_bldStr != "<NULL-object>") then {_building = call compile _bldStr} else {_building = nearestBuilding _scanner;};


_doorNumber = [_scanner,_building] CFUNC(nearestDoorNumber);
[_building,_doorNumber] CFUNC(toggleDoorState);
private _message = format ["Bioscanner %1 lock  engaged for building %2 door %3",_scanner,_building,_doorNumber];
[_message]call MRH_fnc_MilsimTools_DebugTools_trace;