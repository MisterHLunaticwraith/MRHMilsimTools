/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
params ["_heli","_destination"];
_heli SVAR(isBusy,false,true);
[_heli,"Hovering",_destination]FUNC(handleMessages);