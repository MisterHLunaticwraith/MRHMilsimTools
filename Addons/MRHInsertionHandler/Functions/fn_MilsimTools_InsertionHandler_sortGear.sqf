/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description: sorts the prepped gear, sorts them between tagged loaded and not
Return value:
0-<ARRAY> of 2 <ARRAYS>of <OBJECTS> where 0 is an array of loaded gear and 1 array of unloaded gear
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_sortGear;
*/
#include "MRH_C_Path.hpp"
_gear = [MRH_player,side MRH_player] call MRH_fnc_MilsimTools_InsertionHandler_listAirdropSuppliesForSide;
_loaded = [];
_unloaded = [];
{
	_isLoaded = _x GVARDef(isLoaded,false);
	if (_isLoaded) then 
	{ 
		_loaded pushBackUnique _x;
	}
	else
	{
		_unloaded pushBackUnique _x;
	};
}forEach _gear;
_result =[_loaded,_unloaded];
_result