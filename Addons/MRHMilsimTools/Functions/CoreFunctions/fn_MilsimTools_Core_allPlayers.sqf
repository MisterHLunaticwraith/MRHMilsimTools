/*
Function name:MRH_fnc_MilsimTools_Core_allPlayers
Author: Mr H.
Description: Sets the variables MRH_allplayers (allplayers excluding HCs), MRH_allAlivePlayers  (allplayers excluding HCs that are considered alive by Milsim Tools) and MRH_allAliveAndConsciousPlayers  (allplayers excluding HCs that are considered alive by Milsim Tools and conscious by ACE3) on the LOCAL machine various events call this function on every machine. 
NOTE: These are auto-updated everywhere:
-Whenever a player connects 
-Whenever a player disconnects
-Whenever a player is killed
-Whenever a player's conscious state is changed
-Whenever a player respawns
-Whenever the setRevived function is called on a unit

Return value: MRH_allPlayers OR MRH_allAlivePlayers OR MRH_allAliveAndConsciousPlayers depending on the input parameter, default is MRH_allPlayers
Public: Yes
Parameters:
 0- <NUMBER> optionnal, if 0 (default) will return MRH_allPlayers, 1 MRH_allAlivePlayers,2 MRH_allAliveAndConsciousPlayers

Example(s):
call MRH_fnc_MilsimTools_Core_allPlayers;
0 call MRH_fnc_MilsimTools_Core_allPlayers;
//both of the above return MRH_allPlayers

1 call MRH_fnc_MilsimTools_Core_allPlayers; //returns MRH_allAlivePlayers
2 call MRH_fnc_MilsimTools_Core_allPlayers; // returns MRH_allAliveAndConsciousPlayers

*/
#include "MRH_C_Path.hpp"
params [["_return",0]];

// MRH_allPlayers excludes HCs
MRH_allPlayers = allPlayers - entities "HeadlessClient_F";

//MRH_allAlivePlayers excludes players that are considered dead by the mod & excludes HCs
private _MRH_allAlivePlayers = [];
{
	if !(_x getVariable ["MRH_MilsimTools_Core_HasDied",false]) then {_MRH_AllAlivePlayers pushBackUnique _x};
} forEach MRH_allPlayers;

MRH_allAlivePlayers = _MRH_allAlivePlayers;

//MRH_allAliveAndConsciousPlayers excludes players that are considered dead by the mod,unconscious by ACE3 & excludes HCs
private _MRH_allAliveAndConsciousPlayers =[];
{
	if ([_x] call ace_common_fnc_isAwake) then {_MRH_allAliveAndConsciousPlayers pushBackUnique _x};
}forEach _MRH_allAlivePlayers;

MRH_allAliveAndConsciousPlayers = _MRH_allAliveAndConsciousPlayers;
([MRH_allPlayers,MRH_allAlivePlayers,MRH_allAliveAndConsciousPlayers] select _return)