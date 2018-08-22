/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_availabilityCountUpdate;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_availabilityCountUpdate;
*/
#include "MRH_C_Path.hpp"
params ["_side",["_substract",false]];

_currentlyUsed  = missionNamespace getVariable ["MRH_MilsimTools_HeliTaxi_currentlyUsedHelisPerSide_" + (str _side),0];
if(_substract) then {_currentlyUsed = _currentlyUsed -1} else {_currentlyUsed = _currentlyUsed +1 };
missionNamespace setVariable ["MRH_MilsimTools_HeliTaxi_currentlyUsedHelisPerSide_" + "EAST",_currentlyUsed,true];

