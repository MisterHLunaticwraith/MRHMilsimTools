/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_onSupplierDestroyed;

*/
#include "MRH_C_Path.hpp"
params ["_unit"];
_caller = _unit getVariable "MRH_MilsimTools_SupplyDrop_caller";
missionNamespace setVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ str (side _caller),true,true];
if ((group player) != (group _caller)) ExitWith {};
		playSound "MRH_HeliTaxi_ReaperDown";
[side _caller, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SuplierDestroyedMessage",(_caller getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];