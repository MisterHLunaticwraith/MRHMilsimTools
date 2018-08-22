/*
Function name:MRH_fnc_MilsimTools_HeliTaxi_ClimbIn;
Author: Mr H.
Return value: 
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_HeliTaxi_conditionClimbIn;
*/
#include "MRH_C_Path.hpp"
params ["_target"];
_cond = _target GVARDef(isHoveringAtSea,false);
_isFull = ([_target] CFUNC(ReturnEmptyCargoSlots)) select 0;
if (_isFull) then {_cond = false};
_cond