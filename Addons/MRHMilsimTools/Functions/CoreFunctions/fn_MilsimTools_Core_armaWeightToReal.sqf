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
	params ["_weight"];
	private ["_weightReal","_units"];
	if (systemOfUnits !=2)then {_weightReal = _weight/22;_units = "Kg."}else {_weightReal = _weight/10;_units = "Lbs."};
	[_weightReal,_units]