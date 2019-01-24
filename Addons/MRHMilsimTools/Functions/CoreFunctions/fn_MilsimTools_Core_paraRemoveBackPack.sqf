/*
Function name:MRH_fnc_MilsimTools_Core_paraRemoveBackPack
Author: Mr H.
Description: 
Return value: 
Public: No
Parameters:

Example(s):
[]call MRH_fnc_MilsimTools_Core_paraRemoveBackPack;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
_unitLoadOut = getUnitLoadout _unit;
_unit setVariable ["MRH_Utilities_Parachute_Jump_loadOutBeforeJump",_unitLoadOut,true];


_gwh = "Weapon_Empty" createVehicle position _unit;
_unit action ["DropBag", _gwh, typeOf unitBackpack _unit];

_gwh attachTo [_unit,[0,0,-0.1],"pelvis"];


_gwh setVectorDirandUp [[-0.25,-1,0],[0,0,-1]];
_unit setVariable ["MRH_Utilities_Parachute_Jump_DummyBP",_gwh,true];