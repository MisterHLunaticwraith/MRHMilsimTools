/*
Function name:MRH_fnc_MilsimTools_Core_SortGroupsBySide
Author: Mr H.
Description: returns an array of all groups for a side from given group list
Return value: <ARRAY> of <GROUPS>
Public: No
Parameters:
0 - <ARRAY> of <GROUPS> + provided side
1 -<SIDE> Can be West / Blufor (Arma 3), East / Opfor (Arma 3), Resistance / Independent (Arma 3), Civilian, sideLogic, Friendly, Enemy or Unknown. 
Example(s):
[allGroups,side player]call MRH_fnc_MilsimTools_Core_SortGroupsBySide;
*/
params ["_groups","_inputSide"];
_groupsForSide = [];
{
if (side _x == _inputSide) then {_groupsForSide pushBackUnique _x};
}forEach _groups;
_groupsForSide