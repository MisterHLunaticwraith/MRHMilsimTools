/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_isEmptyOfPlayers;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_isEmptyOfPlayers;
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
_isEmpty = true;
{
	if(_x in _veh) then {_isEmpty = false};
}forEach allPlayers;
_isEmpty