[] Spawn {
_type = uinamespace getVariable "tospawnclassname";
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
hint "Génération du véhicule en cours.";
sleep 0.5;
hint "Génération du véhicule en cours..";
sleep 0.5;
hint "Génération du véhicule en cours..";
sleep 0.5;
hint "Génération du véhicule en cours....";
};
waitUntil {scriptDone _erasing};
////create new vehicle
_veh = _type createVehicle _spawnpos;
_veh setDir _spawnDir;
_veh setVariable ["isMRHSpawnerCreatedVehicle", true, true];
hint "Véhicule créé";
};