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
params ["_display"];
//_display = findDisplay 220119;

(_display getVariable ['MRH_ZeusModules_displayparams',[objNull,objNull]]) params ['_logic','_unit']; 
deleteVehicle _logic;

_dataToRestore = _display getVariable ["MRH_DataCreator_dataStateATLoad",[]];

_dataToRestore params ["_savedMissionData","_savedMissionDataSubs"];

missionNamespace setVariable ["MRH_SoldierTab_missionData",_savedMissionData,true];
missionNamespace setVariable ["MRH_SoldierTab_missionDataSubs",_savedMissionDataSubs,true];