/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_unprepObject
Author: Mr H.
Description: Opened from prep menu, removes object from prepped/restets vars
Return value:None
Public: No
Parameters:None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_unprepObject;
*/
#include "MRH_C_Path.hpp"
closeDialog 0;
_object =MRH_player GVAR(currentAdressedLoadingObj);
[_object, side MRH_player,false] FUNC(isAirDropSupply);
MRH_player SVAR(currentAdressedLoadingObj,nil,false);
hintC (localize "STR_MRH_MRHInsertionHandler_HCObjectRmvList");