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
_world = worldName;
_allMaps = [(ConfigFile >> "MRHMapPictures")]call BIS_fnc_getCfgSubClasses;
_texture = "";
_cfgEntry = "";
if !(_world in _allMaps) then {_cfgEntry = "MRH_default"} else {_cfgEntry = _world};
_texture = getText (ConfigFile >> "MRHMapPictures">>_cfgEntry>>"picturePath");

_this setObjectTextureGlobal [0,_texture];

