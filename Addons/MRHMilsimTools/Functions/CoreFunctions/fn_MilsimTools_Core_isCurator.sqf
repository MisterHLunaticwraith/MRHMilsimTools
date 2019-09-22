/*
Function name:MRH_fnc_MilsimTools_Core_isCurator
Author: Mr H.
Description: Creates and assigns a player a zeus curator. Must be executed on player's machine
Return value: None
Public: No
Parameters:
 0- <OBJECT> player object that will receive zeus powers

Example(s):
[player]call MRH_fnc_MilsimTools_Core_isCurator;
*/
#include "MRH_C_Path.hpp"
if (is3DEN) exitWith{};
_this spawn {
		params ["_unit"];
		waitUntil {(time>5) && (player == _unit)};
		[[_unit],MRH_fnc_MilsimTools_Core_serverCreateCurator] RemoteExec ["Call",2];
		_toTrace = format ["isCurator function called for %1",_unit];
		TRACE(_toTrace);
	};