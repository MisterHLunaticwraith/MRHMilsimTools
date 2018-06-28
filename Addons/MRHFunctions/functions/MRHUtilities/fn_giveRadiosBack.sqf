/*
Function name:MRH_fnc_giveRadiosBack
Author: Mr H.
Description: Restore's the unit's radios.
Return value: None
Public: Yes
Parameters:
0- <OBJECT> - Unit to give radios back to
Example(s):
[player] call MRH_fnc_giveRadiosBack;
*/

params ["_unit"];
{_unit addItem _x} forEach (_unit getvariable "MRH_ACRE_PreviouslyEquipedRadio");