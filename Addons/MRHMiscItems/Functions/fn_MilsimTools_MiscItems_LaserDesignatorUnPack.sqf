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
_className= "MRH_laser_designator";
MRH_player removeItem _className;
_LD= createVehicle [_className, (MRH_player modelToworld [0,1.2,0]), [], 0, "CAN_COLLIDE"];
_LD setDir (getDir MRH_player);
_LD setVectorUp surfaceNormal position _LD;
createVehicleCrew _LD;

[MRH_player, _LD] call ace_dragging_fnc_startCarry;