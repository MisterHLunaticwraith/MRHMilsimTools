/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_isEmptyOfPlayers;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_isEmptyOfPlayers;//updated to is empty excluding crew
*/
#include "MRH_C_Path.hpp"
params ["_veh"];
_isEmpty = true;
{
	//if(_x in _veh) then {_isEmpty = false};
	private _isCrew = _x getVariable ["MRH_HeliTaxi_isHeliCrew",false];
	if !(_isCrew) then  {_isEmpty = false};
}forEach (crew _veh);
_isEmpty