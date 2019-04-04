/*
Function name:MRH_fnc_MilsimTools_MiscItems_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
[MRH_ShootingMat_Olive]call MRH_fnc_MilsimTools_MiscItems_returnMatColor;
*/
#include "MRH_C_Path.hpp"
params ["_matobject"];
_type= typeOf _matobject;
_return= (_type splitString "_") select 2;
_return