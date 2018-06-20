/*
Function name:MRH_fnc_AllAlivePlayersInVehicle
Author: Mr H.
Description: tests if all remaining alive players are in the given vehicle
Return value: true if all survivors are in the vehicle, false otherwise
Public: yes
Parameters:
0 - <OBJECT> vehicle to test
Example(s):
[ExfilHeli] call MRH_fnc_AllAlivePlayersInVehicle;
can be used in a waituntil condition eg:
waitUntil {[ExfilHeli] call MRH_fnc_AllAlivePlayersInVehicle};
*/
params ["_veh"];

#include "MRH_C_Path.hpp"
_regAlive = PLAYERREGISTRY_ALIVE;
_return = true;
{
	_playerID = _x select 0;
	_player = [_playerID] CFUNC(findPlayerByUID);
	if !(_player in _veh) ExitWith {_return = false;_return};
} forEach _regAlive;
_return



/*olderversion below
_AllAlivePlayers = call MRH_fnc_AllAlivePlayers;
_return = 0;
if (_AllAlivePlayers isEqualTo []) ExitWith {_return};
_numberalive = count _AllAlivePlayers;
_numberinveh = 0;
{if (_x in _veh) then {_numberinveh = _numberinveh + 1};} forEach _AllAlivePlayers;

if (_numberinveh == _numberalive) then {_return = 1};
_return
*/