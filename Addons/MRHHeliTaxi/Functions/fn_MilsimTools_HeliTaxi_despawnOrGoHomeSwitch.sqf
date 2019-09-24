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
_heli limitSpeed 9999;
_ownerGrp = _heli GVAR(ownerGroup);
[_ownerGrp,[0,0,0],"",true]FUNC(createDeleteMarkerForGroup);
_isPhysical= _heli GVARDef(isPhysicalHeli,false);
if (_isPhysical) then {[_heli]FUNC(landAtHomeBase);}else {[_heli]FUNC(goAwayAndDespawn);};
