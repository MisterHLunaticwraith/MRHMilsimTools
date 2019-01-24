/*
Function name:MRH_fnc_MilsimTools_AddonName_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_AddonName_;
*/
#include "MRH_C_Path.hpp"

#include "MRH_MODULE_FUNC_MACROS_INC.sqf"
deleteVehicle _logic;
_handle = createDialog "MRHZeusMHeliPerSide";
_display = findDisplay 11012019;
#define CTRLF(ARG) ((_display) displayCtrl ARG)

_EASTEDIT = CTRLF(1401);
_WESTEDIT = CTRLF(1400);
_GUEREDIT = CTRLF(1402);
_CIVEDIT = CTRLF(1403);



_EAST = missionNamespace getVariable "MRH_MilsimTools_HeliTaxi_simultaneousPerSide_EAST";
_WEST = missionNamespace getVariable "MRH_MilsimTools_HeliTaxi_simultaneousPerSide_WEST";
_GUER = missionNamespace getVariable "MRH_MilsimTools_HeliTaxi_simultaneousPerSide_GUER";
_CIV = missionNamespace getVariable "MRH_MilsimTools_HeliTaxi_simultaneousPerSide_CIV";



_EASTEDIT ctrlSetText str _EAST;
_WESTEDIT ctrlSetText str _WEST;
_GUEREDIT ctrlSetText str _GUER;
_CIVEDIT ctrlSetText str _CIV;

_NOTIFY = CTRLF(2800);
_NOTIFY cbSetChecked true;
