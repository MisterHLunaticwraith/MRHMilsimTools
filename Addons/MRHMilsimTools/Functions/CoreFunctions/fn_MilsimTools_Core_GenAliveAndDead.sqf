/*
Function name:MRH_fnc_MilsimTools_Core_GenAliveAndDead
Author: Mr H.
Description: Updates datatabase for alive and dead players
Return value: 
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_GenAliveAndDead;
*/
#include "MRH_C_Path.hpp"
if !(isServer) ExitWith {};
//updates dead players
_deadPlayers = missionNamespace getVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",[]];
_deadPlayersNew = +_deadPlayers;
_allDeadPlayersInclude = missionNamespace getVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",[]];
{
_deathCheck = _x getVariable ["MRH_MilsimTools_Core_HasDied",false];
if (_deathCheck) then 
	{
		Private ["_uid","_name","_ownerID","_PlayerData"];
		 _uid = getPlayerUID _x;
		 _name = name _x;
		 _ownerID = owner _x;
		 _playerData = [_uid,_name,_ownerID];
		 if ((_ownerID != 2) or (!isDedicated)) then 
		 {
			 _deadPlayersNew pushBackUnique _PlayerData;
			 _allDeadPlayersInclude pushBackUnique _PlayerData;
		 };
		missionNamespace setVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",_deadPlayersNew,true]; 
	}
else
	{
		
		Private ["_uid"]; 
		_uid = getPlayerUID _x;
		
		{
		
		if (_uid == _x select 0) then {_deadPlayersNew deleteAt (_deadPlayersNew find  _x);};
		//if (_uid == _x select 0) then {_allDeadPlayersInclude deleteAt (_allDeadPlayersInclude find  _x);};
		} forEach _deadPlayers; 
	};
}forEach allPlayers;
missionNamespace setVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",_deadPlayersNew,true];

// update list of all Alive players
_allOnlinePlayers = FUNC(GenAllOnline);
_allAlivePlayers = +_allOnlinePlayers;
	{
	_deathCheck = _deadPlayersNew find _x;
	if (_deathCheck != -1) then {_allAlivePlayers deleteAt (_allAlivePlayers find _x)};
	} forEach _allOnlinePlayers;
missionNamespace setVariable ["MRH_MilsimTools_Core_allAlivePlayers",_allAlivePlayers,true];
Diag_log "MRH_MilsimTools_Core Func GenAliveAndDead Called";