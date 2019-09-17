/*
Function name:MRH_fnc_MilsimTools_FireSupport_onSupplierDestroyed
Author: Mr H.
Description: Fired by event handler when the plane that was delivering the supply is destroyed, resets variables and plays a message
Return value:None
Public:No
Parameters:
0-<OBJECT> plane that fired the killed EH
Example(s):
[_this] call MRH_fnc_MilsimTools_FireSupport_onSupplierDestroyed;

*/
#include "MRH_C_Path.hpp"
params ["_unit"];
_caller = _unit getVariable "MRH_MilsimTools_SupplyDrop_caller";
missionNamespace setVariable ["MRH_FireSupport_isAvailableSUPPLYfor_"+ str (side _caller),true,true];
if ((group MRH_player) != (group _caller)) ExitWith {};
		playSound "MRH_HeliTaxi_ReaperDown";
[side _caller, "HQ"] sideChat format [localize "STR_MRH_FireSupport_SC_SuplierDestroyedMessage",(_caller getVariable "MRH_MilsimTools_Core_PlayerIntel") select 0];