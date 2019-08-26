/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_addToVarLis
Author: Mr H.
Description: adds given object to given list variable stored on the player.
Return value: None
Public:No
Parameters:
0-<OBJECT> object to add
1-<STRING> string to append to the variable name
Example(s):
[someUnit,"someListName"] call MRH_fnc_MilsimTools_InsertionHandler_addToVarList;
*/
#include "MRH_C_Path.hpp"
params ["_toAdd","_list"];
if (!alive _toAdd) ExitWith{};
_var = MRH_player getVariable ["MRH_InsertionHandler_" + _list,[]];
_var pushBackUnique  _toAdd;
MRH_player setVariable ["MRH_InsertionHandler_" + _list,_var];