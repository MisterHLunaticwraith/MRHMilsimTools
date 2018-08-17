/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_unprepObject
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_unprepObject;
*/
#include "MRH_C_Path.hpp"
closeDialog 0;
_object =player GVAR(currentAdressedLoadingObj);
[_object, side player,false] FUNC(isAirDropSupply);
player SVAR(currentAdressedLoadingObj,nil,false);
hintC (localize "STR_MRH_MRHInsertionHandler_HCObjectRmvList");