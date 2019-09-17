/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"
params ["_heli"];
_isPhysical= _heli GVARDef(isPhysicalHeli,false);
if (_isPhysical) then {[_heli]FUNC(landAtHomeBase);}else {[_heli]FUNC(goAwayAndDespawn);};
