/*
Function name: MRH_fnc_MilsimTools_SoldierTab_parseMissionData
Author: Mr H.
Description: parses missionconfigfile cfg  MRH_SoldierTabData and puts them in a missionnamespace variable "MRH_SoldierTab_missionData" readable everywhere

Return value: none
Public: no
Parameters: none
Example(s):
call MRH_fnc_MilsimTools_SoldierTab_parseMissionData;
*/
#include "MRH_C_Path.hpp"
//list of all data
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_configSetData = [(missionConfigFile >> "MRH_SoldierTabData")]call BIS_fnc_getCfgSubClasses;
if(_configSetData isEqualTo []) ExitWith {Diag_Log "MRH MilsimTools Soldiers Tab: no data defined in mission description.ext"; call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseMissionDataFromAddon.sqf';};

MNSVAR(missionData,_configSetData,true);

//list containing the data [entry,titleEntry,titleData,[[dataTitle,dataSub]]]
_missionDataSubs = missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];
{

_Data = _x;
_titleEntry =  gettext (missionConfigFile>>"MRH_SoldierTabData">>_x>>"title");
_titleData =    getText (missionConfigFile >> "MRH_SoldierTabData">>_x>>"text");

_subSections =  [(missionConfigFile >> "MRH_SoldierTabData">>_x)]call BIS_fnc_getCfgSubClasses;
_subsArray = [];
	{
	
	_subTitle = gettext (missionConfigFile>>"MRH_SoldierTabData">>_Data >> _x >> "titleSub");
	//_dataSubPath = str (missionConfigFile>>"MRH_SoldierTabData">>_mainEntry >> _x);
	_subText = gettext (missionConfigFile>>"MRH_SoldierTabData">>_Data >> _x >> "textSub");
	_entryArray = [_subTitle,_subText];
	_subsArray pushBackUnique _entryArray;
	}forEach _subSections;
_mainArray = [_data,_titleEntry,_titleData,_subsArray];
_missionDataSubs pushBackUnique _mainArray;
} forEach _configSetData;

MNSVAR(missionDataSubs,_missionDataSubs,true);

 call compile preProcessFileLineNumbers '\MRHSoldierTab\Functions\fn_MilsimTools_SoldierTab_parseMissionDataFromAddon.sqf';