/*
Function name:MRH_fnc_MilsimTools_RadioChatter_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RadioChatter_RadioLoop;
*/
#include "MRH_C_Path.hpp"
//--requires to be called post init
if (time <1) exitWith 
{
	[
		{time>1}, 
		{_this FUNC(RadioLoop)}, 
		_this
	] call CBA_fnc_waitUntilAndExecute;
};
if (missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_radiosAreKilled",false])exitWith{};
params ["_sourceObject","_allsounds","_configSource"];
if (_sourceObject getVariable ["MRH_RC_isPlayingSound",false]) exitWith {}; //prevents double executionand spamming
_sourceObject setVariable ["MRH_RC_isPlayingSound",true];
_sourceObject setVariable ["MRH_MilsimTools_RadioChatter_loopParams",_this];

if !(_sourceObject getVariable ["MRH_RadioChatter_RadioOn",false]) exitWith {private _toTrace= format ["Radio source %1 was shut down",_sourceObject];TRACE(_toTrace)};

private ["_soundLength","_soundToPlay","_sleep"];
private _soundToPlay = selectRandom _allsounds;
private _soundLength = getNumber (_configSource>>"cfgSounds">>_soundToPlay>>"soundLength");

if (isNil "_soundLength") ExitWith {systemchat format ["MRH Radio Chatter Error : sound %1 has no length defined, please check configfile",_soundToPlay];};
private _debug2 =  format ["MRHRadioChatter - sound %1, soundLength %2 configFile %3", _soundToPlay, _soundLength, str _configSource];
TRACE( _debug2);
	
if !(_sourceObject getVariable ["MRH_RadioChatter_RadioOn",false]) ExitWith {};//doublecheck
[_soundToPlay,_sourceObject]CFUNC(playSound3D);

_soundLength = _soundLength +1;

private _sleep = random [2, 15, 30];
_sleep = _sleep + _soundLength;
_debug3 = format ["MRHRadioChatter - Randomsleep %1", str _sleep];
TRACE(_debug3);
[
	{
		params ["_sourceObject","_allsounds","_configSource"];
		_sourceObject setVariable ["MRH_RC_isPlayingSound",false];
		_this FUNC(RadioLoop);
	},_this,_sleep] call CBA_fnc_waitAndExecute;
