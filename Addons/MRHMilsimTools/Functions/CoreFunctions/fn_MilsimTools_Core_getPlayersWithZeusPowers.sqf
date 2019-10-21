/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
call MRH_fnc_MilsimTools_Core_getPlayersWithZeusPowers;
*/
#include "MRH_C_Path.hpp"
private _all = [];
{
	_all pushBackUnique (getAssignedCuratorUnit _x);
}forEach allCurators;
_all