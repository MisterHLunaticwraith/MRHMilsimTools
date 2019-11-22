/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_canConnectToVehSatCom;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
private _veh = objectParent _unit;
if (isNull _veh) exitWith {false};
([_veh]FUNC(vehHasSatcom))