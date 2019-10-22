/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_MiscItems_;
*/
#include "MRH_C_Path.hpp"
params ["_unit"];
_unit removeItem 'MRH_MT_FoldedSatcomAntenna';
private _antenna = 'MRH_MT_SatCom_Antenna' createVehicle (_unit modelToWorld [0,1,0]);
 _antenna setPosATL (_unit modelToWorld [0,1,0]);
 [_unit, _antenna] call ace_dragging_fnc_startCarry;