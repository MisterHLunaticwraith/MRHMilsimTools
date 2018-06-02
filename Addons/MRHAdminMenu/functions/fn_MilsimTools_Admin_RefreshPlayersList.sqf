/*
Function name: MRH_fnc_MilsimTools_Admin_RefreshPlayersList
Author: Mr H.
Description: Refreshes the list of players
Return value: None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_Admin_RefreshPlayersList;
*/
#include "MRH_C_Path.hpp"


//fill players list
_playerListDis = FDIS(1500);
lbClear 1500;
_alivePlayers = PLAYERREGISTRY_ALIVE;
_deadPlayers = PLAYERREGISTRY_CURDEAD;
//with alive players first
{
_name = _x select 1;
_uid = _x select 0;
_actualPlayer = [_uid] CFUNC(FindPlayerByUID);
_playerIntel = _actualPlayer EGVAR(MilsimTools_Core_PlayerIntel);
_group = _playerIntel select 0;
_role = _playerIntel select 1;
_rf = _playerIntel select 2;
_rankIntel = [_actualPlayer] call MRH_fnc_MilsimTools_Core_LocRankIntel;
_locRank = _rankIntel select 0;
_rankPAA = _rankIntel select 1;

_playernammetext = format ["%1, %2", _role,_name];

_toolTip = format [localize "STR_MRH_FILL_PL_LIST_TOOLTIP",_locRank,_group,_rf];


 
_index = _playerListDis lbAdd  _playernammetext;
lbSetData [1500, _index , _uid];
lbSetPictureColor [1500, _index, [0,0,0,0]];
lbSetPicture [1500, _index, PAAPATH(alive.paa)];
lbSetPictureRight [1500, _index, _rankPAA];
lbSetTooltip [1500,_index,_toolTip];
}forEach _alivePlayers;
//with dead players
{
_name = _x select 1;
_uid = _x select 0;
_actualPlayer = [_uid] CFUNC(FindPlayerByUID);
_playerIntel = _actualPlayer EGVAR(MilsimTools_Core_PlayerIntel);
_group = _playerIntel select 0;
_role = _playerIntel select 1;
_rf = _playerIntel select 2;
_rankIntel = [_actualPlayer] call MRH_fnc_MilsimTools_Core_LocRankIntel;
_locRank = _rankIntel select 0;
_rankPAA = _rankIntel select 1;

_playernammetext = format ["%1, %2", _role,_name];

_toolTip = format [localize "STR_MRH_FILL_PL_LIST_TOOLTIP",_locRank,_group,_rf];


 
_index = _playerListDis lbAdd  _playernammetext;
lbSetData [1500, _index , _uid];
lbSetPictureColor [1500, _index, [0,0,0,0]];
lbSetPicture [1500, _index, PAAPATH(dead.paa)];
lbSetPictureRight [1500, _index, _rankPAA];
lbSetTooltip [1500,_index,_toolTip];
}forEach _deadPlayers;