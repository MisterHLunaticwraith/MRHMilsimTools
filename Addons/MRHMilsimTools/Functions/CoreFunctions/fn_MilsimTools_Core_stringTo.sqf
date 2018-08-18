/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_stringTo;
*/
#include "MRH_C_Path.hpp"
params ["_string",["_type",""]];


_return = false;
_toSearch = [];
switch (true) do {
	case (_type == "") : {};
	case (_type == "Obj") : {_toSearch =allMissionObjects "All"};
	case (_type == "Grp") : {_toSearch = allGroups};
	case (_type == "Player") : {_toSearch = allPlayers;};
	case (_type == "PlUnits") : {_toSearch = playableUnits};
	case (_type == "AllUnits") : {_toSearch = allUnits};
};
{
	if (str _x == _string) then {_return = _x};
} forEach _toSearch;

_return