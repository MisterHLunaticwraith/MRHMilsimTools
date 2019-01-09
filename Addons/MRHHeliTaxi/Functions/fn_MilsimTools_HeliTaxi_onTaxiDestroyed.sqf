/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_;
*/
#include "MRH_C_Path.hpp"

params ["_veh"];
[_veh,"Destroyed"]FUNC(handleMessages);
_ownerGrp = _veh GVAR(ownerGroup);
_destination = _veh GVAR(userSetDestination);
[_ownerGrp,_destination,true]FUNC(createDeleteMarkerForGroup);
[_veh]FUNC(resetVariables);