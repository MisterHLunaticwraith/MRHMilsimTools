/*
Function name:  MRH_fnc_MilsimTools_Core_RemoteForServer
Author: Mr H.
Description: finds player owner number on server and executes given script on the player's machine
Return value: true or false if player wasn't found
Public: No
Parameters: 
0 - <NUMBER> - targeted Player steam UID
1 - <CODE> code to remote exec, must be stated between {}
Example(s):
[[_uid,_code],MRH_fnc_MilsimTools_Core_RemoteForServer] RemoteExec ["Call",[0,2] select isDedicated];
*/
params ["_uid","_passedParams","_code"];
#include "MRH_C_Path.hpp"
_allMRHplayers = PLAYERREGISTRY_ONLINE;


_playerParams = [];
{
 if (_uid == _x select 0) then {_playerParams = _allMRHplayers select (_allMRHplayers find _x);};
} forEach _allMRHplayers;
if (_playerParams isEqualTo []) ExitWith {Diag_Log format ["MRH_MilsimTools, player with UID %1 wasn't found in registry", str _uid]; false};
_ownerID = _playerParams select 2;
[_passedParams,_code] RemoteExec ["Call",_ownerID];
