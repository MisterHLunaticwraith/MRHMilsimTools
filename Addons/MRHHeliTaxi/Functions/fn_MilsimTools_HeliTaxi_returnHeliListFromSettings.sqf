/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"

params ["_settingsRef"];
_string = [_settingsRef] call cba_settings_fnc_get;
_resultingArray = _string splitString ",";
_resultingArray