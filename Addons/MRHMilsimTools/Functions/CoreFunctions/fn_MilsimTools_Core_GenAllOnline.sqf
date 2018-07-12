/*
Function name:MRH_fnc_MilsimTools_Core_GenAllOnline;
Author: Mr H.
Description: Generates the list of all players online, updates registry
Return value: <ARRAY> of <ARRAYS> of connected players data in the form [uid,name,owner id]
Public: No
Parameters: None
Example(s):
[]call MRH_fnc_MilsimTools_Core_GenAllOnline;
*/
#include "MRH_C_Path.hpp"

if !(isServer) ExitWith {};

_allOnlinePlayers = [];
{
_uid = getPlayerUID _x;
_name = name _x;
_ownerID = owner _x;
_playerData = [_uid,_name,_ownerID];
if ((_ownerID != 2) or (!isDedicated)) then {_allOnlinePlayers pushBackUnique _playerData;}; //excludes players in the lobby
} forEach allplayers;
missionNamespace setVariable ["MRH_MilsimTools_Core_allPlayersOnline",_allOnlinePlayers,true];
_allOnlinePlayers