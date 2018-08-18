/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_removeFromVarList;
*/
#include "MRH_C_Path.hpp"
params ["_toRemove","_list"];
_var = player getVariable ["MRH_InsertionHandler_" + _list,[]];
_index = _var find _toRemove;
if (_index == -1) ExitWith {};
_var deleteAt _index;
player setVariable ["MRH_InsertionHandler_" + _list,_var];