/*
Function name: MRH_fnc_MilsimTools_SoldierTab_parseCfgPictures
Author: Mr H.
Description: parses configFile cfg  MRH_SoldierTabIntelPictures and puts them in a missionnamespace variable "MRH_SoldierTabIntelPictures" readable everywhere
each picture is set in format [classname,caption,path] (strings)
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_parseCfgPictures;
*/
#include "MRH_C_Path.hpp"
_missionPics = missionNamespace getVariable ["MRH_SoldierTab_missionPics",[]];
_configSetPics = [(configFile >> "MRH_SoldierTabIntelPictures")]call BIS_fnc_getCfgSubClasses;
if(_configSetPics isEqualTo []) ExitWith {Diag_Log "MRH MilsimTools Soldiers Tab: no pictures defined in any addon";};
_arrayToPush = [];
{
	_caption = gettext (configFile >> "MRH_SoldierTabIntelPictures" >> _x >> "captionText");
	_picturePath = gettext (configFile >> "MRH_SoldierTabIntelPictures" >> _x >> "picture");
	_arrayToPush pushBackUnique [_x,_caption,_picturePath];
}forEach _configSetPics;
_missionPics append _arrayToPush;
MNSVAR(missionPics,_missionPics,true);