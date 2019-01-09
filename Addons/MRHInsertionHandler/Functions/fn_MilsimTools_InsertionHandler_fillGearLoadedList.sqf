/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_fillGearLoadedList
Author: Mr H.
Description: fills the list of loaded gear; refreshes lists
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillGearLoadedList;
*/
#include "MRH_C_Path.hpp"
_spaceLeft = FUNC(checkCargoSpace);
_gear = (FUNC(sortGear)) select 0;
_ctrlList = FDIS(1503);
if !(_spaceLeft) then {hintC (localize "STR_MRH_MRHInsertionHandler_hintCMaximumLoadForVeh")};

lbClear _ctrlList;
{ 
	_name = _x GVAR(supplyDropName);
	_index = _ctrlList lbAdd _name;
	_ctrlList lbSetData [_index,str _x];
	if !(_spaceLeft) then {_ctrlList lbSetColor [_index,[1,0,0,1]]} else {_ctrlList lbSetColor [_index,[0,1,0,1]]};

}forEach _gear;
FUNC(checkListUpdate);