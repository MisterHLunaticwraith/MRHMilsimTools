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
params ["_pivot","_compObjects",["_maxDist",-1]];
if (_maxDist != -1) then {
	{
		if ((_x distance _pivot) <= _maxDist) then {deleteVehicle _x};
	} forEach _compObjects;
} else {
	{
		deleteVehicle _x;
	} forEach _compObjects;
};