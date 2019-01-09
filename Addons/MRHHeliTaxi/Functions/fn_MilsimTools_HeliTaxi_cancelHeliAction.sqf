/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_cancelHeliAction;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_cancelHeliAction;
*/
#include "MRH_C_Path.hpp"
_assignedHeli = (group player) GVAR(slavedHeli);
[[_assignedHeli],MRH_fnc_MilsimTools_HeliTaxi_onHeliCancelled] remoteExec ["Spawn",2];