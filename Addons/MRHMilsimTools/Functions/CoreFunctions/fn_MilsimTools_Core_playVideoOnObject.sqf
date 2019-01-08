/*
Function name:MRH_fnc_MilsimTools_Core_playVideoOnObject
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:
Example(s):
[]call MRH_fnc_MilsimTools_Core_playVideoOnObject;
*/
#include "MRH_C_Path.hpp"
_spawnedFunc = _this spawn {
params ["_object","_videoString",["_slot",0]];
		_orgTexts = getObjectTextures _object;
		_object setObjectTextureGlobal [_slot, _videoString];
		_videoplaying = [_videoString,[10,10]] spawn BIS_fnc_playVideo;
		waitUntil {scriptDone _videoPlaying};
		_object setObjectTextureGlobal [_slot,(_orgTexts select _slot)];
};
if (canSuspend) then {waitUntil {scriptDone _spawnedFunc};};
true
/*
[] spawn {
_videoplaying = ["\MRHMiscItems\Videos\handScanMainScreen.ogv"] spawn BIS_fnc_playVideo;
waitUntil {scriptDone _videoPlaying};
sleep 1;
hint "done"
};
*/