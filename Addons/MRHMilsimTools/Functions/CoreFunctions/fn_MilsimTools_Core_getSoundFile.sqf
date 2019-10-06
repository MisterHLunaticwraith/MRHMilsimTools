/*
Function name:MRH_fnc_MilsimTools_Core_getSoundFile
Author: Mr H.
Description: returns soundPathString without "\" at the beginning compliant with use with playsound3D if sound is stored in missionconfigFile missionRoot will be added to the path. Doesn't worf with campaignconfigfile
Return value: <STRING> path to the soundfile
Public: No
Parameters:
0-<STRING> className of the sound as declared in cfgSounds (either in mission or config)
Example(s):
["TAG_mySound"]call MRH_fnc_MilsimTools_Core_getSoundFile;
*/
#include "MRH_C_Path.hpp"
params ["_className"];
private _config = [missionConfigfile,configFile] select (isClass (configFile>>"cfgSounds">>_className));
private _configPath = _config>>"cfgSounds">>_className;

if !(isClass (_configPath)) exitWith {private _toTrace = format ["%1 Sound class not found in mission config file or configfile",_className]; TRACE(_toTrace);false};
private _soundPath = (getArray (_configPath>>"sound")) select 0;
private _soundPathFormated= _soundPath splitString "";
if ((_soundPathFormated select 0)isEqualTo "\") then {_soundPathFormated deleteAt 0};
private _return = _soundPathFormated joinString "";
if (_config isEqualTo missionConfigFile) then {_return = MRH_MISSION_ROOT + _return};
_return