/*
Function name:MRH_fnc_MilsimTools_RadioChatter_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
true call MRH_fnc_MilsimTools_RadioChatter_killAllRadios;

*/
#include "MRH_C_Path.hpp"
params[["_kill",true]];
missionNamespace setVariable ["MRH_MilsimTools_RadioChatter_radiosAreKilled",_kill,true];
private _allMissionRadios = missionNamespace getVariable ["MRH_MilsimTools_RadioChatter_AllMissionRadios",[]];
{
			_x setVariable ["MRH_RadioChatter_RadioOn",false,true];
}forEach _allMissionRadios;