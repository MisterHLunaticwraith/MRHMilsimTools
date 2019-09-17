/*
Function name:MRH_fnc_MilsimTools_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[] call MRH_fnc_MilsimTools_FireSupport_conditionsShowAvailability;

*/
#include "MRH_C_Path.hpp"
_condition = false;
{
	if ([_x]call cba_settings_fnc_get) then {_condition = true};
}forEach ["MRH_MilsimTools_FireSupport_Supplies_useSupplyDrops","MRH_MilsimTools_MEDEVAC_UseMedEVACInMission","MRH_MilsimTools_FireSupport_useFireSupport","MRH_MilsimTools_FireSupport_useCASSupport"];
if (!isFormationLeader MRH_player) then {_condition = false}; // too tedious an resource consuming to check for all custom conditions
_condition