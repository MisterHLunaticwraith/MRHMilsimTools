/*
Function name:MRH_fnc_removeAcreRadios
Author: Mr H.
Description: Removes all acre 2 radios from the unit's inventory and stores them in a variable for later.
Return value: None
Public: Yes
Parameters:
0 - <OBJECT> - Unit to remove the radios to
Example(s):
[player] call MRH_fnc_removeAcreRadios;
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