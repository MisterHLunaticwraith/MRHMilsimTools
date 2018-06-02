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
[] spawn {
	#include "MRH_C_Path.hpp"

	//waits until player are created at mission start
	waitUntil {!(allPlayers isEqualTo [])};

	//Lists all players present at mission start with extra intel stores the list.
	_listConnectedAtMissionStart = [];
	{
		Private ["_uid","_name","_ownerID","_PlayerData"];
		 _uid = getPlayerUID _x;
		 _name = name _x;
		 _ownerID = owner _x;
		 _playerData = [_uid,_name,_ownerID];
		 _listConnectedAtMissionStart pushBackUnique _playerData;
	}forEach allplayers;

	missionNamespace setVariable ["MRH_MilsimTools_Core_allPlayersAtInit",_listConnectedAtMissionStart,true];
	missionNamespace setVariable ["MRH_MilsimTools_Core_allPlayersOnline",_listConnectedAtMissionStart,true];
	missionNamespace setVariable ["MRH_MilsimTools_Core_allAlivePlayers",_listConnectedAtMissionStart,true];

	// adds mission EH when a player disconnects
	addMissionEventHandler ["PlayerDisconnected", {
		params ["_id", "_uid", "_name", "_jip", "_ownerID"];
		
		//updates the list of disconnected players
		_listDisconnected = missionNamespace getVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",[]];
		_playerData = [_uid,_name,_ownerID];
		_listDisconnected pushBackUnique _playerData;
		missionNamespace setVariable ["MRH_MilsimTools_Core_allDisconnectedPlayers",_listDisconnected,true];
		
		//Removes player from the list of connected players
		_allPlayersOnline = missionNamespace getVariable ["MRH_MilsimTools_Core_allPlayersOnline",[]];
		_newAllPlayersOnline = +_allPlayersOnline;
		_deadPlayers = missionNamespace getVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",[]];
		_newAllDeadPlayers = +_deadPlayers;
		if !(_allPlayersOnline isEqualTo []) then 
		{
			{
			if (_uid == _x select 0) then {_newAllPlayersOnline deleteAt (_newAllPlayersOnline find _x);};
			} forEach _allPlayersOnline;
		};
		//if the player had died when disconnecting they will be removed from the list of deadPlayers
			if !(_deadPlayers isEqualTo []) then 
		{
			{
			if (_uid == _x select 0) then {_newAllDeadPlayers deleteAt (_newAllDeadPlayers find _x);};
			} forEach _deadPlayers;
			missionNamespace setVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",_newAllDeadPlayers,true];
		};
	}];

	// adds mission EH when a player Connects

	addMissionEventHandler ["PlayerConnected", {
		#include "MRH_C_Path.hpp"
		params ["_id", "_uid", "_name", "_jip", "_ownerID"];
		
		//puts a new JIP player in the list of online clients
		_allPlayersOnline = missionNamespace getVariable ["MRH_MilsimTools_Core_allPlayersOnline",[]];
		_playerData = [_uid,_name,_ownerID];
		if (_jip) then {_allPlayersOnline pushBackUnique _playerData};
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
		
	}];
	//updates the list of deadPlayers whenever a player has died or been revived
	_handler = {
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
				 _deadPlayersNew pushBackUnique _PlayerData;
				 _allDeadPlayersInclude pushBackUnique _PlayerData;
			}
		else
			{
				
				Private ["_uid"]; 
				_uid = getPlayerUID _x;
				
				{
				
				if (_uid == _x select 0) then {_deadPlayersNew deleteAt (_deadPlayersNew find  _x);};
				if (_uid == _x select 0) then {_allDeadPlayersInclude deleteAt (_allDeadPlayersInclude find  _x);};
				} forEach _deadPlayers; 
			};
		}forEach allPlayers;
		missionNamespace setVariable ["MRH_MilsimTools_Core_allCurrentlyDeadPlayers",_deadPlayersNew,true];
		missionNamespace setVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",_deadPlayersNew,true];
		// update list of all Alive players
		_allOnlinePlayers = missionNamespace getVariable ["MRH_MilsimTools_Core_allPlayersOnline",[]];
		_allAlivePlayers = +_allOnlinePlayers;
			{
			_deathCheck = _deadPlayersNew find _x;
			if (_deathCheck != -1) then {_allAlivePlayers deleteAt (_allAlivePlayers find _x)};
			} forEach _allOnlinePlayers;
		missionNamespace setVariable ["MRH_MilsimTools_Core_allAlivePlayers",_allAlivePlayers,true];
		};
		
	"MRH_MilsimTools_Core_PlayerDied" addPublicVariableEventHandler _handler;
	"MRH_MilsimTools_Core_PlayerRevived" addPublicVariableEventHandler _handler;
	
	//delete bodies of disconnected players
	addMissionEventHandler ["HandleDisconnect", 
	{
	params ["_unit", "_id", "_uid", "_name"];
	deleteVehicle _unit;
	}];
};