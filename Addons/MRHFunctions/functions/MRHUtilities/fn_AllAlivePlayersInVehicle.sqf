/*
this function tests that all the remaining alive players have boarded the given vehicle
params: _vehicle
returns 0 if false, 1 if true
eg:
[ExfilHeli] call MRH_fnc_AllAlivePlayersInVehicle
can be used in scripts and trigger waitUntil with {[_veh] call MRH_fnc_AllAlivePlayersInVehicle == 1}
*/
params ["_veh"];

_AllAlivePlayers = call MRH_fnc_AllAlivePlayers;
_numberalive = count _AllAlivePlayers;
_numberinveh = 0;
{if (_x in _veh) then {_numberinveh = _numberinveh + 1};} forEach _AllAlivePlayers;
_return = 0;
if (_numberinveh == _numberalive) then {_return = 1};
_return
