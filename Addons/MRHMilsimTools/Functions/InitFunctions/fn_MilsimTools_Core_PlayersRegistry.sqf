/*
Function name: MRH_fnc_MilsimTools_Core_PlayersRegistry
Author: Mr H.
Description: keeps track ON THE SERVER of all players,online at startup, currently online, disconnected midgame, dead and still on server, dead (including those who have disconnected) each player is stored in an array containing:
[0 - <NUMBER> player UID, 1 - <STRING> player name,2 -<NUMBER>Owner ID as known to the server].
The function generates 6 tables in the missionNamespace that are constantly updtated.
"MRH_MilsimTools_Core_allPlayersAtInit" ==> players that were present at mission start, only updated once at startup
"MRH_MilsimTools_Core_allPlayersOnline" ==> players that are currently online, updated whenever a player logs in or disonnects
"MRH_MilsimTools_Core_allDisconnectedPlayers" ==> players that left the server midgame, updated whenever a player leaves or comes back to the server.
"MRH_MilsimTools_Core_allCurrentlyDeadPlayers" ==> players that are currently dead, updated whenever a player dies or is revived, reconnecting dead players will be killed automatically.
"MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers" ==> (remove from above list when disconnected, remove from this list when re connected)
"MRH_MilsimTools_Core_allAlivePlayers" ==> lists all alive players
Return value:None
Public:No
Parameters: None
Example(s):
called on server only by cba post init eventhandlers
*/
//spawn: wait for first player to init before starting

#include "MRH_C_Path.hpp"

	
	// adds mission EH when a player disconnects
addMissionEventHandler ["PlayerDisconnected", 
{
	params ["_id", "_uid", "_name", "_jip", "_ownerID"];
			//updates the list of disconnected players
	_listDisconnected = missionNamespace getVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",[]];
	_playerData = [_uid,_name,_ownerID];
	_listDisconnected pushBackUnique _playerData;
	missionNamespace setVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",_listDisconnected,true];
	
	//if the player had died when disconnecting they will be removed from the list of deadPlayers
	_deadPlayers = missionNamespace getVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",[]];
	_newAllDeadPlayers = +_deadPlayers;
		if !(_deadPlayers isEqualTo []) then 
	{
		{
		if (_uid == _x select 0) then {_newAllDeadPlayers deleteAt (_newAllDeadPlayers find _x);};
		} forEach _deadPlayers;
		missionNamespace setVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",_newAllDeadPlayers,true];
	};
	//add delay for disconnecting before calling function
	[{call MRH_fnc_MilsimTools_Core_GenAliveAndDead; Diag_Log "MRH_MilsimToolsCore PlayerDisconnected EH fired";},[], 3] call CBA_fnc_waitAndExecute;
	0 FUNC(allPlayers);
	["MRH_playerDisconnected_EH",_this] call CBA_fnc_globalEvent;

}];

	// adds mission EH when a player Connects

addMissionEventHandler ["PlayerConnected", 
{
	#include "MRH_C_Path.hpp"
	params ["_id", "_uid", "_name", "_jip", "_ownerID"];
	

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
	//updates list with new deadplayer ownerID
	_allDeadPlayersInclude = missionNamespace getVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",[]];

	_deadPlayersNew = +_allDeadPlayersInclude;		
	{

		if (_uid == _x select 0) then 
		{
		_deadPlayersNew deleteAt (_deadPlayersNew find  _x);
		_playerData = [_uid,_name,_ownerID];
		_deadPlayersNew pushbackUnique _playerData;
		};
	;
	} forEach _allDeadPlayersInclude; 

	missionNamespace setVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",_deadPlayersNew,true];
	call MRH_fnc_MilsimTools_Core_SetPlayerIntel; //Updates player intel
	Diag_Log "MRH_MilsimToolsCore Player Connected EH Fired";
	0 FUNC(allPlayers);
	["MRH_playerConnected_EH",_this] call CBA_fnc_globalEvent;
}];
	
//delete bodies of disconnected players
addMissionEventHandler ["HandleDisconnect", 
{
	params ["_unit", "_id", "_uid", "_name"];
	_deleteSetting = ["MRH_MilsimTools_Delete_disconnected_body"] call cba_settings_fnc_get;
	if (_deleteSetting) then 
		{
		deleteVehicle _unit;
		};
	Diag_Log "MRH_MilsimToolsCore HandleDisconnect EH fired";
}];

//waits 30 seconds and updates players at init & alive players list
[{!(allPlayers isEqualTo [])},
	{
		[
			{
				_listConnectedAtMissionStart = FUNC(GenAllOnline);
				missionNamespace setVariable ["MRH_MilsimTools_Core_allPlayersAtInit",_listConnectedAtMissionStart,true];
				missionNamespace setVariable ["MRH_MilsimTools_Core_allAlivePlayers",_listConnectedAtMissionStart,true];
			},
			[], 
			30
		] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;
TRACE("MRH MilsimTools serverInit PlayersRegistry Initialized");