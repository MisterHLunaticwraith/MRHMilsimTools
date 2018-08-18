/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_openInterface;
*/
#include "MRH_C_Path.hpp"
_handle = createDialog "MRHInsertionInterface";
FUNC(fillVehCombo);
FUNC(fillGrpCombo);
FUNC(startPosMark);


FUNC(fillPlayersToAddList);
FUNC(fillPlayersToGoList);
FUNC(fillGearToAddList);
FUNC(fillGearLoadedList);
FUNC(updateVarList);


