/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[player,side player] call MRH_fnc_MilsimTools_InsertionHandler_listAirdropSuppliesForSide;
*/
#include "MRH_C_Path.hpp"
params ["_player","_side"];
_allNearObjects = _player nearObjects 100;
_allAvailableSupplies = [];
{
	_condition = _x getVariable [("MRH_InsertionHandler_isAirDropSupply_" + str _side),false];
	if (_condition) then {_allAvailableSupplies pushBackUnique _x};
}forEach _allNearObjects;
_allAvailableSupplies