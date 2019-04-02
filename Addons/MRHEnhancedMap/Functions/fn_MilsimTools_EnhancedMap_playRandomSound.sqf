/*
Function name:MRH_fnc_MilsimTools_EnhancedMap_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_EnhancedMap_;
*/
#include "MRH_C_Path.hpp"
_allsoundPaths = 
[
	"MRHEnhancedMap\MapFoldSounds\MRH_EHM_Mapfold_1.ogg",
	"MRHEnhancedMap\MapFoldSounds\MRH_EHM_Mapfold_2.ogg",
	"MRHEnhancedMap\MapFoldSounds\MRH_EHM_Mapfold_3.ogg",
	"MRHEnhancedMap\MapFoldSounds\MRH_EHM_Mapfold_4.ogg",
	"MRHEnhancedMap\MapFoldSounds\MRH_EHM_Mapfold_5.ogg"
];
_soundToPlay = selectRandom _allsoundPaths;
playSound3D [_soundToPlay, MRH_player];
true