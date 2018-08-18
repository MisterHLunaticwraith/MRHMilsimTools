/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_addToVarList;
*/
#include "MRH_C_Path.hpp"
params ["_toAdd","_list"];
if (!alive _toAdd) ExitWith{};
_var = player getVariable ["MRH_InsertionHandler_" + _list,[]];
_var pushBackUnique  _toAdd;
player setVariable ["MRH_InsertionHandler_" + _list,_var];