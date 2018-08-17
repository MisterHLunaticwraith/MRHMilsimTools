/*
Function name:MRH_fnc_MilsimTools_InsertionHandler_
Author: Mr H.
Description:
Return value:
Public:
Parameters:
Example(s):
call MRH_fnc_MilsimTools_InsertionHandler_addToGearListAction;
*/
#include "MRH_C_Path.hpp"
_toAddStr= lbData [1502,(lbCurSel 1502)];
_spaceLeft = FUNC(checkCargoSpace);
if !(_spaceLeft) ExitWith {};
if (_toAddStr == "") ExitWith {systemChat (localize "STR_MRH_MRHInsertionHandler_noGearSelectSC")};
_toAdd = [_toAddStr,"Obj"] CFUNC(stringTo);
_toAdd SVAR(isLoaded,true,true);
FUNC(fillGearToGoList);
FUNC(fillGearLoadedList);
FUNC(refreshCargoRoomIntel);