/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_updateVarList
Author: Mr H.
Description: updates variable of players to show in the personnel onboard list, removes dead units from the variable,just in case
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_updateVarList;
*/
#include "MRH_C_Path.hpp"
_var = MRH_player getVariable ["MRH_InsertionHandler_playersToGo",[]];
_newList =[];
{
	if (alive _x) then {_newList pushBackUnique _x};
}forEach _var;
MRH_player SVAR(playersToGo,_newList,false);