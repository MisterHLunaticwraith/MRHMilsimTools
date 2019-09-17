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
params ["_myvec"];
{
	_x setVariable ["MRH_HeliTaxi_isHeliCrew",true,true];
} forEach (crew _myVec);