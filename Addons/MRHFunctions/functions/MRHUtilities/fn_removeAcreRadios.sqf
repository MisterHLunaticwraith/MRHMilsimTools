/*
MRH_RemoveAcreRadios
author MR H.
this script lists and removes all acre 2 radios from the unit's inventory and stores them in a variable for later.
eg
{[_x] call MRH_fnc_removeAcreRadios;} forEach ThisList;
*/
params ["_unit"];
_allItems = items _unit;
_previouslyEquipedRadios = [];
///lists equiped radios
{
_step1 = _x splitString "_";
if ((_step1 select 0) == "ACRE") then {_previouslyEquipedRadios pushBackUnique _x;};
} forEach _allItems;

///saves the radios into an array
_unit setVariable ["MRH_ACRE_PreviouslyEquipedRadio", _previouslyEquipedRadios, false];

{
_unit removeItem _x;
} forEach _previouslyEquipedRadios;