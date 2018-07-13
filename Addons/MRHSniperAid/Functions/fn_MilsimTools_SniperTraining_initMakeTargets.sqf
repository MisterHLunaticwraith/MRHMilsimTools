/*
Function name:MRH_fnc_MilsimTools_SniperTraining_initMakeTarget
Author: Mr H.
Description: Called at init makes object named TAG_TrainingTarget_someName listed targets
Return value:None
Public: No (but make the naming convention public)
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_initMakeTarget;
*/
#include "MRH_C_Path.hpp"
_allObjects = allMissionObjects "";
{
_check = str _x splitString "_";
if ((_check select 1) == "TrainingTarget") then {[_x] call MRH_fnc_MilsimTools_SniperTraining_isTarget;};


} forEach _allObjects;