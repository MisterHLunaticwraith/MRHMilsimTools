/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_resetVariables;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_resetVariables;
*/
#include "MRH_C_Path.hpp"
params ["_heli"];

//retrieve owner group
_ownerGrp = _heli GVAR(ownerGroup);
// change availability count for side
[side _ownerGrp]FUNC(availabilityCountUpdate);
//reset vars for grp
_ownerGrp SVAR(isUsingHeli,false,true); //the group currently uses a heli
_ownerGrp SVAR(slavedHeli,nil,true); //used heli
//remove killed EH from caller 
_caller = _heli GVAR(caller);
Diag_log format ["MRH_MilsimTools_HeliTaxi. Caller found %1",str _caller];
_ehIndex = _caller GVAR(KilledEHIndex);
_caller removeEventHandler ["Killed", _ehIndex];