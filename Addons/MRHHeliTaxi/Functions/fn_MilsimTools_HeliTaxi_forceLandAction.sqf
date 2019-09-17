/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_forceLandAction;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_forceLandAction;
*/
#include "MRH_C_Path.hpp"
[[vehicle MRH_player],
{
	params ["_heli"];
	_statement = "GET IN";
	#include "exceptionlist.hpp"
	if((typeOf _heli) in _exceptionlist) then {_statement = "LAND"};//some helis do not touch ground when GET IN order is issued,replace by LAND
	_heli land _statement;//"GET IN";
}] remoteExec ["call",2];