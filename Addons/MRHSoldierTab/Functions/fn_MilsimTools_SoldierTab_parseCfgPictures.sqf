/*
Function name: MRH_fnc_MilsimTools_SoldierTab_parseCfgPictures
Author: Mr H.
Description: parses missionconfigfile cfg  MRH_SoldierTabIntelPictures and puts them in a missionnamespace variable "MRH_SoldierTabIntelPictures" readable everywhere
each picture is set in format [classname,caption,path] (strings)
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_parseCfgPictures;
*/
#include "MRH_C_Path.hpp"
_missionPics = missionNamespace getVariable ["MRH_SoldierTab_missionPics",[]];
_configSetPics = [(missionConfigFile >> "MRH_SoldierTabIntelPictures")]call BIS_fnc_getCfgSubClasses;
if(_configSetPics isEqualTo []) ExitWith {Diag_Log "MRH MilsimTools Soldiers Tab: no pictures defined in mission description.ext";call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseCfgPicturesFromAddon.sqf';};
_arrayToPush = [];
{
	_caption = gettext (missionConfigFile >> "MRH_SoldierTabIntelPictures" >> _x >> "captionText");
	_picturePath = gettext (missionConfigFile >> "MRH_SoldierTabIntelPictures" >> _x >> "picture");
	_arrayToPush pushBackUnique [_x,_caption,_picturePath];
}forEach _configSetPics;
MNSVAR(missionPics,_arrayToPush,true);
call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseCfgPicturesFromAddon.sqf';