/*
Function name:MRH_fnc_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call ;
*/
#include "MRH_C_Path.hpp"
params ["_unitsToDrop","_typeOfPlane","_startPos","_dropPos",["_height",500],["_side",WEST],["_isSteerableChute",false],["_extraGear",[]]];

[[_unitsToDrop,_typeOfPlane,_startPos,_dropPos,_height,_side,_isSteerableChute,_extraGear],MRH_fnc_completeAirInsertion_core] RemoteExec ["Spawn",2];