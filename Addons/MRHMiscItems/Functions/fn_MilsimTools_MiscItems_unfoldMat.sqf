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
params ["_color"];
_className = "MRH_ShootingMat_" + _color;
MRH_player removeItem _className;
_mat= createVehicle [_className, (MRH_player modelToworld [0,1,0]), [], 0, "CAN_COLLIDE"];
_mat setDir (getDir MRH_player);
_mat setVectorUp surfaceNormal position _mat;