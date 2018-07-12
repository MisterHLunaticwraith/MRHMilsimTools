//deprecated function
/*
Function name:MRH_fnc_MilsimTools_Core_RegisterNewPlayer
Author: Mr H.
Description: Runs on server only, adds players to the registry if they did not do JIP
Return value: None
Public: No
Parameters:
0- <STRING> Player UID
Example(s):
[someplayeruid] call MRH_fnc_MilsimTools_Core_RegisterNewPlayer;
*/
#include "MRH_C_Path.hpp"

if (!isServer) ExitWith {};

Params ["_uid"];

_player = [_uid] FUNC(FindPlayerByUID);
_ownerID = owner _player;
_name = name _player;
_allPlayersOnline = missionNamespace getVariable ["MRH_MilsimTools_Core_allPlayersOnline",[]];
_playerData = [_uid,_name,_ownerID];
_allPlayersOnline pushBackUnique _playerData;
missionNamespace setVariable ["MRH_MilsimTools_Core_allPlayersOnline",_allPlayersOnline,true];

// if the player had disconnected before he is removed from the list of disconnected players
_listDisconnected = missionNamespace getVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",[]];
_newListDisconnected = _listDisconnected;
if !(_listDisconnected isEqualTo []) then 
{
	{
	if (_uid == _x select 0) then {_newListDisconnected deleteAt (_newListDisconnected find _x);};
	} forEach _listDisconnected;
	missionNamespace setVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",_newListDisconnected,true];
};
call MRH_fnc_MilsimTools_Core_SetPlayerIntel; //Updates player intel
//
MRH_MilsimTools_NewPlayerLogged = true;
publicVariableServer "MRH_MilsimTools_Core_NewPlayerLogged";