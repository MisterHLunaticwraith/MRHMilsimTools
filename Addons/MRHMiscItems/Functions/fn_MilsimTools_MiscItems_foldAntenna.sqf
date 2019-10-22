/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_foldAntenna;
*/
#include "MRH_C_Path.hpp"
params ["_storePos"];
private _holder = 'groundweaponholder' createVehicle _storePos; 
_holder addItemCargoGlobal ['MRH_MT_FoldedSatcomAntenna',1];
_holder setPosATL _storePos;