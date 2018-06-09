/*
Function name: MRH_fnc_MilsimTools_SoldierTab_ShareData
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_ShareData;
*/
#include "MRH_C_Path.hpp"
if (ctrlShown FDIS(8202)) ExitWith {ctrlShow [8202,false];ctrlShow [8205,false];};
ctrlShow [8202,true];

lbclear 8202;
_unitsToSort = allPlayers;
_unitsForPlayerside = [_unitsToSort,side player] CFUNC(SortUnitsBySide);
_cbList = FDIS(8202);
{
_distance = player distance _x;
if (_distance <= 10) then 
	{
	_index = _cbList lbAdd name _x;
	_cbList lbSetData [_index,getplayerUID _x];
	};
} forEach _unitsForPlayerside;