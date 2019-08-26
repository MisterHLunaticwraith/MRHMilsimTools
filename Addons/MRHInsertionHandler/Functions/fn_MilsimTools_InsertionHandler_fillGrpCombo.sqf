/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_fillGrpCombo
Author: Mr H.
Description: fills the combo of available groups to select units from with groups of the side of the player and with players in them only
Return value:None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillGrpCombo;
*/
#include "MRH_C_Path.hpp"
_combo =FDIS(2102);
_groupsWithPlayers = CFUNC(ListGroupsWithPlayers);
_allPlaySide = [_groupsWithPlayers,side MRH_player] CFUNC(SortGroupsBySide);


{
	_name = groupId _x;
	_index= _combo lbAdd _name;
	_data = _combo lbSetData [_index,str _x];

}forEach _allPlaySide;
_combo lbSetCurSel 0;