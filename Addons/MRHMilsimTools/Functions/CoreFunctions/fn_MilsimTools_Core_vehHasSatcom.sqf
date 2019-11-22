/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
#include "..\..\bftVehicles.inc"
private _type = typeOf _veh;
if (_type in _bftVehs) exitWith {true};
if ((getNumber (configFile>>"cfgVehicles">>_type>>"mrh_satcom"))>0) exitWith {true};
false
