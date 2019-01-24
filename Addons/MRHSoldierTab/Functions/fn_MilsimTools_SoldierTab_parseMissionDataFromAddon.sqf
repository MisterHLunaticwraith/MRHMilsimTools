/*
Function name: MRH_fnc_MilsimTools_SoldierTab_
Author: Mr H.
Description: refreshes home page
Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_;
*/
#include "MRH_C_Path.hpp"
//list of all data
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_configSetData = [(configFile >> "MRH_SoldierTabData")]call BIS_fnc_getCfgSubClasses;
if(_configSetData isEqualTo []) ExitWith {Diag_Log "MRH MilsimTools Soldiers Tab: no data defined in any addon";};
_missionData append _configSetData;
MNSVAR(missionData,_missionData,true);

//list containing the data [entry,titleEntry,titleData,[[dataTitle,dataSub]]]
_missionDataSubs = missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];
{

_Data = _x;
_titleEntry =  gettext (configFile>>"MRH_SoldierTabData">>_x>>"title");
_titleData =    getText (configFile >> "MRH_SoldierTabData">>_x>>"text");

_subSections =  [(configFile >> "MRH_SoldierTabData">>_x)]call BIS_fnc_getCfgSubClasses;
_subsArray = [];
	{
	
	_subTitle = gettext (configFile>>"MRH_SoldierTabData">>_Data >> _x >> "titleSub");
	//_dataSubPath = str (configFile>>"MRH_SoldierTabData">>_mainEntry >> _x);
	_subText = gettext (configFile>>"MRH_SoldierTabData">>_Data >> _x >> "textSub");
	_entryArray = [_subTitle,_subText];
	_subsArray pushBackUnique _entryArray;
	}forEach _subSections;
_mainArray = [_data,_titleEntry,_titleData,_subsArray];
_missionDataSubs pushBackUnique _mainArray;
} forEach _configSetData;

MNSVAR(missionDataSubs,_missionDataSubs,true);