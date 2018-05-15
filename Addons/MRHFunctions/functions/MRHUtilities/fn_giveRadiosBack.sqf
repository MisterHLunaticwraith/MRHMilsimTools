/*
MRH_giveRadiosBack
author MR H.
this script restore's the unit's radios.
{[_x] call MRH_fnc_giveRadiosBack.sqf";} forEach ThisList;
*/
params ["_trigger"];
if (player inArea _trigger) ExitWith {};


{player addItem _x} forEach (player getvariable "MRH_ACRE_PreviouslyEquipedRadio");