/*
Function name: MRH_fnc_MilsimTools_Core_InitPlayerLocal
Author: Mr H.
Description: Sets player "MRH_MilsimTools_Core_HasDied" variable at init, calls the Jip menu if the plyaer joined midgame
Return value: None
Public: No
Parameters: None 
Example(s):
called from cba post init eventhandlers, clientside only
MRH_fnc_MilsimTools_Core_InitPlayerLocal;
*/
#include "MRH_C_Path.hpp"
TRACE("Player initialized InitPlayerLocal starting");
FUNC(BriefingAdminMenuLink);
//======init for the Has died variable
player setVariable ["MRH_MilsimTools_Core_HasDied", false, true];

//removes the map of players that are not leaders according to setting
_mapKeepSetting = ["MRH_MilsimTools_Rmv_map_nolead"] call cba_settings_fnc_get;
if (_mapKeepSetting) then 
{
	if (!isFormationLeader player) then {player unlinkItem "ItemMap";};
};
// play cutcene
_cutSceneSetting = ["MRH_MilsimTools_PlayIntro_ToPlayer"] call cba_settings_fnc_get;
if (_cutSceneSetting) then 
{
	call MRH_fnc_MilsimTools_Core_CutsceneToPlayer;
};

//===adds eventHandler when player is killed
_EHkilledIdx = player addEventHandler ["killed", 
	{
	
	//sets the hasdied variable
	player setVariable ["MRH_MilsimTools_Core_HasDied", true, true];
	
	//Tells the server a player has died
	[[],MRH_fnc_MilsimTools_Core_GenAliveAndDead] RemoteExec ["Call",0];
	// shows hint to admin
	[[],MRH_fnc_MilsimTools_Core_AdminDeadCount] RemoteExec ["Call",[0,-2] select isDedicated];
	["MRH_playerKilled",_this] call CBA_fnc_globalEvent;
	}
];

//====opens Jip menu if Player did jip
if (didJip) then {
	// checks if player was killed and disconnected
	_deadPlayers = missionNamespace getVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",[]];
	_uid = getPlayerUID player;
	_playerHasDiedAndReconnected = false;
		{
		if (_uid == _x select 0) then 
			{
			_playerHasDiedAndReconnected = true
			
			};
		} forEach _deadPlayers;
	// if so takes appropriate measures
	if (_playerHasDiedAndReconnected) then
	{

			_AdminPref = ["MRH_MilsimTools_AllowDeadReco"] call cba_settings_fnc_get;
			if (_AdminPref) then 
			{
			
			["MRH_SpawnedDead",[localize "STR_MRH_MS_SPAWNDEADMESSAGE"]] call BIS_fnc_showNotification;
			[{player setDamage 1;},[], 10] call CBA_fnc_waitAndExecute;
			
			};
	
		
	}
	else
	{
	Diag_log format ["MRHMilsimTools Core -Player %1 didJip status %2 - Jip Menu called",str player, str didJip];
	// if not calls the Jip Menu

		_adminJipPref = ["MRH_MilsimTools_Jip_MenuAllow"] call cba_settings_fnc_get;
		if (_adminJipPref) then 
			{
				call MRH_fnc_MilsimTools_Jip_Open_Menu;
			};
		
	};
};
_reinitUponRespawn = ["MRH_MilsimTools_ResetHasDiedOnRespawn"] call cba_settings_fnc_get;
if (_reinitUponRespawn) then {
	

	_EHrsp = player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		[player] call MRH_fnc_MilsimTools_Core_SetRevived;

	}];

};

player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		["MRH_playerRespawned_global",_this] call CBA_fnc_globalEvent;

	}];
//ReRegister just in case

[[],MRH_fnc_MilsimTools_Core_GenAliveAndDead] RemoteExec ["Call",0];

TRACE("Player initialized InitPlayerLocal Done");