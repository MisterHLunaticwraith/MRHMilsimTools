/*
Function name:MRH_fnc_MilsimTools_DebugTools_readAbleList
Author: Mr H.
Description:Returns a "readable" string of all addons/ or all mods
Return value: <STRING> with line jumps between each
Public: Yes
Parameters:
0 <BOOL> optional, default false if true will list mods instead of addons
Example(s):
_myAddons = call MRH_fnc_MilsimTools_DebugTools_readAbleList; //will list all addons except vanilla ones 
_myMods= true call MRH_fnc_MilsimTools_DebugTools_readAbleList; // will list all mods with a proper cfgMods
*/
#include "MRH_C_Path.hpp"
params[["_listMods",false]];
private _all =FUNC(ListModsAndAddons);
private _selection = _all select 1;
if (_listMods) then {_selection = _all select 2};
_selection = _selection call BIS_fnc_sortAlphabetically;
private _result = [];
{
	_result append [_x,endl];
} forEach _selection;
_result joinString ""