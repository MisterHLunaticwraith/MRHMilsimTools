/*
Function name:MRH_fnc_MilsimTools_Core_
Author: Mr H.
Description: creates and attaches parachute to non player object
Return value: create chute
Public: No
Parameters:
0 -<OBJECT> to attach the chute to
Example(s):
[]call MRH_fnc_MilsimTools_Core_;
*/
#include "MRH_C_Path.hpp"
params ["_object",["_attach",true]];

_chute = "O_Parachute_02_F" createVehicle (position _object);
_chute setPosATL (getPosATL _object);
if (_attach) then {
_object attachTo [_chute,[0,0,0]];
[_object] FUNC(ensureSafeLanding);
};
_chute