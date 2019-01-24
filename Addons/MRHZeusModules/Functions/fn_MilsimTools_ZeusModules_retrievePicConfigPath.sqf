/*
Function name:MRH_fnc_MilsimTools_ZeusModules_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_ZeusModules_;
*/
#include "MRH_C_Path.hpp"
//uncomment the following for funcs called by modules
//#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
params ["_configEntry"];
_return = "Error";
_picFromMiss = getText (missionConfigFile>>"MRH_SoldierTabIntelPictures">>_configEntry>>"picture");
if !(_picFromMiss isEqualTo "") exitWith {_picFromMiss};

_picFromAddon = getText (ConfigFile>>"MRH_SoldierTabIntelPictures">>_configEntry>>"picture");
if !(_picFromAddon isEqualTo "") exitWith {_picFromAddon};
_return