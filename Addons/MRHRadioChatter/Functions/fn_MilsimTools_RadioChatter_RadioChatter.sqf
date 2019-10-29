/*
Function name:MRH_fnc_MilsimTools_RadioChatter_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_RadioChatter_;
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
private _allMissionRadios = missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_AllMissionRadios",[]];
_allMissionRadios pushBackUnique _sourceObject;
missionNameSpace setVariable ["MRH_MilsimTools_RadioChatter_AllMissionRadios",_allMissionRadios];

[_sourceObject,_allsounds,_configSource] FUNC(radioLoop);
