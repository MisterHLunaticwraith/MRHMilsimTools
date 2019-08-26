/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description: removes given object from given variable attached to the player
Return value: None
Public:No
Parameters:
0-<OBJECT> object to remove from list
1-<STRING> name of the list to combine to the variable string
Example(s):

[someObject,"someListName"] call MRH_fnc_MilsimTools_InsertionHandler_removeFromVarList;
*/
#include "MRH_C_Path.hpp"
params ["_toRemove","_list"];
_var = MRH_player getVariable ["MRH_InsertionHandler_" + _list,[]];
_index = _var find _toRemove;
if (_index == -1) ExitWith {};
_var deleteAt _index;
MRH_player setVariable ["MRH_InsertionHandler_" + _list,_var];