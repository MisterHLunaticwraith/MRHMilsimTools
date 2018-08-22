/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_onMapDoubleClick
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_onMapDoubleClick;
*/
#include "MRH_C_Path.hpp"
params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

_pos= _control ctrlMapScreenToWorld [_xPos,_yPos];
if (_ctrl) then {[_control,_pos]FUNC(createWaypoint);} else {[_pos]FUNC(createDestinationWP);};