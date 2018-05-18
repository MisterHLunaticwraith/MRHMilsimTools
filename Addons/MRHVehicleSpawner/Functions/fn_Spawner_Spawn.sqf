/*
Function name: MRH_fnc_Spawn
Author: Mr H.
Description: Spawns selected Vehicle
Return value: none
Public: No
Parameters: None
Example(s):
call MRH_fnc_Spawner_Spawn;
*/

[] Spawn {
_type = uinamespace getVariable "MRH_Spawner_tospawnclassname";
_sourceposition = player getVariable "SourceObjectSpawner";
_spawnPos = nil;
_spawnObject = _sourceposition getVariable "SpawnPosObject";
_spawnDir = nil;
if (isNil "_spawnObject") then {_spawnpos = _sourceposition modelToWorld [0,-30,0]; _spawnDir = 0;} else {_spawnpos = getPos _spawnObject; _spawnDir = getDir _spawnObject; };

waitUntil {!isNil "_spawnpos"};
///////clear spawn

_erasing = [_spawnPos, _spawnDir] Spawn {
{
params ["_spawnPos","_spawnDir"];
_distance = _x distance _spawnpos;
_wasCreated = _x getVariable "isMRHSpawnerCreatedVehicle";
if (isNil "_wasCreated") then {_wasCreated = false;};
if (_distance < 5 && _wasCreated) then {deleteVehicle _x};
} forEach Vehicles;
sleep 0.5;
hint localize "STR_MRH_SPAWNER_GENERATING1";
sleep 0.5;
hint localize "STR_MRH_SPAWNER_GENERATING2";
sleep 0.5;
hint localize "STR_MRH_SPAWNER_GENERATING3";
sleep 0.5;
hint localize "STR_MRH_SPAWNER_GENERATING4";
};
waitUntil {scriptDone _erasing};
////create new vehicle
_veh = _type createVehicle _spawnpos;
_veh setDir _spawnDir;
_veh setVariable ["isMRHSpawnerCreatedVehicle", true, true];
hint localize "STR_MRH_SPAWNER_VEHCREATED";
};