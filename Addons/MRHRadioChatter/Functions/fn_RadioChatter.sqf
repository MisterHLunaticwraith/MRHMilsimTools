/*

[this, "US"] call MRH_fnc_RadioChatter;
*/
#include "MRH_C_Path.hpp"
if (!isServer) ExitWith {};
params ["_sourceObject","_faction"];
_sourceObject setVariable ["MRH_RadioChatter_RadioOn",true,true];
//_sourceObject setVariable ["MRH_RadioChatter_Faction",_faction,true];
_configSource = "";
_allsounds = getarray (missionConfigFile>>"cfgMRHFactionSounds">>_faction>>"allSounds");
if !(_allsounds isEqualTo []) then {_configSource = missionConfigFile};
if (_allsounds isEqualTo []) then {_allsounds = getarray (configFile>>"cfgMRHFactionSounds">>_faction>>"allSounds");_configSource = configFile;};
if (_allsounds isEqualTo []) ExitWith {_debug = format ["MRH Radio Chatter - Error, no sounds defined for faction %1", _faction]; diag_log _debug; systemChat _debug;};


[_sourceObject,_allsounds,_configSource] spawn 
{
params ["_sourceObject","_allsounds","_configSource"];
waitUntil {time>1};
while {_sourceObject getVariable ["MRH_RadioChatter_RadioOn",false]} do 
	{
	private ["_soundLength","_soundToPlay","_sleep"];
	_soundToPlay = selectRandom _allsounds;
	
	_soundLength = getNumber (_configSource>>"cfgSounds">>_soundToPlay>>"soundLength");
	if (isNil "_soundLength") ExitWith {systemchat format ["MRH Radio Chatter Error : sound %1 has no length defined, please check configfile",_soundToPlay];};
	_debug2 =  format ["MRHRadioChatter - sound %1, soundLength %2 configFile %3", _soundToPlay, _soundLength, str _configSource]; //debug
	TRACE( _debug2);
	
	if !(_sourceObject getVariable ["MRH_RadioChatter_RadioOn",false]) ExitWith {};
	[_soundToPlay,_sourceObject]CFUNC(playSound3D);
	/*
		[[_sourceObject,_soundToPlay],
		{
		params ["_sourceObject","_soundToPlay"];
		_sourceObject say3D _soundToPlay;
		}] RemoteExec ["Spawn",[0,-2] select isDedicated,false];
		*/
	_soundLength = _soundLength +1;
	sleep _soundLength;
	_sleep = random [2, 15, 30];
	_debug3 = format ["MRHRadioChatter - Randomsleep %1", str _sleep];
	TRACE(_debug3);
	
	
	sleep _sleep;
	};

};