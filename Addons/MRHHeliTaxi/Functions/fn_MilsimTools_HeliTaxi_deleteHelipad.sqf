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
[
    {
       deleteVehicle (_this select 0);
    }, 
    _this, 
    120
] call CBA_fnc_waitAndExecute;