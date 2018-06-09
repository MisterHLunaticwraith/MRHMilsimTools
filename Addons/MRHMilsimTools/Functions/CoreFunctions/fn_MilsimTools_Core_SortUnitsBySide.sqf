/*
Function name:MRH_fnc_MilsimTools_Core_SortUnitsBySide
Author: Mr H.
Description: returns an array of all units for a side from given unit list
Return value: <ARRAY> of <UNITS>
Public: No
Parameters:
0 - <ARRAY> of <UNITS>
1 -<SIDE> Can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown. 
Example(s):
[playableUnits,side player]call MRH_fnc_MilsimTools_Core_SortUnitsBySide;
*/
params ["_units","_inputSide"];
_unitsForSide = [];
{
if (side _x == _inputSide) then {_unitsForSide pushBackUnique _x};
}forEach _units;
_unitsForSide