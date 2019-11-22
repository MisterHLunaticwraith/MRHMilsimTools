/*
Function name: MRH_fnc_MilsimTools_Core_SetRevived
Author: Mr H.
Description: Resets given player's "hasDied" variable and pings the server for table update
Return value: <BOOLEAN> - true when done
Public: Yes
Parameters:
0 - <OBJECT> Targeted player
Example(s):
[player] call MRH_fnc_MilsimTools_Core_SetRevived;
*/

params ["_target"];
//sets the hasdied variable
_target setVariable ["MRH_MilsimTools_Core_HasDied", false, true];
	
//Tells the server a player has died
[[],MRH_fnc_MilsimTools_Core_GenAliveAndDead] RemoteExec ["Call",0];
//

_allDeadPlayersInclude = missionNamespace getVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",[]];
_uid = getPlayerUID player;
_deadPlayersNew = +_allDeadPlayersInclude;		
{

if (_uid == _x select 0) then {_deadPlayersNew deleteAt (_deadPlayersNew find  _x);};
//if (_uid == _x select 0) then {_allDeadPlayersInclude deleteAt (_allDeadPlayersInclude find  _x);};
} forEach _allDeadPlayersInclude; 

missionNamespace setVariable ["MRH_MilsimTools_Core_allIncludingDisconnectedDeadPlayers",_deadPlayersNew,true];
["MRH_playerWasSetAsRevived",_target] call CBA_fnc_globalEvent;