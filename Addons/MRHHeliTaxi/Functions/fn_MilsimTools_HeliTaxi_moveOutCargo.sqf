/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_MoveOutCargo;
Author: Mr H.
Description: Moves out all CARGO units from a vehicle (not flight crew including gunners).
Units flagged by script with variable "MRH_HeliTaxi_isHeliCrew" will not be moved out
Return value: <ARRAY> of moved out unit
Public:
Parameters:
0-<OBJECT>vehicle
Example(s):
[medEvacHeli] call MRH_fnc_MilsimTools_HeliTaxi_MoveOutCargo;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
[_veh,false] CFUNC(lockNonCargo);
_cargoCrew = fullCrew [_veh, "cargo", false];
_movedOut = [];
{
	if !(_x getVariable ["MRH_HeliTaxi_isHeliCrew",false]) then
	{
	unassignVehicle _x;
	moveOut _x;
	_movedOut pushBackUnique _x;
	};
} forEach (crew _veh); //_cargoCrew;
[_veh] CFUNC(lockNonCargo);

_movedOut