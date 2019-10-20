/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_station"];
if (is3DEN) exitWith {};
if !(isServer && (isClass (configFile>>'cfgPatches'>>'acre_main'))) exitWith {};
systemChat str _station;
[
    {_this == _this}, 
    {
		[_this, {true}] call acre_api_fnc_initVehicleRacks;
	}, 
    _station
] call CBA_fnc_waitUntilAndExecute;
