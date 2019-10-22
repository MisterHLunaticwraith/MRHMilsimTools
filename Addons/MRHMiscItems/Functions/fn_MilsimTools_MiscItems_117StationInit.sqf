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
if !(isServer) exitWith {};
if !(isClass (configFile>>'cfgPatches'>>'acre_main')) exitWith {TRACE("ACRE NOT DETECTED ON SERVER")};

[
    {((_this == _this) && time>1)}, 
    {
		private _initCheck = [_this, {true}] call acre_api_fnc_initVehicleRacks;
        private _toTrace = format ["Rack initiated on server for station %1: %2",_this,_initCheck];
        TRACE(_toTrace);
	}, 
    _station
] call CBA_fnc_waitUntilAndExecute;
