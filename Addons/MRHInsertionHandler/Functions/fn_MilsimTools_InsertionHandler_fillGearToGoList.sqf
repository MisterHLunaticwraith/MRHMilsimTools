/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillGearToGoList;
*/
#include "MRH_C_Path.hpp"
_gear = (FUNC(sortGear)) select 1;
_ctrlList = FDIS(1502);
lbClear _ctrlList;
{ 
	_name = _x GVAR(supplyDropName);
	_index = _ctrlList lbAdd _name;
	_ctrlList lbSetData [_index,str _x];
	
}forEach _gear;