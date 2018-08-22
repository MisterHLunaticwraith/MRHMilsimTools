/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_onCallerKilled;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_onCallerKilled;
*/
#include "MRH_C_Path.hpp"


params ["_caller"];

_newCaller = [_caller]FUNC(reassignCaller);

_ehIndex = _caller GVAR(KilledEHIndex);
_caller removeEventHandler ["Killed", _ehIndex];


_EHHeliownerKilled = _newCaller addEventHandler ["Killed", {
params ["_unit", "_killer", "_instigator", "_useEffects"];
[_unit] FUNC(onCallerKilled);
}];
_newCaller SVAR(KilledEHIndex,_EHHeliownerKilled,true);


