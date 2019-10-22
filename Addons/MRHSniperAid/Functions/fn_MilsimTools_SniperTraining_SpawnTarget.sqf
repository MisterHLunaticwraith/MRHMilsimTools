/*
Function name:MRH_fnc_MilsimTools_SniperTraining_SpawnTarget
Author: Mr H.
Description: Spawns target from the spawning interface
Return value: None
Public: No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_SniperTraining_SpawnTarget;
*/
#include "MRH_C_Path.hpp"
_spawnPos = lbData [1500,lbCurSel 1500];

if (_spawnPos == "") ExitWIth {systemchat (localize "STR_MRH_SniperTraining_NoPosSelect")};
_targetType = lbData [2100,lbCurSel 2100];
if (_targetType == "") ExitWIth {systemchat (localize "STR_MRH_SniperTraining_NoTypeSelect")};
_targetBehaviour = lbData [2101,lbCurSel 2101];
if (_targetBehaviour == "") ExitWIth {systemchat (localize "STR_MRH_SniperTraining_NoBehaviorSet")};
_targetSpeed = lbData [2102,lbCurSel 2102];
if (_targetSpeed == "") ExitWith {systemchat "STR_MRH_SniperTraining_NoSpeedSelected"};
_patrolDis = ctrlText 1400;

_patrolDis = parseNumber _patrolDis;
//systemChat str _patrolDis;
//onEachFrame{systemchat str lbData [1500,lbCurSel 1500]}; 
//systemchat format ["targetbeh %1, _targetSpeed %2 , ", str _targetBehaviour, str _targetSpeed];
_toCreate = getText (missionConfigFile >> "cfgMRHTargets" >> _targetType >> "configRef");
if !(_toCreate isKindOf "Man") then {
_veh = createVehicle [_toCreate, call compile _spawnPos, [], 0, "NONE"];
createVehicleCrew _veh;
_unit = crew _veh select 0;
_unit setCombatMode _targetBehaviour;
_grp = group _unit;
_grp setBehaviour "SAFE";
_unit setSpeedMode _targetSpeed;
if !(_patrolDis <= 0) then {
private _success = [_grp, getPos _unit, _patrolDis] call BIS_fnc_taskPatrol;
};
[_veh] call MRH_fnc_MilsimTools_SniperTraining_isTarget;
{
[_x] call MRH_fnc_MilsimTools_SniperTraining_isTarget;
}forEach crew _veh;
} 
else {
_grp = createGroup east;
_unit = _grp createUnit [_toCreate,  call compile _spawnPos, [], 0, "NONE"];   
_unit setCombatMode _targetBehaviour;
_grp setBehaviour "SAFE";
_unit setSpeedMode _targetSpeed;
if !(_patrolDis <= 0) then {
private _success = [_grp, getPos _unit, _patrolDis] call BIS_fnc_taskPatrol;
};

[_unit] call MRH_fnc_MilsimTools_SniperTraining_isTarget; };