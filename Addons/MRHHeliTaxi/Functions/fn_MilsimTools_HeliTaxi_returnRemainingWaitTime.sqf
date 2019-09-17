/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
[side player]call MRH_fnc_MilsimTools_HeliTaxi_returnRemainingTime;
*/
#include "MRH_C_Path.hpp"
params ["_side",["_setting","MRH_MilsimTools_MEDEVAC_DelayBetween"]];
_lastCall = missionNamespace getVariable [(_setting+"_"+ (str _side)),"NOFIRSTCALL"];
if (typeName _lastCall isEqualTo "STRING") exitWith {[true,0,"00:00"]};
_waitTimeSetting = [_setting] call cba_settings_fnc_get;
_nextCallTime = _lastCall + _waitTimeSetting;

_currentTime = CBA_missionTime;
_remaining = _nextCallTime - CBA_missionTime;
_canCall = false;
if (_remaining <=0) then {_remaining = 0;_canCall = true};
_remainingReadable = [_remaining,"MM:SS"] call BIS_fnc_secondsToString;
[_canCall,_remaining,_remainingReadable]