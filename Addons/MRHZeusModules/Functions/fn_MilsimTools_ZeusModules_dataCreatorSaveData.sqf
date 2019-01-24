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
params [["_showMessage",false]];

_display = findDisplay 220119;
_DATANAME = (_display displayCtrl 1001);
_DATANAME ctrlSetText (FUNC(dataCreatorGenEntryKey));
_missionData = missionNamespace getVariable ["MRH_SoldierTab_missionData",[]];
_savedMissionData = +_missionData;
_missionDataSubs = missionNamespace getVariable ["MRH_SoldierTab_missionDataSubs",[]];
_savedMissionDataSubs = +_missionDataSubs;
//systemChat format ["aftersave %1  %2",_savedMissionData,_savedMissionDataSubs];
_display setVariable ["MRH_DataCreator_dataStateATLoad",[_savedMissionData,_savedMissionDataSubs]];
if (_showMessage) then {
[objNull,localize "STR_MRH_MRHMRHZeusModules_DATASAVEDMESS"] call BIS_fnc_showCuratorFeedbackMessage;
};