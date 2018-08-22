/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_listAirdropSuppliesForSide
Author: Mr H.
Description: Lists objects that are prepared for loading in a 100m radius to the calling unit, for unit's side 
Return value:<ARRAY> of available <OBJECT>
Public: No
Parameters:
0- <OBJECT> - unit that serves as a refernece position
1-<SIDE> side to check for in prepped objects.
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