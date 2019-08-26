/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_openInterface
Author: Mr H.
Description:Opens the interface and refreshes the various lists
Return value: None
Public:No
Parameters: None
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_openInterface;
*/
#include "MRH_C_Path.hpp"
_handle = createDialog "MRHInsertionInterface";
FUNC(fillVehCombo);
FUNC(fillGrpCombo);
FUNC(startPosMark);
FUNC(fillInsertionTypeCombo);


FUNC(fillPlayersToAddList);
FUNC(fillPlayersToGoList);
FUNC(fillGearToAddList);
FUNC(fillGearLoadedList);
FUNC(updateVarList);



