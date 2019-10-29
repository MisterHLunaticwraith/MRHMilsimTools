/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"
params ["_screens","_capable"];
private _screensClasses = _screens apply {typeOf _x};
private _has = _screensClasses arrayIntersect _capable; //prefered to isKindOf because more can be added
if (_has isEqualTo []) exitWith {false};
true