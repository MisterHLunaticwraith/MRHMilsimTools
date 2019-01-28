/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: Returns an array of free cargoIndex numbers for given vehicle to use with assignCargoIndex & moveInCargo
Return value: 
<ARRAY> of numbers
Public: No
Parameters:
0-<OBJECT> veicle to test

Example(s):
[myCar]call MRH_fnc_MilsimTools_Core_freeCargoIndexes;
*/
#include "MRH_C_Path.hpp"
params ["_vehicle"];
_allSeats = fullCrew [_vehicle, "cargo", true];
_allFreeSeatsIndexes = [];
{
	if (isNull (_x select 0)) then {_allFreeSeatsIndexes pushBackUnique (_x select 2)};
} forEach _allSeats;
_allFreeSeatsIndexes