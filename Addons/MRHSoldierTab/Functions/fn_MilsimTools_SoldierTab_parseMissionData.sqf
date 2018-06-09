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
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_configSetData = [(missionConfigFile >> "MRH_SoldierTabData")]call BIS_fnc_getCfgSubClasses;
if(_configSetData isEqualTo []) ExitWith {Diag_Log "MRH MilsimTools Soldiers Tab: no data defined in mission description.ext";};

MNSVAR(missionData,_configSetData,true);