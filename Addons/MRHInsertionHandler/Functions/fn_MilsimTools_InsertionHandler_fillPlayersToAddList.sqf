/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillPlayersToAddList;
*/
#include "MRH_C_Path.hpp"
_listbox = FDIS(1500);
_selectedGrpStr = lbData [2102,(lbCurSel 2102)];

_grp = [_selectedGrpStr,"Grp"] CFUNC(stringTo);


_units = units _grp;
_unitsToDrop = player GVARDef(playersToGo,[]);
lbclear _listbox;
{
	if (!(_x in _unitsToDrop) && alive _x && ((_x distance player)<100)) then 
	{
	_name = name _x;
	_index = _listbox lbAdd _name;
	_data = _listbox lbSetData [_index,str _x];
	};

}forEach _units;