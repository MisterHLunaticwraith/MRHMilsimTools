/*
Function name: MRH_fnc_Spawner
Author: Mr H.
Description: 
This function makes an object a vehicle spawner and gives it an interface, allowed factions, mods and dlcs can ge defined via cba settings by mission makers, the spawner can include all vehicles or filter them by types, (Air Land, Sea)
Return value:None
Public: Yes
Parameters:
0 - <OBJECT> - Source object that serves as a spawner interface, a laptop is appropriate.
1 -<OBJECT>- OPTIONNAL - object that serves as a spawn point, preferably an invisible helipad, note that the vehicle will spawn with the same direction the object has (useful for planes spawning facing the landing strip etc ) if undefined vehicle will be spawned a few meters behind the source object.
2- <STRING> - OPTIONNAL (requires parameter 1 to be defined) - type of vehicles this particular spawner will spawn, can be "Air","Land", "Sea" or "All". If you have multiple spawners in a mission they can all have different types. If undefined type will be "All"
Example(s):
[this] call MRH_fnc_Spawner;
or
[laptop1,helipad1] call MRH_fnc_Spawner;
or
[this,helipad1,"Air"] call MRH_fnc_Spawner;
*/

_checkParams = params ["_object","_spawnPosObject",["_Type", "All", ["All", "Air", "Land","Sea"]]];

[_object] execVM "\MRHVehicleSpawner\scripts\scr_aceAddaction.sqf";


if !(isNil "_spawnPosObject") then { _object setVariable ["SpawnPosObject", _spawnPosObject, true]};
if (isNil "_Type") then { _object setVariable ["TypeToSpawn", "All", true]} else {_object setVariable ["TypeToSpawn", _Type, true]};
if (isNil "_spawnPosObject") then {[] Spawn { waitUntil {Time>1};systemChat "MRHSpawner error: No spawn was defined spawn will be set behind source object";}};
if !(_checkParams) then {[] Spawn {waitUntil {Time>1};systemChat "MRHSpawner error: wrong type defined. Type must be 'All' or 'Air' or 'Land'. Default value will be set to 'all'";}};
//hint str _checkParams;
