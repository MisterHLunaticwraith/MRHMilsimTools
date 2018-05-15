_checkParams = params ["_object","_spawnPosObject",["_Type", "All", ["All", "Air", "Land"]]];

[_object] execVM "\MRHVehicleSpawner\scripts\scr_aceAddaction.sqf";


if !(isNil "_spawnPosObject") then { _object setVariable ["SpawnPosObject", _spawnPosObject, true]};
if (isNil "_Type") then { _object setVariable ["TypeToSpawn", "All", true]} else {_object setVariable ["TypeToSpawn", _Type, true]};
if (isNil "_spawnPosObject") then {[] Spawn { waitUntil {Time>1};systemChat "MRHSpawner error: No spawn was defined spawn will be set behind source object";}};
if !(_checkParams) then {[] Spawn {waitUntil {Time>1};systemChat "MRHSpawner error: wrong type defined. Type must be 'All' or 'Air' or 'Land'. Default value will be set to 'all'";}};
//hint str _checkParams;
