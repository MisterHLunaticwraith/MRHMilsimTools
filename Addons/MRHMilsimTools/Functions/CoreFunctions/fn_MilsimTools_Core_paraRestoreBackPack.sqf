/*
Function name:MRH_fnc_MilsimTools_Core_paraRestoreBackPack
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[player]spawn MRH_fnc_MilsimTools_Core_paraRestoreBackPack;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
waitUntil {((getPosATL _unit) select 2)>5};
waitUntil {isTouchingGround _unit};
sleep 1;
_gwh = "Weapon_Empty" createVehicle position _unit; 
_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];
sleep 2;
_loadoutToRestore = _unit getVariable "MRH_Utilities_Parachute_Jump_loadOutBeforeJump";
_dummyToDelete = _unit getVariable "MRH_Utilities_Parachute_Jump_DummyBP";
deleteVehicle _dummyToDelete;
_unit setUnitLoadout _loadoutToRestore;