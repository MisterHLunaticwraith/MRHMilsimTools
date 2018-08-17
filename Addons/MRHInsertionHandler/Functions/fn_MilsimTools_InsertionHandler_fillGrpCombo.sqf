/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillGrpCombo;
*/
#include "MRH_C_Path.hpp"
_combo =FDIS(2102);
_allPlaySide = [allGroups,side player] CFUNC(SortGroupsBySide);


{
	_name = groupId _x;
	_index= _combo lbAdd _name;
	_data = _combo lbSetData [_index,str _x];

}forEach _allPlaySide;
_combo lbSetCurSel 0;