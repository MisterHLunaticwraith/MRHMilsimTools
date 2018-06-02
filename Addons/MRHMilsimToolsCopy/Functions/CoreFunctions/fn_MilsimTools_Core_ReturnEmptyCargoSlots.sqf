/*
Function name:MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots;
Author: Mr H.
Description: Checks if a vehicle is full (cargo seats only) and returns an array of empty cargo indexes
Return value: array in the form: [isFull<BOOLEAN> false if there are empty seats true if vehicle is full,[<ARRAY> of empty cargo indexes]]
Public:Yes
Parameters: 0- <OBJECT> vehicle to test
Example(s):
[vehicle player] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots;
or
_isFull = ([vehicle player] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots) select 0;// returns true or false
or
_emptySeats = ([vehicle player] call MRH_fnc_MilsimTools_Core_ReturnEmptyCargoSlots) select 1; // returns an array of numbers for empty cargo indexes;
*/

params ["_vehicle"];
_fullcrew = fullcrew [_vehicle, "Cargo", true];
_isFull = false;
_emptySeat = [];
{
	if (isNull (_x select 0)) then {_emptySeat pushBackUnique (_x select 2)};
}forEach _fullcrew;
if (_emptySeat isEqualTo []) then {_isFull = true};
[_isFull,_emptySeat]