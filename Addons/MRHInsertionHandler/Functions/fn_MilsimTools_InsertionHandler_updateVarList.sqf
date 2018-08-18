/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_updateVarList;
*/
#include "MRH_C_Path.hpp"
_var = player getVariable ["MRH_InsertionHandler_playersToGo",[]];
_newList =[];
{
	if (alive _x) then {_newList pushBackUnique _x};
}forEach _var;
player SVAR(playersToGo,_newList,false);