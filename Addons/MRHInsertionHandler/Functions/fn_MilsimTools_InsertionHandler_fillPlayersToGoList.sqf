/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_fillPlayersToGoList
Author: Mr H.
Description: Fills the list of players selected to be onboard, refreshes lists
Return value: None
Public:No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_fillPlayersToGoList;
*/
#include "MRH_C_Path.hpp"
_listBox = FDIS(1501);
lbClear _listBox;
_spaceLeft = FUNC(checkCargoSpace);
FUNC(refreshCargoRoomIntel);
if !(_spaceLeft) then {hintC (localize "STR_MRH_MRHInsertionHandler_hintCMaximumLoadForVeh")};
_allPlayersToGo = MRH_player getVariable ["MRH_InsertionHandler_playersToGo",[]];
{
	if(alive _x) then {
	_name = name _x;
	_index = _listBox lbAdd _name;
	_data = _listBox lbSetData [_index,str _x];
	if !(_spaceLeft) then {_listBox lbSetColor [_index,[1,0,0,1]]} else {_listBox lbSetColor [_index,[0,1,0,1]]};
	};
}forEach _allPlayersToGo;
FUNC(checkListUpdate);